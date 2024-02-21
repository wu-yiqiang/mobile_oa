import http from '@ohos.net.http'
import { ApiRes } from '../types/Data'
const BASEURL = 'https://huangjiangjun.top:3002/api/mobile_officing/'
export const request = <T>({
                             url,
                             method = http.RequestMethod.GET,
                             extraData = {},
                             header = {}
                           }): Promise<ApiRes<T>> => {
  // 每一个httpRequest对应一个HTTP请求任务，不可复用
  let httpRequest = http.createHttp()
  return new Promise((resolve, reject) => {
    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数 可以在extraData中指定
      `${BASEURL}${url}`,
      {
        method, // 可选，默认为http.RequestMethod.GET // 开发者根据自身业务需要添加header字段
        header,
        // 当使用POST请求时此字段用于传递内容
        extraData,
        expectDataType: http.HttpDataType.OBJECT
      },
      (err, data) => {
        if (!err) {
          // 取消订阅HTTP响应头事件
          httpRequest.off('headersReceive');
          // 当该请求使用完毕时，调用destroy方法主动销毁
          httpRequest.destroy()
          // data.result为HTTP响应内容，可根据业务需要进行解析
          resolve(data.result as ApiRes<T>)
        } else {
          console.info('error:' + JSON.stringify(err))
          reject(err)
// 取消订阅HTTP响应头事件
httpRequest.off('headersReceive')
// 当该请求使用完毕时，调用destroy方法主动销毁。
          httpRequest.destroy()
} }
    ) })
}