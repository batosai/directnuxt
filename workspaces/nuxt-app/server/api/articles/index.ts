import { createDirectus, rest, staticToken, readItems } from '@directus/sdk'

interface Article {
  id: number
  title: string
  status: 'published' | 'draft' | 'archived'
}

interface Schema {
  articles: Article[]
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()

  const client = createDirectus<Schema>(config.directusUrl).with(staticToken(config.directusToken)).with(rest())
  const articles = await client.request(readItems('articles'))

  return articles
})