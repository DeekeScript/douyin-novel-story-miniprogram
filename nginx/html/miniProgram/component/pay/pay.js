// c:\Users\Administrator\miniprograms\main\component\pay\pay.js
import api from "../../api";
import config from "../../config";

Component({
  data: {
    items: [],
    miniPrice: Number.MAX_SAFE_INTEGER,
    payIndex: 0,
    prePage: '',
    bookId: 0,
  },
  properties: {
    dataType: {
      type: Number,
      value: 0
    },
  },
  methods: {
    getDetail() {
      api.get(config.route.rechargeType + '?pattern=' + this.properties.dataType, (res) => {
        if (res.code === 0) {
          let miniPrice = this.data.miniPrice;
          let price = 0;
          for (let i in res.data) {
            res.data[i].Price = (res.data[i].Price / 100).toFixed(2);
            res.data[i].OldPrice = (res.data[i].OldPrice / 100).toFixed(2);
            price = res.data[i].Price / [1, 7, 30, 90, 365][res.data[i].Type] / res.data[i].Num;
            if (price < miniPrice) {
              miniPrice = price;
            }
          }
          this.setData({
            items: res.data,
            miniPrice: miniPrice.toFixed(2),
          });

          this.triggerEvent("myevent", { miniPrice: miniPrice, open: res.data && res.data.length ? 1 : 0, type: this.properties.dataType }, {});
        }
      })
    },
    setParams(e) {
      this.setData({
        bookId: e.bookId,
      });
    },
    pay(e) {
      //let pages = getCurrentPages();
      console.log(this.data);
      this.setData({
        payIndex: e.currentTarget.dataset.index,
      });

      if (this.lock) {
        return true;
      }

      this.lock = true;
      api.post(config.route.createOrder, {
        "id": e.currentTarget.dataset.id,
        "pattern": e.currentTarget.dataset.pattern,
        "page": this.data.prePage || '',
        "bookId": this.data.bookId,
        "kouling": tt.getStorageSync('kouling'),
      }, (res) => {
        if (res.code == 1) {
          this.lock = false;
          return tt.showModal({
            title: "支付异常提醒",
            content: res.msg,
          });
        }

        /**
         * 	
          0：支付成功
          1：支付超时
          2：支付失败
          3：支付关闭
          4：支付取消
          9：订单状态开发者自行获取
         */
        tt.pay({
          orderInfo: {
            order_id: res.data.orderId,
            order_token: res.data.orderToken,
          },
          service: 5,
          success: (res) => {
            if (res.code != 0) {
              this.lock = false;
              this.noticeToParent(false);
              tt.showToast({
                title: ["支付成功", "支付超时", "支付失败", "支付关闭", "支付取消"][res.code] || "支付失败",
              });

              setTimeout(() => {
                tt.navigateBack({});
              }, 3000);
            }
            tt.showToast({
              title: "支付成功",
              success: (res) => {
                tt.navigateBack({});
              },
            });
            this.lock = false;
          },
          fail: (res) => {
            tt.showToast({
              title: res.errMsg,
            });
            this.lock = false;
          },
        });
      }, (res) => {
        tt.showToast({
          title: '支付异常',
        });
        this.lock = false;
      });
    },
    noticeToParent(bl) {
      this.triggerEvent("myevent", {
        canRead: bl,
      }, {});
    }
  },
  attached: function () {
    this.getDetail();
  },
  lock: false,
})