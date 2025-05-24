export const useHomePage = async () => {
  const { data: home, error } = await useFetch('/api/home')

  if (error.value || !home) {
    throw createError({ 
      statusCode: 404, 
      statusMessage: 'Page non trouvé',
      fatal: true 
    })
  }

  return home
}