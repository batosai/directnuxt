import { createDirectus, rest, staticToken, readAssetRaw } from '@directus/sdk'

interface Image {
  id: number
}

interface Schema {
  image: Image
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()
  const filename = getRouterParam(event, 'filename')
  const id = filename?.split('.')[0]

  const client = createDirectus<Schema>(config.directusUrl).with(staticToken(config.directusToken)).with(rest())

  if (!id) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Image non trouvée',
    })
  }

  const result = await client.request(
    readAssetRaw(id, {
      width: 300,
      height: 300,
      quality: 50,
    }),
  )

  return result
})