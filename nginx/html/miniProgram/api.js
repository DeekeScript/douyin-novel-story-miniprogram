import config from "./config";

export default {
    get: function (route, suc, fail) {
        let f = function () {
            tt.request({
                header: {
                    'Authorization': 'Bearer ' + tt.getStorageSync('access_token'),
                },
                url: config.baseUrl + route,
                success: (res) => {
                    suc(res.data);
                },
                fail: (res) => {
                    if (fail) {
                        fail(res);
                    }
                    console.log('请求失败', res);
                },
            });
        }
        return f();
    },

    post: function (route, data, suc, fail) {
        tt.request({
            method: 'POST',
            header: {
                'Authorization': 'Bearer ' + tt.getStorageSync('access_token'),
                'content-type': 'application/json',
            },
            url: config.baseUrl + route,
            data: data,
            success: (res) => {
                suc(res.data);
            },
            fail: (res) => {
                if (fail) {
                    fail(res);
                }
                console.log('请求失败', res);
            },
        });
    }
}
