import type { Article } from '~/types/article'

import { createDirectus, rest, staticToken, readItems } from '@directus/sdk'

interface Schema {
  articles: Article[]
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()

  const client = createDirectus<Schema>(config.directusUrl)
    .with(staticToken(config.directusToken))
    .with(rest())
  const articles = await client.request(readItems('articles'))

  return articles
})
