import http from '@ohos.net.http'
import { request } from '../utils/Request'

export const login = (extraData: {
  loginname: string; password: string
}) => {
  return request<{token: string}>({
    url: "user/login",
    method: http.RequestMethod.POST,
    extraData,
  })
}