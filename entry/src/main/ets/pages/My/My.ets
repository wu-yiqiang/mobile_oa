import router from '@ohos.router'

@Entry
@Component
export struct My {
  @State message: string = 'my'
  private items: Array<object> = [
    { icon: "my/leave.png", title: "我的请假", path: "pages/Work/Work" },
    { icon: "my/approve.png", title: "我的审批", path: "pages/Work/Work" },
    { icon: "my/work.png", title: "加班统计", path: "pages/Work/Work" },
    { icon: "my/meeting.png", title: "会议记录", path: "pages/Work/Work" },
    { icon: "my/information.png", title: "我的资料", path: "pages/Work/Work" },
    { icon: "my/help.png", title: "帮助中心", path: "pages/Work/Work" },
  ]

  @Builder item() {
    Column() {
      ForEach(this.items, (item, index) => {
        Column() {
          Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            Row() {
              Image($rawfile(item.icon)).width(40).objectFit(ImageFit.Fill).borderRadius(20).margin({ right: 14 })
              Text(item.title).fontSize(18).fontWeight(500)
            }

            Row() {
              Text(">")
            }
          }
        }.borderWidth({ bottom: 1 }).borderColor("#f6f6f6").padding(10).onClick(() => {
          router.pushUrl({
            url: item.path
          })
        })
      })
    }
    .width("100%")
    .backgroundColor(Color.White)
    .borderRadius(5)
  }

  build() {
    Column() {
      Column() {
        Image($rawfile("my/user.png"))
          .width(50)
          .borderRadius(25)
          .objectFit(ImageFit.Fill)
          .margin({ bottom: 20 })
          .borderColor(Color.White)
        Row() {
          Text("张三").margin({ right: 16 }).fontSize(24)
          Text("技术部").fontSize(18).padding(5).backgroundColor("#555").fontColor("#fff")
        }.margin({ top: 20, bottom: 20 })

        Text("工号： 24455").fontSize(18).fontColor(Color.White)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height(220)
      .borderRadius({ bottomLeft: 20, bottomRight: 20 })
      .backgroundColor("#4749a1")
      .padding(10)


      Column() {
        Flex({ justifyContent: FlexAlign.SpaceBetween, direction: FlexDirection.Row, alignContent: FlexAlign.Center }) {
          Column() {
            Text("累计病假").margin({ bottom: 10 }).fontSize(20).fontWeight(700)
            Text("15").fontSize(22)
          }

          Column() {
            Text("累计病假").margin({ bottom: 10 }).fontSize(20).fontWeight(700)
            Text("15").fontSize(22)
          }

          Column() {
            Text("累计病假").margin({ bottom: 10 }).fontSize(20).fontWeight(700)
            Text("15").fontSize(22)
          }
        }.padding(20).backgroundColor(Color.White).borderRadius(5).margin({ top: -30 })
      }.padding(10)

      Column() {
        this.item()
      }.padding(10)

      // Column() {
      //   this.item()
      // }.padding(10)

    }.justifyContent(FlexAlign.Start).height("100%").width("100%")
    .backgroundColor("#f5f5f5")
  }
}