import TopBar from '../Components/TopBar'
import Tab from '../Components/Tab'

@Entry
@Component
export struct Message {
  build() {
    Column() {
      TopBar({ title: "消息" })
      Tab()
    }
    .height('100%').backgroundColor("#f5f5f5")
  }
}