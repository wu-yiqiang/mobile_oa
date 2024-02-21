export type ApiRes<T> = {
  code: number
  data: T
  message: string
}