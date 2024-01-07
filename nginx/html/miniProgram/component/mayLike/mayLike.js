import api from "../../api";
import config from "../../config";
const app = getApp();

// c:\Users\Administrator\miniprograms\main\component\mayLike\mayLike.js
Component({
  data: {
    book: [],
    page: 1,
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    limit: 4,
  },
  properties: {
    dataCate: {
      type: String,
      value: ''
    }
  },
  ready() {
    this.getList(this.properties.dataCate);
  },
  methods: {
    getList(cateId) {
      api.get(config.route.myLike + "?cateId=" + cateId + '&page=' + this.data.page + '&limit=' + this.data.limit, (res) => {
        let len = res.data?.length || 0;
        if (this.data.page > 1 && len < this.data.limit) {
          this.setData({
            page: 0,
          });

          let items = res.data || [];
          for (let i = 0; i < this.data.limit - len; i++) {
            items.push(this.data.book[i]);
          }
          return this.setData({
            book: items,
          });
        }
        this.setData({
          book: res.data,
        });
      });
    },
    showBookDetail(e) {
      this.triggerEvent("myevent", { id: e.currentTarget.dataset.id }, {});
    },
    changeLikeList() {
      this.setData({
        page: ++this.data.page
      }, () => {
        this.getList(this.properties.dataCate);
      });
    }
  }
})