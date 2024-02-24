@Entry
@Component
struct Weathers {
  @State location: string = "上海市，静安区"
  @State time: string = "20:09"
  @State columns: Array<object> = [{ title: '空气质量', value:
  '62' }, { title: '风速', value:
  '北风 1级' }, { title: '湿度', value:
  '64%' }, { title: '能见度', value:
  '13.2 公里' }, { title: '气压', value:
  '1037 hPa' }, { title: '露点', value:
  '-7 °' }]
  @State last10Day: Array<object> = [{
    date: '今晚',
    weather:
    '晴朗',
    feelTemperature: "27°C",
    temperature: "1°",
    rainfall: "10%"
  }, {
    date: '25日周一',
    weather:
    '晴朗',
    feelTemperature: "28°C",
    temperature: "121°",
    rainfall: "10%"
  }, {
    date: '26日周二',
    weather:
    '晴朗',
    feelTemperature: "29°C",
    temperature: "1",
    rainfall: "10%"
  }, {
    date: '27日周三',
    weather:
    '晴朗',
    feelTemperature: "300°C",
    temperature: "1",
    rainfall: "10%"
  }, {
    date: '今晚',
    weather:
    '晴朗',
    feelTemperature: "27",
    temperature: "1",
    rainfall: "10%"
  }, {
    date: '31日周三',
    weather:
    '晴朗',
    feelTemperature: "27",
    temperature: "1",
    rainfall: "10%"
  }, {
    date: '今晚',
    weather:
    '晴朗',
    feelTemperature: "",
    temperature: "1",
    rainfall: "10%"
  }, {
    date: '今晚',
    weather:
    '晴朗',
    feelTemperature: "27",
    temperature: "1",
    rainfall: "10%"
  }]
  @State temperature: string = '1°C'
  @State feelTemperature: string = '-7'

