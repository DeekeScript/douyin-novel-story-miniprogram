// c:\Users\Administrator\miniprograms\main\component\myBookList\myBookList.js
import api from "../../api";
import config from "../../config";
const app = getApp();

Component({
  data: {
    page: 1,
    limit: 15,
    items: [],
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    edit: false,
    allChecked: false,
    end: false,
  },
  properties: {

  },
  attached() {
    //this.getList();
  },

  pageLifetimes: {
    show: function ({ showFrom }) {
      this.setData({
        scrollTop: 0,
      })
    },
  },

  methods: {
    scrolls() {
      if (this.data.end) {
        return false;
      }
      this.setData({
        page: this.data.page + 1
      }, () => {
        this.getList(1);
      });
    },
    allChecked() {
      let status = !this.data.allChecked;
      this.setData({
        allChecked: status
      });

      let items = this.data.items;
      for (let i in items) {
        items[i]['checked'] = status;
      }
      this.setData({
        items: items,
      });
    },
    select(e) {
      let items = this.data.items;
      let allSelect = true;
      for (let i in items) {
        if (items[i].Id === e.currentTarget.dataset.id) {
          items[i].checked = !items[i].checked;
        }
  
        if (!items[i].checked) {
          allSelect = false;
        }
      }
      this.setData({
        items: items,
        allSelect: allSelect
      });
    },
    delete() {
      let ids = [];
      for (let i in this.data.items) {
        if (this.data.items[i].checked) {
          ids.push(this.data.items[i].Id);
        }
      }

      if (ids.length <= 0) {
        return true;
      }
      api.post(config.route.deleteBookHome, {
        id: ids,
      }, (res) => {
        if (res.code === 0) {
          tt.showToast({
            title: '删除成功',
            success: (res) => {

            },
            fail: (res) => {

            },
          });
          this.getList();
        } else {
          tt.showToast({
            title: '删除失败',
            success: (res) => {

            },
            fail: (res) => {

            },
          });
        }
      });
    },
    edit() {
      if (this.data.edit) {
        this.setData({
          allChecked: false,
        });

        let items = this.data.items;
        for (let i in items) {
          items[i]['checked'] = false;
        }
        this.setData({
          items: items,
        });
      }
      this.setData({
        edit: !this.data.edit
      });
    },
    setPage(page, fuc) {
      this.setData({
        page: page,
        end: false,
      });
      fuc();
    },
    getList(type = 0) {
      api.get(config.route.bookHome + '?limit=' + this.data.limit + '&page=' + this.data.page, (res) => {
        if (res.code === 0) {
          if (!res.data || res.data.length < this.data.limit) {
            this.setData({
              end: true,
            });
          }

          if (type == 1) {
            res.data = this.data.items.concat(res.data || []);
          }
          this.setData({
            items: res.data,
          });
        }
      });
    },

    gotoBookDetail(e) {
      //如果是编辑状态，则更改checked属性即可
      if (this.data.edit) {
        let items = this.data.items;
        let allChecked = true;
        for (let i in items) {
          if (items[i]['Id'] === e.currentTarget.dataset.id) {
            items[i]['checked'] = !items[i]['checked'];
          }

          if (!items[i]['checked']) {
            allChecked = false;
          }
        }
        return this.setData({
          items: items,
          allChecked: allChecked,
        });
      }

      tt.navigateTo({
        url: "/pages/detail/detail?id=" + e.currentTarget.dataset.id,
        success: (res) => {

        },
        fail: (res) => {

        },
      });
    }
  }
})