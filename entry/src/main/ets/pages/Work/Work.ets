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
    Flex({ justifyContent: FlexAlign.SpaceBetween, direction: FlexDirection.Row, alignContent: FlexAlign.Center }) {
      Column() {
        Text("待审批").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("15").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.padding(10)

      Column() {
        Text("会议提醒").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("2").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.padding(10)

      Column() {
        Text("周报").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("1").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.padding(10)

      Column() {
        Text("工作汇报").fontWeight(700).fontColor("#8888cd").fontSize(20)
        Text("5").fontWeight(700).fontColor("#fff").fontSize(18).margin({ top: 5 })
      }.padding(10)

    }
    .backgroundColor('#4749a1')
    .width("100%")
    .height(200)
    .padding({ top: 10, right: 20, left: 20 })
  }

  @Builder buildAppManagement() {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Column() {
          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Row() {
                Image($rawfile('work/menu.png')).width(24).objectFit(ImageFit.Fill)
                Text("应用管理").fontColor(Color.Black).fontSize(20).fontWeight(700)
              }

              Row() {
                Text("自定义").fontColor(Color.Gray).fontSize(16)
                Text(" > ").fontColor(Color.Gray).fontSize(16)
              }
            }.padding(10)
          }.borderColor({ bottom: Color.Gray }).borderWidth({ bottom: "1vp" })


          Grid() {
            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/process.png")).width(32).objectFit(ImageFit.Fill)
                Text("请假申请").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/clock.png")).width(32).objectFit(ImageFit.Fill)
                Text("考勤打卡").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/report.png")).width(32).objectFit(ImageFit.Fill)
                Text("汇报").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/approve.png")).width(32).objectFit(ImageFit.Fill)
                Text("OA审批").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/card.png")).width(32).objectFit(ImageFit.Fill)
                Text("补卡申请").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/salary.png")).width(32).objectFit(ImageFit.Fill)
                Text("工资单").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/notice.png")).width(32).objectFit(ImageFit.Fill)
                Text("公司公告").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

            GridItem() { // 子组件只能是GirdItem
              Column() {
                Image($rawfile("work/rule.png")).width(32).objectFit(ImageFit.Fill)
                Text("规章制度").fontWeight(700).fontSize(16).fontColor(Color.Black).margin(5)
              }
            }

          }
          .columnsTemplate("1fr 1fr 1fr 1fr") // 设置Grid为3列，并且均分
          .width('100%')
          .height(150)
          .columnsGap(10) // 设置列间距为10vp
          .padding(10)
          .rowsGap(10) // 设置行间距为10vp
        }

      }
      .width("100%")
      // .height(300)
      .margin({ top: -100 })
      .backgroundColor(Color.White)
      .borderRadius(8)
    }.padding(14).margin({ bottom: 10 })

  }

  @Builder buildApplyFor() {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Column() {
          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Row() {
                Image($rawfile('work/badge.png')).width(24).objectFit(ImageFit.Fill)
                Text("我的申请").fontColor(Color.Black).fontSize(20).fontWeight(700)
              }

              Row() {
                Text("更多").fontColor(Color.Gray).fontSize(16)
                Text(" > ").fontColor(Color.Gray).fontSize(16)
              }
            }.padding(10)
          }.borderColor({ bottom: Color.Gray }).borderWidth({ bottom: "1vp" })

          Stack({ alignContent: Alignment.TopStart }) {
            Column() {
              Circle()
                .width(20)
                .height(20).fill(Color.Green).borderRadius(10)
            }.margin({ right: 5 })

            Column() {
              Text("请假申请").fontSize(22).fontWeight(700)
              Text("2020-09-12 ~ 2021-08-12").fontSize(18).margin({ top: 10, bottom: 10 })
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Text("申请时间：2020-09-11 12:00").fontSize(18)
                Text("待审批").fontSize(16).fontColor(Color.Red)
              }
            }

          }.padding(10)

        }
        .width("100%")
        .backgroundColor(Color.White)
        .borderRadius(8).margin({ bottom: 2 })
      }.padding(14).margin({ bottom: 10 })

      Stack({ alignContent: Alignment.TopStart }) {
        Column() {
          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Row() {
                Image($rawfile('work/badge.png')).width(24).objectFit(ImageFit.Fill)
                Text("我的申请").fontColor(Color.Black).fontSize(20).fontWeight(700)
              }

              Row() {
                Text("更多").fontColor(Color.Gray).fontSize(16)
                Text(" > ").fontColor(Color.Gray).fontSize(16)
              }
            }.padding(10)
          }.borderColor({ bottom: Color.Gray }).borderWidth({ bottom: "1vp" })

          Stack({ alignContent: Alignment.TopStart }) {
            Column() {
              Circle()
                .width(20)
                .height(20).fill(Color.Green).borderRadius(10)
            }.margin({ right: 5 })

            Column() {
              Text("请假申请").fontSize(22).fontWeight(700)
              Text("2020-09-12 ~ 2021-08-12").fontSize(18).margin({ top: 10, bottom: 10 })
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Text("申请时间：2020-09-11 12:00").fontSize(18)
                Text("待审批").fontSize(16).fontColor(Color.Red)
              }
            }

          }.padding(10)

        }
        .width("100%")
        .backgroundColor(Color.White)
        .borderRadius(8).margin({ bottom: 2 })
      }.padding(14).margin({ bottom: 10 })

      Stack({ alignContent: Alignment.TopStart }) {
        Column() {
          Column() {
            Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
              Row() {
                Image($rawfile('work/badge.png')).width(24).objectFit(ImageFit.Fill)
                Text("我的申请").fontColor(Color.Black).fontSize(20).fontWeight(700)
              }

              Row() {
                Text("更多").fontColor(Color.Gray).fontSize(16)
                Text(" > ").fontColor(Color.Gray).fontSize(16)
              }
            }.padding(10)
          }.borderColor({ bottom: Color.Gray }).borderWidth({ bottom: "1vp" })

          Stack({ alignContent: Alignment.TopStart }) {
            Column() {
              Circle()
                .width(20)
                .height(20).fill(Color.Green).borderRadius(10)
            }.margin({ right: 5 })

            Column() {
              Text("请假申请").fontSize(22).fontWeight(700)
              Text("2020-09-12 ~ 2021-08-12").fontSize(18).margin({ top: 10, bottom: 10 })
              Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                Text("申请时间：2020-09-11 12:00").fontSize(18)
                Text("待审批").fontSize(16).fontColor(Color.Red)
              }
            }

          }.padding(10)

        }
        .width("100%")
        .backgroundColor(Color.White)
        .borderRadius(8).margin({ bottom: 2 })
      }.padding(14).margin({ bottom: 10 })
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
