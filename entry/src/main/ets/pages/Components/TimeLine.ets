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
      }.margin({ right: 10 })

      this.info()
    }

  }

  @Builder middle() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Line()
          .width(4)
          .height(32)
          .backgroundColor("#d0d0ff")
          .margin({ bottom: -2 })
        Circle().width(20).height(20).fill("#d0d0ff")
        Line()
          .width(4)
          .height(32)
          .backgroundColor("#d0d0ff")
          .margin({ top: -2 })
      }

      this.info()
    }.height(80)

  }

  @Builder end() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Line()
          .width(4)
          .height(60)
          .backgroundColor("#d0d0ff")
        Circle().width(20).height(20).fill("#d0d0ff")
      }.margin({ right: 10 })

      this.baseInfo()
    }.height(80)
  }

  @Builder baseInfo() {
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Start, direction: FlexDirection.Column }) {
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
    }.margin({ left: 30 })
  }

  @Builder info() {
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Start, direction: FlexDirection.Column }) {
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
    }.borderWidth({ bottom: 1 }).borderColor(Color.Gray).height(80).margin({ left: 30 })
  }

  build() {
    Column() {
      this.start()
      this.middle()
      this.end()
    }
  }
}