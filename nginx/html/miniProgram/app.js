import api from "./api";
import config from "./config";
import iPage from "./pages/iPage";

App({
  onLaunch: function (options) {
    iPage.init(this);
  },
  isLogin: false,
  login(func) {
    let _this = this;
    tt.login({
      success: (res) => {
        //console.log("登录成功", res);
        api.post(config.route.login, res, (res) => {
          tt.setStorageSync("userinfo", res.data);
          tt.setStorageSync("access_token", res.data.AccessToken);
          _this.isLogin = true;
          this.initData();
          func();
        });
      },
      fail(res) {
        console.log("getUserProfile 调用失败", res);
      },
    });
  },
  onShow: function (options) {
    // console.log(options);
    // console.log(tt.getLaunchOptionsSync());
    if (!options.clickid) {
      return false;
    }
    api.post(config.route.adUpload, {
      page: options.path,
      scene: options.scene,
      ad_params: options.query.ad_params || '',
      adid: options.query.adid || '',
      clickid: options.query.clickid,
      age: options.query.age,
      name: options.query.name,
      creativeid: options.query.creativeid,
      creativetype: options.query.creativetype,
      myType: options.query.myType,
      myContent: options.query.myContent,
    }, (res) => {
      //
    });
  },
  onHide: function () {
    //console.log('App Hide');
  },
  initData: function (_this) {
    api.get(config.route.setting, (res) => {
      tt.setStorageSync('setting', res.data);
    });
  },
  globalData: {
    setting: {
      imageBaseUrl: 'https://xxx.oss-cn-hangzhou.aliyuncs.com/'
    }
  }
});
