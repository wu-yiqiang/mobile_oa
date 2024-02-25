import NavBar from '../components/NavBar'
import { Message } from '../../types/Message'
import promptAction from '@ohos.promptAction'
import picker from '@ohos.file.picker'

@Entry
@Component
struct Chat {
  @State friendName: string = "张三"

  build() {
    Column() {
      // 1、标题栏
      NavBar({ title: this.friendName })
    }
    .width('100%')
  }
}