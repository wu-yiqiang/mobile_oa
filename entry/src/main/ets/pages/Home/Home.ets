import { TabBarItem } from '../../types/TabBarItem'
// @ts-ignore
import { Work } from '../Work/Work'
import { Message } from '../Message/Message'
import { AddressBook } from '../AddressBook/AddressBook'
import { My } from '../My/My'

@Entry
@Component
struct Home {
  @State currentIndex: number = 0 // tabBarItems的数据 tabBarItems: TabBarItem[] = [
  tabBarItems: TabBarItem[] = [
    {
      text: $r("app.string.work"),
      icon: $rawfile("tabBarItemImages/book.png"),
      activeIcon: $rawfile("tabBarItemImages/book_active.png")
    }, {
    text: $r("app.string.message"),
    icon: $rawfile("tabBarItemImages/message.png"),
    activeIcon: $rawfile("tabBarItemImages/message_active.png")
  }, {
    text: $r("app.string.address_book"),
    icon: $rawfile("tabBarItemImages/address_book.png"),
    activeIcon: $rawfile("tabBarItemImages/address_book_active.png")
  }, { text: $r("app.string.my"),
    icon: $rawfile("tabBarItemImages/my.png"),
    activeIcon: $rawfile("tabBarItemImages/my_active.png")
  }
  ]
@Builder TabItemBuilder(index: number) {
  Column() {
    Image(this.currentIndex === index ? this.tabBarItems[index].activeIcon :
    this.tabBarItems[index].icon)
      .width(24)
      .height(24)
      .margin({ bottom: 4 })
      .objectFit(ImageFit.Contain)
    Text(this.tabBarItems[index].text)
      .fontColor(this.currentIndex === index ? '#4749a1' : '#9a9a9a')
      .fontSize(10)
      .fontWeight(500)
      .lineHeight(14)
  }.width('100%').padding(5).borderColor(Color.Gray)
}
build() {
  Column() {
    // 底部TabBar
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(this.tabBarItems, (item: TabBarItem, index: number) => {
        TabContent() {
          if (index == 0) {
            Work()
          } else if (index == 1) {
            Message()
          } else if (index == 2) {
            AddressBook()
          } else if (index == 3) {
            My()
          }
        }.tabBar(this.TabItemBuilder(index))
      }, (item: TabBarItem) => JSON.stringify(item))
    }
    .onChange(index => {
      this.currentIndex = index
    }) }
  .width('100%')
  .height('100%')
}
}