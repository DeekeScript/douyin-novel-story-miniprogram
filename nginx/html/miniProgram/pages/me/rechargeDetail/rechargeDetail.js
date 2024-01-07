import api from "../../../api"
import config from "../../../config"

const app = getApp();

// c:\Users\Administrator\miniprograms\main\pages\me\rechargeDetail\rechargeDetail.js
Page({
  data: {
    page: 1,
    limit: 15,
    items: [],
    setting: {},
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    end: false,
  },
  onLoad: function (options) {
    this.setData({
      setting: tt.getStorageSync('setting'),
    });
    this.getList();
  },
  getList() {
    if (this.data.end) {
      return false;
    }

    api.get(config.route.rechargeList + "?page=" + this.data.page + "&limit=" + this.data.limit, (res) => {
      if (res.code === 0) {
        if (res.data.length < this.data.limit) {
          this.setData({
            end: true,
          });
        }

        res.data = this.data.items.concat(res.data || []);
        for (let i in res.data) {
          let d = new Date(res.data[i].CreatedAt * 1000);
          res.data[i].CreatedAtShow = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
        }
        this.setData({
          items: res.data,
        });
      }
    });
  },
  scrolls() {
    this.setData({
      page: this.data.page + 1,
    }, () => {
      this.getList();
    });
  },
})