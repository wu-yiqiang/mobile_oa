import router from '@ohos.router'

@Component
export default struct TopBar {
  private title?: string

  build() {
    
    Row() {
      Text(`${this.title}`).fontSize(22).fontColor(Color.White)
    }
    .width('100%')
    .height(60)
    .padding(10)
    .backgroundColor("#4749a1")
    .justifyContent(FlexAlign.Center)

  }
}