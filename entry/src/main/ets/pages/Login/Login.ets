import {login} from '../../api/User'
import PreferencesUtil from '../../utils/PreferencesUtil'
import router from '@ohos.router'
@Entry
@Component
struct Login {
  @State loginname: string = '13811112222' // 13811112222 13911111111 17704051019
  @State password: string = '123456'
  async onLogin() {
     router.replaceUrl({  url: 'pages/Home/Home' })
    // const res = await login({loginname: this.loginname, password: this.password})
    // if (res.code == 200) {
    //   console.log("sss", JSON.stringify(res))
    //     PreferencesUtil.saveToken(res.data.token)
    //     router.replaceUrl({  url: 'pages/Home/Home' })
    // }

  }
  build() {
    Column() {
      Image($rawfile("login/login1.png")).width("100%").height(300).objectFit(ImageFit.Fill)
      Column(){
        Row(){
          Image($rawfile("login/phone.png")).width(20).height(30).margin({left: 10})
          TextInput({placeholder: "请输入账号", text: this.loginname}).layoutWeight(1).borderRadius(0).backgroundColor(Color.White).height("100%").onChange((value) => {
            this.loginname = value
          })
        }.borderWidth(1).width("90%").height(50).borderColor("#d5d5d5").width("90%").borderRadius(0).margin({top: 30})
        Row(){
          Image($rawfile("login/password.png")).width(20).height(30).margin({left: 10})
          TextInput({placeholder: "请输入密码",  text: this.password}).type(InputType.Password).layoutWeight(1).borderRadius(0).backgroundColor(Color.White).height("100%").onChange((value) => {
            this.password = value
          })
        }.borderWidth(1).width("90%").height(50).borderColor("#d5d5d5").width("90%").borderRadius(0).margin({top: 20})
        Button("登录").width("86%").height(60).margin({top:20}).backgroundColor("#4749a1").onClick(() => {
          this.onLogin()
        })
      }.height(350).margin({top: -50}).width("90%").borderRadius(10).backgroundColor(Color.White)
    }
    .width('100%').height("100%").backgroundColor("#f5f5f5")
  }
}