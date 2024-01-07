import api from "../../../api";
import config from "../../../config";

// c:\Users\Administrator\miniprograms\main\pages\me\notice\notice.js
Page({
  data: {
    items: [],
    page: 1,
    limit: 15,
    end: false,
  },
  onLoad: function (options) {
    this.getList();
  },

  getList() {
    if (this.data.end) {
      return false;
    }
    api.get(config.route.noticeList + '?limit=' + this.data.limit + '&page=' + this.data.page, (res) => {
      if (res.code === 0 && res.data) {
        if (res.data.length < this.data.limit) {
          this.setData({
            page: 0,
            end: true,
          });
        }

        res.data = this.data.items.concat(res.data || []);
        for (let i in res.data) {
          res.data[i].CreatedAtShow = this.time(res.data[i].CreatedAt);
        }
        this.setData({
          items: res.data,
        });
      }
    });
  },
  time(str) {
    let d = new Date(str * 1000);
    return d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
  },
  scrolls() {
    this.setData({
      page: this.data.page + 1
    }, () => {
      this.getList();
    });
  },
});