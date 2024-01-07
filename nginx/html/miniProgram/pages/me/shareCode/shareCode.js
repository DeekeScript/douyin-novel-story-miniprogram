import api from "../../../api";
import config from "../../../config";

// c:\Users\Administrator\miniprograms\main\pages\me\shareCode\shareCode.js
Page({
  data: {
    item: {},
    shareCode: '',
  },
  onLoad: function (options) {
    this.setData({
      shareCode: tt.getStorageSync("userinfo")?.ShareCode || '',
    })
  },

  shareCode(e) {
    api.post(config.route.shareCode, {
      code: e.detail.value.code,
    }, (res) => {
      if (res.code == 0) {
        this.setData({
          item: res.data,
          shareCode: e.detail.value.code,
        });

        let userinfo = tt.getStorageSync('userinf');
        userinfo.ShareCode = e.detail.value.code;
        tt.setStorageSync('userinfo', userinfo);
      }
    })
  }
})