  build() {
    Column() {
      Row() {
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Image($rawfile("weather/logo.jpg")).height("100%")
          Radios()
        }.height("100%")
      }.width("100%").height(70).backgroundColor("rgb(29,40,50)").padding(10)

      Row() {
        Scroll() {
          Column() {
            Location({ location: this.location })
            Row() {
              Text(this.time) // 子组件的高度小于Scroll高度，不会触发滚动
                .fontSize(24)
                .size({ width: "100%", height: 40 }).fontColor('#f0f0f0')

            }

            Weather({ Temperature: this.temperature, FeelTemperature: this.feelTemperature })

            ItemComponent({ list: this.columns })

            Card({ leftTitle: '10 日预告', rightTitle: '每小时预报 >' }) {
              WeatherForecast({ list: this.last10Day })
            }

            Card({ leftTitle: '日出日落和月相' }) {
              Column() {
                Row() {
                  Flex({
                    direction: FlexDirection.Row,
                    justifyContent: FlexAlign.Center,
                    alignItems: ItemAlign.Center
                  }) {
                    Row() {

                      Flex({
                        direction: FlexDirection.Row,
                        justifyContent: FlexAlign.Center,
                        alignItems: ItemAlign.Center
                      }) {
                        Image($rawfile("weather/sun.svg")).width(40).margin({ right: 5 })
                        Flex({
                          direction: FlexDirection.Column,
                          justifyContent: FlexAlign.Center,
                          alignItems: ItemAlign.Start
                        }) {
                          Text("紫外线指数").fontColor("#fff").fontSize(18)
                          Text("2•低").fontColor("#fff").fontSize(20).fontWeight(700)
                        }.margin({ left: 5 })

                      }
                    }.width("50%").height(100)

                    Row() {
                      Flex({
                        direction: FlexDirection.Row,
                        justifyContent: FlexAlign.Center,
                        alignItems: ItemAlign.Center
                      }) {
                        Image($rawfile("weather/moon.svg")).width(40).margin({ right: 5 })
                        Flex({
                          direction: FlexDirection.Column,
                          justifyContent: FlexAlign.Center,
                          alignItems: ItemAlign.Start
                        }) {
                          Text("月相").fontColor("#fff").fontSize(18)
                          Text("凸盈月").fontColor("#fff").fontSize(20).fontWeight(700)
                        }.margin({ left: 5 })

                      }
                    }.width("50%").height(80)
                  }

                }.width("100%")

                Row() {
                  Text("10小时57分").fontSize(20).fontWeight(700).fontColor("#fff")
                }.margin({ bottom: 10 })

                Row() {

                  Column() {
                    Progress({
                      value: 70, // 设置当前进度
                      total: 100, // 设置进度总量
                      type: ProgressType.Eclipse, // 设置进度条的样式为圆形样式
                    })
                      .size({ width: 100, height: 100 }).color("#f28d00").backgroundColor("#e6e6e6")
                    Flex({
                      direction: FlexDirection.Row,
                      justifyContent: FlexAlign.SpaceBetween,
                    }) {
                      Column() {
                        Text("日出").fontColor("#fff").fontSize(16)
                        Text("06:50").fontColor("#fff").fontSize(18).fontWeight(700)
                      }

                      Column() {
                        Text("日落").fontColor("#fff").fontSize(16)
                        Text("16:57").fontColor("#fff").fontSize(18).fontWeight(700)
                      }
                    }.width(100).margin({ top: 10 })
                  }
                }

              }.height("100%")
            }

          }
          .padding(10)

        }.width("100%")
      }
      .width('100%')
      .padding({ bottom: 60 })
      .backgroundImage($rawfile("weather/CloudyNight.png"))
      .backgroundImageSize({ width: "100%" })

    }.width("100%")
  }

  aboutToAppear() {
    // let httpRequest = http.createHttp()
    // let url = 'https://api.vvhan.com/api/weather?city=上海市'
    // httpRequest.request(url,
    //   {
    //     method: http.RequestMethod.GET,
    //     header: {
    //       'Content-Type': 'application/json'
    //     },
    //   },
    //   (err, data) => {
    //     // 处理数据
    //     console.log('sss121324333', err, JSON.parse(`${data}`))
    //     if (!err) {
    //       var datas = JSON.parse(`${data}`).city
    //       console.log('sss', datas)
    //     }
    //   })
  }
}

@Component
struct WeatherForecast {
  list: Array<object> = []

  build() {
    List() { // List默认竖直方向排列子组件
      ForEach(this.list, (item: any, index?: number) => {
        ListItem() {
          Column() {
            Text(item.date)
              .fontSize(18)
              .fontWeight(700)
              .fontColor("#fff")
              .width('100%')
              .textAlign(TextAlign.Center)
              .height("20%")
            Image($rawfile("weather/ClearNightV3.svg"))
              .height('20%')
            Text(item.feelTemperature ? item.feelTemperature : "--")
              .fontSize(18)
              .fontWeight(700)
              .textAlign(TextAlign.Center)
              .fontColor("#fff")
              .height('20%')
            Text(item.temperature ? item.temperature : "--")
              .fontSize(18)
              .fontWeight(700)
              .textAlign(TextAlign.Center)
              .fontColor("#fff")
              .height('20%')
            Text(item.rainfall ? item.rainfall : "--")
              .fontSize(18)
              .fontWeight(700)
              .textAlign(TextAlign.Center)
              .fontColor("#fff")
              .height('20%')
          }.height("100%").width("25%")
        }.height("100%")
      })
    }.width("100%").listDirection(Axis.Horizontal).borderRadius({ bottomRight: 10, bottomLeft: 10 })

  }
}

@Component
struct ItemComponent {
  list: Array<object> = []

