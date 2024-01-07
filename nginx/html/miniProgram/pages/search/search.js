const app = getApp()
Page({
  data: {
    search: '',
  },
  counter:null,
  formSubmit(e) {
    this.setData({
      search: e.detail.value.search,
    });

    this.counter.parentSearchEvent(e.detail.value.search);
  },

  scrolls() {
    this.counter.incPage();
  },

  refList(res){
    this.counter = res;
  }
});
