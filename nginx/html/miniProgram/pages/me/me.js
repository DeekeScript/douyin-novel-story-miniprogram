import api from "../../api";
import config from "../../config";

const app = getApp();

Page({
  data: {
    isLogin: false,
    userInfo: tt.getStorageSync("userinfo") || {},
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    vipShow: false,
  },
  onLoad: function () {
    tt.login({
      success: (res) => {
        this.setData({
          isLogin: true,
        })
      },
    });
  },
  navigateTo(event) {
    console.log(event.target.dataset.url);
    if (!event.target.dataset.url) {
      return;
    }
    tt.navigateTo({
      url: event.target.dataset.url,
      success: (res) => {
        //console.log(res);
      },
      fail: (res) => {
        //console.log(res);
      },
    });
  },
  gotoLogin() {
    if (this.data.isLogin) {
      tt.navigateTo({
        url: "/pages/me/profile/profile",
        success: (res) => {

        },
        fail: (res) => {

        },
      });
      return true;
    }
    tt.navigateTo({
      url: "/pages/login/login",
      success: (res) => {

      },
      fail: (res) => {

      },
    });
  },
  copy() {
    tt.setClipboardData({
      data: '' + this.data.userInfo.Uid,
      success: (res) => {
        console.log(res);
        tt.showToast({
          title: '复制用户ID成功',
          success: (res) => {

          },
          fail: (res) => {

          },
        });
      },
      fail: (res) => {
        console.log(res);
      },
    });
  },
  onShow() {
    let userInfo = tt.getStorageSync("userinfo");
    userInfo.PayMoney = (userInfo.PayMoney / 100).toFixed(2);
    this.setData({
      userInfo: userInfo,
      setting: tt.getStorageSync('setting'),
      vipShow: tt.getStorageSync('userinfo').VipEndTime > Date.parse(new Date()) / 1000,
    });

    api.get(config.route.userInfo, (res) => {
      res.data.PayMoney = (res.data.PayMoney / 100).toFixed(2);
      tt.setStorageSync("userinfo", res.data);
      tt.setStorageSync("access_token", res.data.AccessToken);
      this.setData({
        userInfo: res.data,
        vipShow: res.data.VipEndTime > Date.parse(new Date()) / 1000,
      });
    });
  },

  vip() {
    tt.showToast({
      title: '你是VIP用户'
    });
  },
  conin() {
    tt.showToast({
      title: '你的书币数量'
    });
  },
  consumeRecord() {
    tt.navigateTo({
      url: "/pages/me/consume/consume",
    });
  },
  payRecord() {
    tt.navigateTo({
      url: "/pages/me/payMoneyRecord/payMoneyRecord",
    });
  }
})
