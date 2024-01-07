import api from "../../../api";
import config from "../../../config";
const app = getApp();

// c:\Users\Administrator\miniprograms\main\pages\me\watchRecord\watchRecord.js
Page({
  data: {
    items: [],
    cates: [],
    page: 1,
    limit: 15,
    isEdit: false,
    end: false,
    imageBaseUrl: app.globalData.setting.imageBaseUrl
  },
  onLoad: function (options) {
    this.getList();
  },

  getList() {
    if (this.data.end) {
      return false;
    }

    api.get(config.route.myReadBooks + '?page=' + this.data.page + '&limit=' + this.data.limit, (res) => {
      if (res.code === 0) {
        if (res.data.books.length < this.data.limit) {
          this.setData({
            end: true,
          });
        }
        res.data.books = this.data.items.concat(res.data.books || []);
        res.data.cates = this.data.cates.concat(res.data.cates || []);
        this.setData({
          items: res.data.books || [],
          cates: res.data.cates || [],
        });
      }
    });
  },
  edit() {
    this.setData({
      isEdit: !this.data.isEdit,
    });
  },
  select(e) {
    let items = this.data.items;
    let allSelect = true;
    for (let i in items) {
      if (items[i].Id === e.currentTarget.dataset.id) {
        items[i].checked = !items[i].checked;
      }

      if (!items[i].checked) {
        allSelect = false;
      }
    }
    this.setData({
      items: items,
      allSelect: allSelect
    });
  },
  allSelectF(e) {
    let items = this.data.items;
    for (let i in items) {
      items[i].checked = !this.data.allSelect;
    }

    this.setData({
      items: items,
      allSelect: !this.data.allSelect
    });
  },
  delete() {
    let ids = [];
    for (let i in this.data.items) {
      if (this.data.items[i].checked) {
        ids.push(this.data.items[i].Id);
      }
    }

    if (ids) {
      api.post(config.route.deleteMyReadBooks, {
        id: ids,
      }, (res) => {
        if (res.code === 0) {
          let data = [];
          for(let i in this.data.items){
            if(ids.indexOf(this.data.items[i].Id)===-1){
              data.push(this.data.items[i]);
            }
          }
          this.setData({
            items: data,
          });
          return tt.showToast({
            title: '删除成功',
            success: (res) => {

            },
            fail: (res) => {

            },
          });
        }
      });
    }
  },
  scrolls() {
    this.setData({
      page: this.data.page + 1,
    }, () => {
      this.getList();
    });
  },
  gotoDetail(e) {
    if(this.data.isEdit){
      return true;
    }
    tt.navigateTo({
      url: "/pages/detail/detail?id=" + e.currentTarget.dataset.id,
    });
  }
});
