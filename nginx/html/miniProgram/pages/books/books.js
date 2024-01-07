import api from "../../api";
import config from "../../config";

const app = getApp();
Page({
  data: {
    cateList: [],
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    setting: {}
  },

  gotoBookSearch() {
    tt.navigateTo({
      url: "/pages/search/search",
      success: (res) => {

      },
      fail: (res) => {

      },
    });
  },
  onLoad() {
    this.setData({
      setting: tt.getStorageSync('setting'),
    })
  }
});
