function init(app) {
    // 重写page函数，增加阿里云监控和日志记录
    const oldPage = Page
    Page = function (obj) {
        let oldOnShow = obj.onShow;
        obj.onShow = function (e) {
            if (!app.isLogin && oldOnShow) {
                return app.login(() => {
                    return oldOnShow?.call(this, e);
                });
            }
            return oldOnShow?.call(this, e);
        }

        let oldOnload = obj.onLoad;
        obj.onLoad = function (e) {
            if (!app.isLogin && oldOnload) {
                return app.login(() => {
                    return oldOnload?.call(this, e);
                });
            }
            return oldOnload?.call(this, e);
        }

        return oldPage(obj)
    }
}

export default {
    init
}
