import { createDirectus, rest, staticToken, readSingleton } from '@directus/sdk'

interface Home {
  id: number
  title: string
  image: {
    id: string
    storage: string
    filename_disk: string
    filename_download: string
    title: string
    type: 'image/jpeg' | 'image/png' | 'image/gif' | 'image/webp' | 'image/svg+xml' | 'image/avif' | 'image/heic'
    folder: string | null
    uploaded_by: string
    created_on: string
    charset: string
    filesize: number
    width: number
    height: number
    duration: number
    embed: string | null
    tags: []
    metadata: {}
    uploaded_on: string
  }
}

interface Schema {
  home: Home
}

// TODO DTO

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()

  const client = createDirectus<Schema>(config.directusUrl).with(staticToken(config.directusToken)).with(rest())
  const home = await client.request(readSingleton('home', { fields: ['id', 'title', 'image'] }))

  return home
})