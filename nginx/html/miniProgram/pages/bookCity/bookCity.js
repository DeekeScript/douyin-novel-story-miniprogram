import api from "../../api";
import config from "../../config";

const app = getApp()
Page({
  data: {
    duration: 500,
    banner: [],
    indexPage: [],
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    counter: undefined,
    showViewingBookTime: 7000,//显示5秒钟
    showViewingData: null
  },
  cancel() {
    this.setData({
      showViewingData: null,
    });
  },
  viewBook() {
    tt.navigateTo({
      url: "/pages/bookDetail/bookDetail?id=" + this.data.showViewingData.BookId + "&index=" + this.data.showViewingData.ViewChapter + "&position=" + this.data.showViewingData.ViewIndex,
    });
  },
  animationFinish(e) {
    //console.log(e.detail);
  },
  transition(e) {
    //console.log(e.detail);
  },
  refHandler(ref) {
    // 存储自定义组件实例，方便以后调用
    this.counter = ref;
  },
  scrolls() {
    this.counter.incPage();
  },
  onLoad(e){
    api.get(config.route.index, (res) => {
      this.setData({
        banner: res.data.banner,
        indexPage: res.data.indexPage,
      });
    });

    this.getViewingBook();
  },
  getViewingBook() {
    api.get(config.route.viewingBook, (res) => {
      if (res.code === 0 && res.data && res.data.Id) {
        this.setData({
          showViewingData: res.data,
        }, () => {
          let a = setTimeout(() => {
            this.setData({
              showViewingData: null,
            });
            clearTimeout(a);
          }, this.data.showViewingBookTime);
        });
      }
    });
  },
  gotoBookDetail(e) {
    tt.navigateTo({
      url: '/pages/detail/detail?id=' + e.currentTarget.dataset.page,
      success: (res) => {

      },
      fail: (res) => {

      },
    });
  },
  gotoBookSearch(e) {
    tt.navigateTo({
      url: '/pages/search/search',
      success: (res) => {

      },
      fail: (res) => {

      },
    });
  }
});
