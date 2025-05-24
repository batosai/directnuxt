import type { Home } from '~/types/home'

import { createDirectus, rest, staticToken, readSingleton } from '@directus/sdk'
interface Schema {
  home: Home
}

function HomeDTO(home: Home) {
  return {
    id: home.id,
    title: home.title,
    image: {
      id: home.image?.id,
      title: home.image?.title,
    },
  }
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()

  const client = createDirectus<Schema>(config.directusUrl)
    .with(staticToken(config.directusToken))
    .with(rest())
  const home = await client.request(
    readSingleton('home', {
      fields: ['id', 'title', 'image.id', 'image.title'],
    }),
  )

  return HomeDTO(home)
})
