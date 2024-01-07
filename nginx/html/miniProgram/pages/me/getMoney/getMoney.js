import api from "../../../api"
import config from "../../../config"

// c:\Users\Administrator\miniprograms\main\pages\me\getMoney\getMoney.js
Page({
  data: {
    userInfo: {}
  },
  onLoad: function (options) {

  },
  onShow: function () {
    this.detail();
  },
  detail() {
    api.get(config.route.userInfo, (res) => {
      res.data.RechargeMoney = (res.data.RechargeMoney / 100).toFixed(2);
      res.data.WaitRechargeMoney = (res.data.WaitRechargeMoney / 100).toFixed(2);
      this.setData({
        userInfo: res.data,
      });
    });
  },
  recharge() {
    if (this.data.userInfo.WaitRechargeMoney > 0) {
      api.post(config.route.recharge, {}, (res) => {
        if (res.code === 1) {
          return tt.showToast({
            title: res.msg
          });
        }

        tt.showModal({
          title: '温馨提示',
          content: res.msg,
          duration: 5000,
        });

        this.detail();
      })
    }
  },
  gotoDetail() {
    tt.navigateTo({
      url: "/pages/me/rechargeDetail/rechargeDetail",
      success: (res) => {

      },
      fail: (res) => {

      },
    });
  }
})