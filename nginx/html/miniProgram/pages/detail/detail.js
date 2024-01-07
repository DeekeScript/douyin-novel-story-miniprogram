// c:\Users\Administrator\miniprograms\main\pages\detail\detail.js
import api from "../../api";
import config from "../../config";
const app = getApp();

Page({
  data: {
    book: {},
    cate: '',
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    options: {},
    end: false,
    limit: 15,
    page: 1,
    comments: [],
  },
  bookDetail(id) {
    api.get(config.route.bookDetail + "?id=" + id, (res) => {
      let cateId = [];
      for (let i in res.data.cate) {
        cateId.push(res.data.cate[i].CateId);
      }

      this.setData({
        book: res.data,
        cate: cateId.join(','),
      });

      tt.setNavigationBarTitle({
        title: this.data.book.book.NovelName,
      });
    })
  },
  onLoad: function (options) {
    this.setData({
      options: options,
    });
  },
  onShow: function () {
    this.bookDetail(this.data.options.id);
    this.commentList(this.data.options.id);
  },
  onMyEvent(e) {
    // 自定义组件触发事件时提供的detail对象
    this.bookDetail(e.detail.id);
  },

  joinBook(e) {
    api.post(config.route.joinBook, {
      id: e.currentTarget.dataset.id,
      status: this.data.book.userBookDetail.IsCollection
    }, (res) => {
      tt.showToast({
        title: res.msg,
        success: (re) => {
          if (res.code === 0) {
            let book = this.data.book;
            book.userBookDetail.IsCollection = 1 - this.data.book.userBookDetail.IsCollection;
            this.setData({
              book: book,
            })
          }
        },
        fail: (re) => {

        },
      });
    });
  },
  readBook(e) {
    api.get(config.route.canRead + '?bookId=' + e.currentTarget.dataset.id + '&index=' + e.currentTarget.dataset.index, (res) => {
      if (res.code == 0) {
        if (!res.data.canRead) {
          return tt.showModal({
            title: "温馨提示",
            content: "本书需要充值后才可阅读~",
            showCancel: true,
            confirmText: "去充值",
            success: (res) => {
              if (res.confirm) {
                tt.navigateTo({
                  url: "/pages/me/pay/pay?bookId=" + e.currentTarget.dataset.id,
                });
              }
            },
          });
        }

        return tt.navigateTo({
          url: "/pages/bookDetail/bookDetail?id=" + e.currentTarget.dataset.id + '&index=' + e.currentTarget.dataset.index + '&position=' + e.currentTarget.dataset.position,
        });
      }
    });
  },

  copy() {
    api.post(config.route.koulingGenerate, {
      'bookId': this.data.book.book.Id,
    }, (res) => {
      if (res.code === 0) {
        tt.setClipboardData({
          data: res.data.Token,
          success: (res) => {
            tt.showToast({
              title: '口令复制成功',
            });
          },
        });
      }
    });
  },

  copyGoodDetail() {
    tt.setClipboardData({
      data: this.data.book.book.GoodDetail,
      success: (res) => {
        tt.showToast({
          title: '复制成功',
        });
      },
    });
  },
  scrolls() {
    this.setData({
      page: this.data.page + 1,
    }, () => {
      this.commentList(this.data.options.id);
    });
  },
  commentList(bookId) {
    if (this.data.end) {
      return false;
    }
    api.get(config.route.commentList + "?page=" + this.data.page + "&limit=" + this.data.limit + "&bookId=" + bookId, (res) => {
      if (res.code === 0) {
        for (let i in res.data) {
          let d = new Date(res.data[i].CreatedAt * 1000);
          res.data[i].CreatedAtShow = d.getFullYear() + '-' + (d.getMonth() + 1 > 9 ? d.getMonth() + 1 : '0' + (d.getMonth() + 1)) + '-' + (d.getDate() > 9 ? d.getDate() : ('0' + d.getDate())) + ' ' + d.getHours() + ':' + d.getMinutes();
        }
        if (res.data.length < this.data.limit) {
          this.setData({
            end: true,
          });
        }
        res.data = this.data.comments.concat(res.data || []);
        this.setData({
          comments: res.data,
        });
      }
    });
  },
  input: '',
  comment() {
    tt.showModal({
      title: "点评",
      editable: true,
      placeholderText: this.input || "请输入点评内容...",
      success: (res) => {
        this.input = res.content;
        if (res.confirm) {
          api.post(config.route.bookComment, {
            bookId: this.data.options.id * 1,
            content: res.content
          }, (res) => {
            if (res.code == 0) {
              res.data.Nickname = tt.getStorageSync('userinfo').Nickname;
              res.data.Avatar = tt.getStorageSync('userinfo').Avatar;
              this.input = '';
              let d = new Date(res.data.CreatedAt * 1000);
              res.data.CreatedAtShow = d.getFullYear() + '-' + (d.getMonth() + 1 > 9 ? d.getMonth() + 1 : '0' + (d.getMonth() + 1)) + '-' + (d.getDate() > 9 ? d.getDate() : ('0' + d.getDate())) + ' ' + d.getHours() + ':' + d.getMinutes();

              let comments = [res.data];
              comments = comments.concat(this.data.comments || []);
              this.setData({
                comments: comments
              });
            }
            tt.showModal({
              content: res.msg,
              title: "温馨提示",
            });
          });
        } else {
          tt.showToast({
            title: '你取消了点评',
          });
        }
      },
    });
  }
})