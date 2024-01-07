import api from "../../api";
import config from "../../config";

// c:\Users\Administrator\miniprograms\main\pages\login\login.js
Page({
  data: {
    checked: false,
  },
  onLoad: function (options) {

  },
  login(e) {
    if (!this.data.checked) {
      return tt.showModal({
        title: "温馨提示",
        content: "请阅读下方的《服务协议》与《隐私政策》",
        showCancel: false,
        success(res) {

        },
      });
    }

    tt.login({
      success(res) {
        console.log("登录成功", res);
        api.post(config.route.login, res, (res) => {
          tt.setStorageSync("userinfo", res.data);
          tt.setStorageSync("access_token", res.data.AccessToken);
          tt.navigateBack({
            success: (res) => {
              console.log(res)
            },
            fail: (res) => {

            },
          });
        });
      },
      fail(res) {
        console.log("getUserProfile 调用失败", res);
      },
    });
  },

  mobileLogin(e) {
    console.log(e);
  },

  gotoView(e) {
    console.log(e);
  },

  agress(e) {
    this.setData({
      checked: e.detail.value ? true : false,
    });
  }
})