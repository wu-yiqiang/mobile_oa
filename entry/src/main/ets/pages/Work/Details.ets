import NavBar from '../Components/NavBar'
import TimeLine from '../Components/TimeLine'

@Entry
@Component
struct Details {
  @State message: string = '申请单详情'

  @Builder info() {
    Column() {
      Text("审批编号：20056").fontSize(20).margin({ top: 6, bottom: 6 })
      Text("所在部门：系统二部").fontSize(20).margin({ top: 6, bottom: 6 })
      Text("请假类型：事假").fontSize(20).margin({ top: 6, bottom: 6 })
      Text("开始时间：2020-09-12 08:30").fontSize(20).margin({ top: 6, bottom: 6 })
      Text("结束时间：2020-09-13 17:30").fontSize(20).margin({ top: 6, bottom: 6 })
      Text("请假天数：3天").fontSize(20).margin({ top: 6, bottom: 6 })
      Text("请假是由：家里有事").fontSize(20).margin({ top: 6, bottom: 6 })
    }
    .padding({ right: 10, left: 10, top: 20, bottom: 20 })
    .justifyContent(FlexAlign.Start)
    .backgroundColor(Color.White)
    .width("100%")
    .alignItems(HorizontalAlign.Start)
    .borderRadius(4)
    .margin({ top: 10 })
  }

  @Builder Card() {
    Column() {
      TimeLine()
    }
    .padding({ right: 10, left: 10, top: 10, bottom: 10 })
    .justifyContent(FlexAlign.Start)
    .backgroundColor(Color.White)
    .width("100%")
    .alignItems(HorizontalAlign.Start)
    .borderRadius(4)
    .margin({ top: 10 })
  }

  build() {
    Column() {
      NavBar({ Title: "请假申请详情" })

      Column() {

        Row() {
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            Row() {
              Circle()
                .width(20)
                .height(20)
                .fill(Color.Green)
                .borderRadius(10)
                .margin({ right: 10 })
              Text("张三请假申请").fontSize(20).fontWeight(700)
            }

            Row() {
              Text("待审批").fontSize(16).fontColor(Color.Red)
            }
          }

        }
        .width("100%")
        .padding({ right: 10, left: 10, top: 20, bottom: 20 })
        .backgroundColor(Color.White)
        .borderRadius(4)

        this.info()
        this.Card()
      }.padding(10).margin({ top: 10 })

    }.width("100%").height("100%").backgroundColor("#f5f5f5")
  }
}