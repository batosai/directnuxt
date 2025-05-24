import type { Home } from '~/types/home'

export const useHomePage = async () => {
  const { data: home, error } = await useFetch<Home>('/api/home')

  if (error.value || !home) {
    throw createError({ 
      statusCode: 404, 
      statusMessage: 'Page non trouvé',
      fatal: true 
    })
  }

  return home
}