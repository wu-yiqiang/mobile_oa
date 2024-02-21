@Entry
@Component
export struct Work {
  @State message: string = 'work'

  @Builder buildTop() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Text("我的办公").fontColor(Color.White).fontSize(30).fontWeight(700)
      Row() {
        Column() {
          Text("8°C").fontColor(Color.White).fontSize(22)
          Text("12月8日").fontColor(Color.White).fontSize(22)
        }

        Column() {
          Image($rawfile("work/weather.png")).height(60).objectFit(ImageFit.Fill)
        }
      }
    }
    .height('100vp')
    .width('100%')
    .borderColor({ bottom: '#6a6cb2' })
    .borderWidth({ bottom: 1 })
    .backgroundColor('#4749a1')
    .padding({ right: 5, left: 5 })
  }

  @Builder buildTips() {
    Row() {
      Column() {
        Text("待审批").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("15").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.margin({ left: 5, right: 5 })

      Column() {
        Text("会议提醒").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("2").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.margin({ left: 5, right: 5 })

      Column() {
        Text("周报").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("1").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.margin({ left: 5, right: 5 })

      Column() {
        Text("工作汇报").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("5").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.margin({ left: 5, right: 5 })
    }
    .backgroundColor('#4749a1')
    .width("100%")
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Top)
    .height(200)
    .padding({ top: 10 })
  }

  @Builder buildAppManagement() {
    Row() {
      Column() {
        Text("s事实上事实上收拾收事事实上实萨达萨达上拾d")
        Column()
      }

      Column() {
        Text("sdss")
      }
    }
    .margin({ top: -100 })
    .backgroundColor(Color.White)
    .height(300)
    .borderRadius(8)
    .padding(10)
  }

  @Builder buildApplyFor() {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      Column() {
        Text("s事实上事实上收拾收事事实上实萨达萨达上拾d")
      }

      Column() {
        Text("sdss")
      }
    }
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      this.buildTop()
      List() {
        // 提示信息
        this.buildTips()
        // 应用管理
        this.buildAppManagement()
        this.buildApplyFor()
      }.alignListItem(ListItemAlign.Center)
      .width('100%')
      .height('100%')
      .padding({
        top: 100 })
    }.width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }
}


