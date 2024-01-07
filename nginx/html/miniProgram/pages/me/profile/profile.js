// c:\Users\Administrator\miniprograms\main\pages\me\profile\profile.js
import api from "../../../api";
import config from "../../../config";
const app = getApp();

Page({
  data: {
    userInfo: tt.getStorageSync("userinfo") || {},
    setting: {},
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    avatar: '',
  },
  chooseImage() {
    api.get(config.route.aliOssConfig, (res) => {
      if (res.code === 1) {
        return tt.showToast({
          title: '获取配置信息失败',
          success: (res) => {

          },
          fail: (res) => {

          },
        });
      }

      const host = res.data.host;
      const signature = res.data.signature;
      const ossAccessKeyId = res.data.accessid;
      const policy = res.data.policy;
      const dir = res.data.dir;
      let key = '';

      tt.chooseImage({
        count: 1,
        sourceType: ['album'],
        success: (res) => {
          let fileTmp = res.tempFilePaths[0].split('.');
          key = dir + Math.ceil(Date.parse(new Date())) + '' + Math.ceil(Math.random() * 100000) + '.' + fileTmp[fileTmp.length - 1];
          console.log(fileTmp[fileTmp.length - 1]);
          tt.uploadFile({
            url: host,
            name: 'file',
            filePath: res.tempFilePaths[0],
            formData: {
              key,
              policy,
              OSSAccessKeyId: ossAccessKeyId,
              signature,
            },
            fail: (res) => {
              tt.showToast({
                title: '上传失败',
              });
            },
            success: (res) => {
              this.setData({
                avatar: key,
              })
            }
          });
        },
        fail: (res) => {

        },
      });
    });
  },
  onLoad: function (options) {
    this.setData({
      userInfo: tt.getStorageSync("userinfo"),
      setting: tt.getStorageSync('setting'),
    });
  },
  submit(e) {
    api.post(config.route.profile, {
      nickname: e.detail.value.nickname,
      avatar: this.data.avatar,
    }, (res) => {
      if (res.code === 0) {
        tt.showToast({
          title: '成功',
        });
        let userinfo = tt.getStorageSync('userinfo');
        userinfo.Avatar = this.data.avatar;
        userinfo.Nickname = e.detail.value.nickname;
        tt.setStorageSync('userinfo', userinfo);
      }else{
        tt.showToast({
          title: res.msg,
        });
      }
    });
  }
})