export interface Article {
  id: number
  title: string
  slug: string
  status: 'published' | 'draft' | 'archived'
  content?: any
  seo?: {
    no_index: boolean
    no_follow: boolean
    title: string
    meta_description: string
    og_image: string
  }
}