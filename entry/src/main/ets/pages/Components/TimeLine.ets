import router from '@ohos.router'

@Component
export default struct TimeLine {
  private current: string

  @Builder start() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Circle().width(20).height(20).fill("#d0d0ff")
        Line()
          .width(4)
          .height(60)
          .backgroundColor("#d0d0ff")
          .borderRadius(6)
      }

      this.info()
    }.height(80)

  }

  @Builder middle() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Line()
          .width(4)
          .height(32)
          .backgroundColor("#d0d0ff")
          .borderRadius(6)
          .margin({ bottom: -2 })
        Circle().width(20).height(20).fill("#d0d0ff")
        Line()
          .width(4)
          .height(32)
          .backgroundColor("#d0d0ff")
          .borderRadius(6)
          .margin({ top: -2 })
      }

      this.info()
    }.height(80)

  }

  @Builder end() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Circle().width(20).height(20).fill("#d0d0ff")
      }

      this.endiInfo()
    }.height(80)
  }

  @Builder endiInfo() {
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Column() {
          Row() {
            Text("张茜茜").fontWeight(700).fontSize(20).margin({ right: 20 })
            Text("发起人").padding(5).backgroundColor(Color.Pink).fontSize(16).borderRadius(4)
          }.justifyContent(FlexAlign.Start)

          Row() {
            Text("已审批").fontSize(18).fontColor(Color.Gray)
          }.justifyContent(FlexAlign.Start)

        }

        Column() {
          Text("2022-12-07 15:00").fontSize(16)
        }
      }
    }
  }

  @Builder info() {
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Column() {
          Row() {
            Text("张茜茜").fontWeight(700).fontSize(20).margin({ right: 20 })
            Text("发起人").padding(5).backgroundColor(Color.Pink).fontSize(16).borderRadius(4)
          }.justifyContent(FlexAlign.Start)

          Row() {
            Text("已审批").fontSize(18).fontColor(Color.Gray)
          }.justifyContent(FlexAlign.Start)

        }

        Column() {
          Text("2022-12-07 15:00").fontSize(16)
        }
      }
    }.borderWidth({ bottom: 1 }).borderColor(Color.Gray).margin({ left: 30 })
  }

  build() {
    Column() {
      this.start()
      this.middle()
      this.end()
    }.backgroundColor(Color.Blue)
  }
}