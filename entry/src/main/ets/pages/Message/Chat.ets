import NavBar from '../components/NavBar'
import { Message } from '../../types/Message'
import promptAction from '@ohos.promptAction'
import picker from '@ohos.file.picker'

@Entry
@Component
struct Chat {
  @State textFocusable: boolean = true;
  @State friendName: string = "张一山";
  @State messageList: Message[] = [];
  @State isSendMedia: boolean = false;
  @State sendContent: string = ''
  private ws = null
  room = "30908286-466b-485e-b673-332db053bd18"
  listScroller: Scroller = new Scroller()
  aboutToAppear() {
    this.messageList = [
      {
        id: '1001',
        media_type: 'time',
        content: '18:17',
        is_sender: false,
        created_at: '18:17',
        nickname: '张一山',
        status: 2,
        room: "10001",
        receiver_id: "111222333",
        sender_id: "111222333",
        type: "",
        avatar: "",
      }, {
      id: '1002',
      media_type: 'text',
      is_sender: false,
      content: '工作进度怎样',
      created_at: '18:17',
      nickname: '张一山',
      status: 2,
      room: "10001",
      receiver_id: "111222333",
      sender_id: "111222333",
      type: "",
      avatar: "",
    }, {
      id: '1003',
      media_type: 'text',
      is_sender: true,
      content: '你好!',
      created_at: '18:17',
      nickname: '黄永玉',
      status: 2,
      room: "10001",
      receiver_id: "111222333",
      sender_id: "111222333",
      type: "",
      avatar: ""
    },
      {
        id: '1004',
        media_type: 'text',
        is_sender: true,
        content: '整体进度20%了',
        created_at: '18:17',
        nickname: '黄永玉',
        status: 1,
        room: "10001",
        receiver_id: "111222333",
        sender_id: "111222333",
        type: "",
        avatar: "",
      }]
  }


  // 发送文本消息
  sendTextMessage() {
    this.textFocusable = false
    setTimeout(() => {
      this.textFocusable = true
    }, 200)
    if (this.sendContent.trim().length === 0) {
      return promptAction.showToast({
        message: "消息不能为空", duration: 800,
        bottom: 100
      })
    }
    const message: Message = {
      content: this.sendContent,
      media_type: "text",
      receiver_id: "user_da8add51-4bcc-4d82-a4c3-dcd7a44b527b",
      room: "30908286-466b-485e-b673-332db053bd18",
      sender_id: "user_b7d8955c-8339-458e-a13b-461b1271e5d4",
      is_sender: true,
      status: 1,
      type: "private",
      avatar: "https://img2.baidu.com/it/u=1477138556,2382360194&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400",
      nickname: "张三",
      created_at: new Date(),
    }
    // 发送给服务器
    this.ws.send(JSON.stringify(message))
    // 清空输入框中的内容
    this.sendContent = ''
    setTimeout(() => {
      this.listScroller.scrollToIndex(this.messageList.length - 1)
    }, 200)
  }

