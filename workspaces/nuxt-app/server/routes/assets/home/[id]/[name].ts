import { createDirectus, rest, staticToken, readAssetRaw } from '@directus/sdk'

interface Image {
  id: number
}

interface Schema {
  image: Image
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()
  const id = getRouterParam(event, 'id')

  const client = createDirectus<Schema>(config.directusUrl).with(staticToken(config.directusToken)).with(rest())

  const result = await client.request(
    readAssetRaw(id!, {
      width: 300,
      height: 300,
      quality: 50,
      format: 'jpg',
      fit: 'contain',
    }),
  )

  return result
})