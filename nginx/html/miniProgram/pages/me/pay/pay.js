// import api from "../../../api";
// import config from "../../../config";
const app = App();
// c:\Users\Administrator\miniprograms\main\pages\me\pay\pay.js
Page({
  data: {
    miniPrice: 0,
    openMember: 0,
    openCoin: 0,
    coinRef: undefined,
    memberRef: undefined,
    bookId: 0,
  },
  onLoad: function (e) {
    this.setData({
      bookId: e.bookId || 0,
    });
  },

  setCoinParams(e) {
    this.coinRef = e;
  },

  setMemberParams(e) {
    this.memberRef = e;
  },

  onShow: function (e) {
    this.coinRef.setParams({ bookId: this.data.bookId });
    this.memberRef.setParams({ bookId: this.data.bookId });
  },

  onMyEvent(e) {
    // 自定义组件触发事件时提供的detail对象
    if (e.detail.type == 1) {
      this.setData({
        openMember: e.detail.open,
      });
    } else {
      this.setData({
        openCoin: e.detail.open,
        miniPrice: e.detail.miniPrice.toFixed(2),
      });
    }
  },
});
