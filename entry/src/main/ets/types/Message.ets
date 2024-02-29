export interface Message {
  id?: string
  media_type: 'time' | 'text' | 'image' | 'video'
  content: string
  is_sender?: boolean
  created_at?: string | object
  nickname?: string // 发送消息人昵称
  receiver_id: string
  room: string
  sender_id: string
  status: 1 | 2 | 3 // 1 未读 2 已读,
  type: string
  avatar: string
}