  @Builder buildMessageTime(message: Message) {
    Row() {
      Text(message.content)
        .fontColor('#99a7c6')
        .fontSize(12)
    }
    .height(40)
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder buildLeftMessage(message: Message) {
    Row() {
      Text(message.nickname.substring(0, 1))
        .fontColor(Color.White)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#6467d3')
        .width(50)
        .height(50)
        .borderRadius(25)
        .textAlign(TextAlign.Center)
      if (message.media_type === 'text') {
        Text(message.content) {
        }
        .fontSize(14)
        .fontColor('#000000')
        .padding({
          left: 10,
          top: 15,
          bottom: 15,
          right: 10
        })
        .borderWidth(1)
        .margin({
          left: 20 })
        .borderRadius(5)
        .borderColor('#e3e3e3')
      } else if (message.media_type === 'image') {
        Row() {
          Image(message.content)
            .objectFit(ImageFit.Fill)
            .width(140)
            .height(140)
            .padding(5)
        }
        .borderWidth(1)
        .margin({
          left: 20 })
        .borderRadius(5)
        .borderColor('#e3e3e3')
      } else if (message.media_type === 'video') {
        Row() {
          Video({ src: message.content })
            .width(180)
            .height(180)
            .padding(5)
        }
        .borderWidth(1)
        .margin({
          left: 20 })
        .borderRadius(5)
        .borderColor('#e3e3e3')
      }
      Text(message.status === 1 ? '未读' : '已读').fontSize(14)
        .fontColor('#6f6f6f')
        .margin({ left: 15 })
        .alignSelf(ItemAlign.Center)
    }
    .alignItems(VerticalAlign.Top)
    .padding(10)
    .width('100%')
    .height(message.media_type === 'text' ? 80 : message.media_type === 'video' ?
                                                   200 : 160)
  }

  @Builder buildRightMessage(message: Message) {
    Row() {
      Text(message.status === 1 ? '未读' : '已读').fontSize(14)
        .fontColor('#6f6f6f')
        .margin({
          right: 15 })
        .alignSelf(ItemAlign.Center)
      if (message.media_type === 'text') {
        Text(message.content)
          .fontSize(14)
          .fontColor('#000000')
          .padding({
            left: 10,
            top: 15,
            bottom: 15,
            right: 10
          })
          .margin({
            right: 20 })
          .borderRadius(5)
          .backgroundColor('#f5f3f3')
      } else if (message.media_type === 'image') {
        Row() {
          Image(message.content)
            .objectFit(ImageFit.Fill)
            .width(140)
            .height(140)
            .padding(5)
        }
        .borderWidth(1)
        .margin({
          right: 20 })
        .borderRadius(5)
        .borderColor('#e3e3e3')
        .height('100%')
      } else if (message.media_type === 'video') {
        Row() {
          Video({ src: message.content })
            .width(180)
            .height(180).padding(5)
        }
        .borderWidth(1)
        .margin({
          right: 20 })
        .borderRadius(5)
        .borderColor('#e3e3e3')
        .height('100%')
      }
      Text(message.nickname.substring(0, 1))
        .fontColor(Color.White)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .backgroundColor('#6467d3')
        .width(50)
        .height(50)
        .borderRadius(25)
        .textAlign(TextAlign.Center)
    }
    .alignItems(VerticalAlign.Top)
    .padding(10)
    .width('100%')
    .height(message.media_type === 'text' ? 80 : message.media_type === 'video' ?
                                                   200 : 160)
    .justifyContent(FlexAlign.End)
  }

  @Builder buildMessageList() {
    List() {
      ForEach(this.messageList, (message: Message) => {
        ListItem() {
          if (message.media_type === 'time') {
            this.buildMessageTime(message)
          } else {
            if (message.is_sender) {
              this.buildRightMessage(message)
            } else {
              this.buildLeftMessage(message)
            }
          }
        }
      })
    }
    .width('100%')
    .height('100%')
    .padding({
      bottom: this.isSendMedia ? 240 : 120
    })
  }

  @Builder buildFooter() {
    Column() {
      // 输入框部分
      Row() {
        Image($rawfile("message/voice1.png"))
          .width(38)
          .height(38)
        TextInput({
          placeholder: "输入聊天内容", text: this.sendContent
        })
          .onClick(() => {
            this.textFocusable = true
          })
          .focusable(this.textFocusable)
          .focusOnTouch(true)
          .height('100%')
          .layoutWeight(1)
          .onFocus(() => {
            this.isSendMedia = false
          })
          .onChange(value => {
            this.sendContent = value
          })
        if (this.sendContent.trim().length > 0) {
          Button("发送")
            .backgroundColor('#4749a1')
            .fontColor(Color.White)
            .margin({
              left: 10 })
            .type(ButtonType.Normal)
            .borderRadius(5)
            .focusOnTouch(true)
            .onClick(() => {
              this.sendTextMessage()
            })
        } else {
          Image($rawfile("message/smile1.png"))
            .width(46)
            .height(46)
            .objectFit(ImageFit.Fill)
            .margin({
              left: 5,
              right: 5 })
          Text("+")
            .backgroundColor('#000000')
            .fontColor(Color.White)
            .width(30)
            .height(30)
            .borderRadius(15)
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .focusOnTouch(true)
            .textAlign(TextAlign.Center)

            .onClick(() => {
              this.isSendMedia = !this.isSendMedia
              this.textFocusable = false
            })
        }
      }
      .borderWidth({
        top: 1 })
      .borderColor({
        top: '#f5f5f5'
      })
      .height(60)
      .padding(10)
      .width('100%')
      .backgroundColor(Color.White)

      if (this.isSendMedia) {
        Row() {
          Column() {
            Image($rawfile("message/image1.png"))
              .width(46)
              .height(38)
            Text('图片').margin({
              top: 5 })
              .fontColor('#101010')
              .fontSize(18)
          }
          .margin({ left: 20 })

          Column() {
            Image($rawfile("message/photo1.png"))
              .width(46)
              .height(38)
            Text('视频').margin({
              top: 5 })
              .fontColor('#101010')
              .fontSize(18)
          }
          .margin({ left: 30 })
        }
        .backgroundColor(Color.White)
        .width('100%')
        .height(120)
      }
    }
  }

  build() {
    Stack() {
      Column() {
        // 1、标题栏
        NavBar({ title: this.friendName })
        // 2、聊天消息
        this.buildMessageList()

      }
      .width('100%').height("100%").layoutWeight(1)
      // 3、底部区域
      this.buildFooter()
    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.BottomEnd)
    .backgroundColor(Color.White)

  }
}