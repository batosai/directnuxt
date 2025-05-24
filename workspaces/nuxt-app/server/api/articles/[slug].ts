import type { Article } from '~/types/article'

import { createDirectus, rest, staticToken, readItems } from '@directus/sdk'

interface Schema {
  articles: Article[]
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()

  const client = createDirectus<Schema>(config.directusUrl).with(staticToken(config.directusToken)).with(rest())
  const articles = await client.request(readItems('articles', {
    fields: ['id', 'title', 'content', 'status', 'slug', 'seo'],
    filter: {
      slug: {
        _eq: event.context.params?.slug
      }
    }
  }))

  if (!articles[0]) {
    throw createError({ statusCode: 404, statusMessage: 'Page Not Found' })
  } else {
    return articles[0]
  }
})