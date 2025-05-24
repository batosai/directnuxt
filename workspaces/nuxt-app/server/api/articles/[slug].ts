import { createDirectus, rest, staticToken, readItems } from '@directus/sdk'

interface Article {
  id: number
  title: string
  status: 'published' | 'draft' | 'archived'
  slug: string
}

interface Schema {
  articles: Article[]
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()

  const client = createDirectus<Schema>(config.directusUrl).with(staticToken(config.directusToken)).with(rest())
  const articles = await client.request(readItems('articles', {
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