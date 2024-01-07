import api from "../../../api";
import config from "../../../config";

const app = getApp();

// c:\Users\Administrator\miniprograms\main\pages\me\contact\contact.js
Page({
  data: {
    item: {},
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
  },
  onLoad: function (options) {
    this.getDetail();
  },

  getDetail() {
    // api.get(config.route.contact, (res) => {
    //   if (res.code === 0) {
    //     this.setData({
    //       item: res.data,
    //     });
    //   }
    // });
    this.setData({
      item: tt.getStorageSync('setting'),
    });
  }
});