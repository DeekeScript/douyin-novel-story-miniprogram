import api from "../../api";
import config from "../../config";
const app = getApp()

// c:\Users\Administrator\miniprograms\main\component\bookList\bookList.js
Component({
  data: {
    imageBaseUrl: app.globalData.setting.imageBaseUrl,
    page: 1,
    limit: 0,

    //书库页面属性
    cateList: [],
    tagList: [],
    tagIndex: 0,
    cateIndex: 0,
    sortIndex: 0,
    end: false,
    items: [],
  },
  properties: {
    dataType: {
      type: Number,
      value: 1
    },
    dataCateId: {
      type: String,
      value: ''
    },
    dataTagId: {
      type: String,
      value: ''
    },
    dataTitle: {
      type: String,
      value: ''
    },
    dataSearch: {
      type: String,
      value: '',
    },
  },

  attached() {
    let limit = 5;

    if (this.properties.dataType == 2) {
      limit = 8;
    } else if (this.properties.dataType == 3) {
      limit = 16;//这个模式是两本书一起的
    } else if (this.properties.dataType == 4) {
      //获取类目
      //this.setCates(this.data.sortIndex);
      this.setTags(this.data.sortIndex);
      limit = 15;
      this.searchList(limit);
    } else if (this.properties.dataType == 5) {
      limit = 15;
    }
    this.setData({
      limit: limit,
    });

    if (this.properties.dataType !== 4) {
      this.searchList(limit);
    }
  },

  ready() {
    //console.log('ready');
  },

  methods: {
    incPage() {
      if (this.data.end) {
        return false;
      }
      this.setData({
        page: this.data.page + 1,
      }, () => {
        let route = config.route.bookList + '?limit=' + this.data.limit + '&cateId=' + this.properties.dataCateId + "&page=" + this.data.page + '&search=' + this.properties.dataSearch;
        if (this.properties.dataType === 4) {
          route += '&orderBy=' + (this.data.sortIndex === 0 ? 'sort desc' : 'id desc') + '&tagId=' + this.properties.dataTagId;
        }

        api.get(route, (res) => {
          if (!res.data || res.data.length < this.data.limit) {
            this.setData({
              end: true,
            });
          }
          res.data = this.data.items.concat(res.data || []);
          this.setData({
            items: res.data
          });
        });
      });
    },
    scrolls() {
      this.incPage();
    },
    searchList(limit, page = 1, clear = 0, change = 0) {
      let _this = this;
      let route = config.route.bookList + '?limit=' + limit + '&cateId=' + this.properties.dataCateId + '&search=' + this.properties.dataSearch + "&page=" + page;
      if (this.properties.dataType === 4) {
        route += '&orderBy=' + (this.data.sortIndex === 0 ? 'sort desc' : 'id desc') + '&tagId=' + this.properties.dataTagId;
      }
      api.get(route, function (res) {
        if (res.code == 1) {
          return false;
        }
        //换一换逻辑处理
        let len = res.data?.length || 0;
        if (change && clear) {
          if (_this.data.page > 1 && len < _this.data.limit) {
            let items = res.data || [];
            for (let i = 0; i < _this.data.limit - len; i++) {
              items.push(_this.data.items[i]);
            }

            return _this.setData({
              page: 0,
              items: items
            });
          }
        } else {
          if (!clear) {
            res.data = _this.data.items.concat(res.data || []);
          }
        }

        _this.setData({
          items: res.data
        });

        //口令搜索
        if (_this.properties.dataSearch != "" && res.kouling) {
          tt.setStorageSync('kouling', res.kouling);
        }
      });
    },
    bookDetail(e) {
      tt.navigateTo({
        url: '/pages/detail/detail?id=' + e.currentTarget.dataset.id,
        success: (res) => {

        },
        fail: (res) => {

        },
      });
    },
    //父组件调用的方法
    parentSearchEvent(search) {
      this.properties.dataSearch = search;
      this.setData({
        end: false,
      });
      this.searchList(15, 1, 1);
    },

    reloadData() {
      let page = ++this.data.page;
      this.setData({
        page: page
      });

      this.searchList(this.data.limit, page, 1, 1);
    },

    setCates(sortIndex) {
      api.get(config.route.cateList + '?limit=1000', (res) => {
        this.setData({
          cateList: res.data,
        });
      });
    },

    setTags(sortIndex) {
      api.get(config.route.tagList + '?limit=1000', (res) => {
        this.setData({
          tagList: res.data,
        });
      });
    },

    changeCate(e) {
      this.properties.dataCateId = e.currentTarget.dataset.id;
      this.setData({
        cateIndex: e.currentTarget.dataset.index,
        page: 0,
      }, () => {
        this.searchList(15, 1, 1);
      });
    },

    changeTag(e) {
      this.properties.dataTagId = e.currentTarget.dataset.id;
      this.setData({
        tagIndex: e.currentTarget.dataset.index,
        page: 0,
      }, () => {
        this.searchList(15, 1, 1);
      });
    },

    changeSort(e) {
      this.setData({
        sortIndex: e.currentTarget.dataset.sort,
        page: 0,
      }, () => {
        this.searchList(15, 1, 1);
      });
    }
  },
})