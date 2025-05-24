export interface Home {
  id: number
  title: string
  image?: {
    id: string
    title: string
  } | null
  'image.id'?: string
  'image.title'?: string
}
