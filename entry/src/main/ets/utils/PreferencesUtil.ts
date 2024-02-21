import dataPreferences from '@ohos.data.preferences'
const PREFERENCES_NAME = 'myPreferences' // 首选项名字
const TOKEN_KEY = 'TOKEN_KEY' // 首选项Key字段
export default class PreferencesUtil {
static preferences = null
// 创建dataPreferences
static async createPreferences(context) {
  // 获取首选项实例
  this.preferences = await dataPreferences.getPreferences(
    context,
    PREFERENCES_NAME
  ) }
// 保存token
static saveToken(token: string) {
  // 保存数据 this.preferences.put(TOKEN_KEY, token) this.preferences.flush()
}
// 获取token
static async getToken() {
  return this.preferences.get(TOKEN_KEY, '')
}
}