const app = getApp()

Page({
  data: {

  },
  onShow: function () {
    this.counter.setPage(1, () => {
      this.counter.getList();
    });
  },

  refHandler(ref) {
    // 存储自定义组件实例，方便以后调用
    this.counter = ref;
  },
})
