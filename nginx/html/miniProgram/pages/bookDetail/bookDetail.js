import api from "../../api";
import config from "../../config";

const app = getApp();
// c:\Users\Administrator\miniprograms\main\pages\bookDetail\bookDetail.js
Page({
  data: {
    item: {},
    index: 1,//第一章节
    status: 0,//0可以阅读，1需要会员才能阅读
    isNight: false,
    textSize: 16,
    changeTextSizeShow: false,
    key: 'bookDetailSetting',
    position: 0,
    canRead: true,
    totalChapter: 0,
    miniPrice: 0,
    bookId: 0,
  },

  onLoad: function (options) {
    tt.setSwipeBackMode(0);//禁止滑动返回，防止调整字体返回了
    const res = tt.getStorageSync(this.data.key);
    if (!res) {
      tt.setStorageSync(this.data.key, {});
    }

    tt.setStorageSync('readingBookId', options.id);

    this.setData({
      bookId: options.id,
      index: (options.index || 0) * 1,
    });

    this.setData({
      isNight: res.isNight || false,
      textSize: res.textSize || this.data.textSize,
      changeTextSizeShow: res.changeTextSizeShow || false,
    });

    tt.setNavigationBarColor({
      frontColor: this.data.isNight ? '#ffffff' : '#000000',
      backgroundColor: this.data.isNight ? '#000000' : '#ffffff',
      success: (res) => {

      },
      fail: (res) => {
        //console.log(res);
      },
    });
    this.getDetail(options.id, options.index, options.position, options.is_share);
  },

  getDetail(id, index, position, is_share = 0) {
    api.get(config.route.bookChapter + '?id=' + id + '&index=' + index + '&position=' + position + '&is_share=' + is_share, (res) => {
      if (res.code == 2) {
        this.setData({
          status: 1,
        });
        // tt.showToast({
        //   title: res.msg,
        // });
        tt.navigateTo({
          url: "/pages/me/pay/pay?bookId=" + id,
        });
      }

      if (res.code == 0) {
        res.data?.decMoneyMsg ? tt.showToast({
          title: res.data.decMoneyMsg,
          duration: 4000,
          success: (res) => {

          },
          fail: (res) => {

          },
        }) : null;
        this.setData({
          item: res.data.bookDetail,
          index: index,
          position: position,
          totalChapter: res.data.book.TotalChapterNum * 1,
        });

        tt.setNavigationBarTitle({
          title: res.data.book.NovelName,
        });

        //获取书籍内容
        tt.request({
          url: app.globalData.setting.imageBaseUrl + res.data.bookDetail.Src,
          success: (re) => {
            let item = this.data.item;
            item.content = re.data;
            this.setData({
              item: item,
            }, () => {
              tt.pageScrollTo({
                scrollTop: position,
              });
            })
          },
          fail: (res) => {
            tt.showToast({
              title: '内容请求失败，请退出后再次进入本章节',
              success: (res) => {

              },
              fail: (res) => {

              },
            });
          },
        });
      }
    });
  },

  gotoBack() {
    tt.navigateBack({
      success: (res) => {

      },
      fail: (res) => {

      },
    });
  },

  showTextSizeShow() {
    let i = !this.data.changeTextSizeShow;
    this.setData({
      changeTextSizeShow: i,
    });
    let data = tt.getStorageSync(this.data.key);
    data.changeTextSizeShow = i;
    tt.setStorageSync(this.data.key, data);
  },

  setNight() {
    let isNight = !this.data.isNight;
    this.setData({
      isNight: isNight,
    });

    tt.setNavigationBarColor({
      frontColor: isNight ? '#ffffff' : '#000000',
      backgroundColor: isNight ? '#000000' : '#ffffff',
      success: (res) => {

      },
      fail: (res) => {
        //console.log(res);
      },
    });

    let data = tt.getStorageSync(this.data.key);
    data.isNight = isNight;
    tt.setStorageSync(this.data.key, data);
  },

  onShow() {
    this.canRead();
  },

  canRead() {
    api.get(config.route.canRead + '?bookId=' + this.data.bookId + '&index=' + (this.data.index + 1), (res) => {
      if (res.code == 0) {
        this.setData({
          canRead: res.data.canRead
        })
      }
    });
  },

  slider2change(e) {
    this.setData({
      textSize: e.detail.value,
    });

    let data = tt.getStorageSync(this.data.key);
    data.textSize = e.detail.value;
    tt.setStorageSync(this.data.key, data);
    return true;
  },

  bindchanging(e) {
    this.setData({
      textSize: e.detail.value,
    });

    let data = tt.getStorageSync(this.data.key);
    data.textSize = e.detail.value;
    tt.setStorageSync(this.data.key, data);
    return true;
  },

  switchTab(event) {
    if (!event.currentTarget.dataset.url) {
      return;
    }
    tt.switchTab({
      url: event.currentTarget.dataset.url,
      success: (res) => {
        console.log(res);
      },
      fail: (res) => {
        console.log(res);
      },
    });
  },

  timeoutScroll(scrollCount) {
    setTimeout(() => {
      if (scrollCount == this.scrollCount) {
        this.scrollCount = 0;
        api.post(config.route.bookDetailPosition, {
          bookId: this.data.item.BookId,
          index: this.data.item.Index,
          position: this.scrollTop,
        }, (res) => {
          //成功
        });
      } else {
        //console.log(scrollCount, this.scrollCount, this.scrollTop);
      }
    }, 500);
  },

  scrollCount: 0,
  scrollTop: 0,
  onPageScroll(e) {
    this.scrollCount++;
    this.scrollTop = e.scrollTop;
    this.timeoutScroll(this.scrollCount);
  },

  read(e) {
    if (e.currentTarget.dataset.type == -1 && this.data.index * 1 <= 1) {
      return false;
    }

    if (e.currentTarget.dataset.type == 1 && this.data.index * 1 + 1 > this.data.totalChapter) {
      return false;
    }

    let index = this.data.index * 1 + e.currentTarget.dataset.type * 1;
    this.setData({
      index: index,
    }, (res) => {
      this.getDetail(this.data.item.BookId, index, 0, 0);
      this.canRead();
    });
  },

  onMyEvent(e) {
    // 自定义组件触发事件时提供的detail对象
    this.setData({
      miniPrice: e.detail.miniPrice.toFixed(2),
    });
  },
})