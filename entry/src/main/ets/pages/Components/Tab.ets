import router from '@ohos.router'

@Component
export default struct Tab {
  private title?: string
  private controller: TabsController = new TabsController();
  private lists: Array<Object> = [{ friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
    { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
    { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" },
  // { friend: "张一三", lasttime: "2022-10-30", unReadNum: 1, lastMsg: "当前怎么样" }
  ]

  GotoChat() {
    router.pushUrl({
      url: "pages/Message/Chat"
    })
  }

  build() {
    Tabs({
      barPosition: BarPosition.Start, // 设置Tab在上方
      index: 0,
      controller: this.controller
    }) {
      TabContent() {
        Column() {
          Grid() {
            ForEach(this.lists, (item: any, index?: number) => {
              GridItem() {
                Row() {
                  Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Row() {
                      Column() {
                        Text("张")
                          .fontSize(22).fontWeight(700)
                      }
                      .height(50)
                      .width(50)
                      .borderRadius(25)
                      .backgroundColor(Color.Green)
                      .alignItems(HorizontalAlign.Center)
                      .justifyContent(FlexAlign.Center)
                      .margin({ right: 14 })

                      Column() {
                        Text("张一是").fontSize(22).fontWeight(700).margin({ bottom: 10 })
                        Text("张一事实上事实上是").fontSize(16)
                      }.alignItems(HorizontalAlign.Start)
                    }

                    Column() {
                      Text("30分钟").fontSize(22).margin({ bottom: 10 })

                      Row() {
                        Text("1").fontSize(18)
                      }
                      .height(24)
                      .width(24)
                      .borderRadius(12)
                      .backgroundColor(Color.Orange)
                      .alignItems(VerticalAlign.Center)
                      .justifyContent(FlexAlign.Center)
                    }.alignItems(HorizontalAlign.Center)
                  }
                }
                .width("100%")
                .padding({ left: 20, right: 20, top: 10, bottom: 10 })
                .borderWidth({ bottom: 2 })
                .borderColor(Color.Gray)
              }.onClick(() => {
                this.GotoChat()
              })

            })
          }.columnsTemplate("1fr") // 设置Grid为3列，并且均分

        }
        .width('100%').padding({ bottom: 55 })
        .backgroundColor("#f5f5f5")
      }
      .tabBar("消息中心")

      TabContent() {
        Column() {

        }
        .width('100%')
        .backgroundColor("#f5f5f5")
      }
      .tabBar("平台信息")

    }
    .vertical(false)
  }
}