  build() {
    Row() {
      Grid() {
        ForEach(this.list, (item) => { // ForEach语法，循环创建GridItem
          GridItem() { // 子组件只能是GirdItem
            Flex({
              direction: FlexDirection.Column,
              justifyContent: FlexAlign.Center,
              alignItems: ItemAlign.Center
            }) {
              Column() {
                Row() {
                  Text(item.title + " >")
                    .fontSize(20)
                    .fontColor(Color.White)
                    .opacity(0.8)
                    .width('100%')
                    .margin({ bottom: 10 })
                }

                if (item.title === "空气质量") {
                  Row() {
                    Circle()
                      .width(10)
                      .height(10)
                      .strokeWidth(3)
                      .fill(Color.Green)
                      .margin({ right: 5 })
                    Text(item.value)
                      .fontSize(20).fontWeight(700).fontColor(Color.White)
                  }.width("100%")
                } else {
                  Text(item.value)
                    .fontSize(20).fontWeight(700).fontColor(Color.White)
                    .width('100%')
                }
              }

            }
          }
        })
      }
      .height(150)
      .columnsTemplate("1fr 1fr 1fr") // 设置Grid为3列，并且均分
      .columnsGap(0) // 设置列间距为10vp
      .rowsGap(15) // 设置行间距为10vp
      .width('100%')
      .margin({ top: 20 })
    }
  }
}

@Component
struct Location {
  location: string = ''

  build() {
    Row() {
      Text(this.location) // 子组件的高度小于Scroll高度，不会触发滚动
        .fontSize(24)
        .size({ width: "100%", height: 40 }).fontColor('#fff')

    }
  }
}

@Component
struct Weather {
  Temperature: string = '1'
  FeelTemperature: String = '-6'

  build() {
    Row() {
      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: ItemAlign.Center
      }) {
        Image($rawfile("weather/ClearNight.png")).height(100)
        Text(this.Temperature).fontSize(70).fontColor("#fff").textAlign(TextAlign.Center)
        Column() {
          Flex({
            direction: FlexDirection.Column,
            alignContent: FlexAlign.Start
          }) {
            Text("晴朗").fontSize(30).fontColor("#fff").fontWeight(700)
            Text(`体感温度 ${this.FeelTemperature}°`).fontSize(20).fontColor("#fff")
          }
        }
      }
    }.width("100%")
  }
}

@Component
struct Card {
  leftTitle: string = ''
  rightTitle: string = ''
  @BuilderParam child: () => {}

  build() {
    Column() {
      Row() {
        Flex({
          direction: FlexDirection.Row,
          justifyContent: FlexAlign.SpaceBetween,
          alignItems: ItemAlign.Center
        }) {
          Text(this.leftTitle).fontSize(22).fontColor("#ffffff").fontWeight(700)
          if (this.rightTitle) {
            Text(this.rightTitle).fontSize(20).fontColor("#a1b5d0").onClick(() => {
              // 跳转详情页
            })
          }

        }.padding({ left: 20, right: 20 })
      }
      .height(50)
      .width("100%")
      .border({
        width: { bottom: 1 },
        color: Color.White,
        style: BorderStyle.Solid,
      })

      Row() {
        this.child()
      }.width("100%").height(290)
    }
    .width("100%")
    .height(340)
    // .backgroundColor("#fff")
    // .opacity(0.1)
    .backdropBlur(10)
    .shadow({ radius: 10 })
    .borderRadius(10)
    .margin({ bottom: 10 })
  }
}

@Component
struct Radios {
  @State isCel: boolean = true

  build() {
    Row() {
      if (this.isCel) {
        Text("°F")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .onClick(() => {
            this.isCel = false
          })
        Text("°C")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .active()
          .onClick(() => {
            this.isCel = true
          })
      }
      if (!this.isCel) {
        Text("°F")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .active()
          .onClick(() => {
            this.isCel = false
          })
        Text("°C")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .onClick(() => {
            this.isCel = true
          })
      }

    }.width(100).height(35).backgroundColor(Color.Gray).borderRadius(4)
  }
}

@Extend(Text) function active() {
  .backgroundColor(Color.White).borderRadius(4).fontColor(Color.Black).fontWeight(700)
}