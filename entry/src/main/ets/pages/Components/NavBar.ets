import router from '@ohos.router'

@Component
export default struct NavBar {
  // ? 表示可省略传参
  private Title?: string

  goBack() {
    router.back()
  }

  build() {
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text("<").fontWeight(700).fontSize(24).onClick(() => {
          this.goBack()
        })
        Text(this.Title)
          .fontSize(24)
          .fontWeight(700)
        Text(" ")
      }
    }
    .width('100%').height(56).padding(10).backgroundColor(Color.White)
  }
}