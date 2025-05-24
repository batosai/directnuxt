import type { Article } from '~/types/article'

export const useArticlePage = async (slug: string) => {
  const { data: article, error } = await useFetch<Article>(
    `/api/articles/${slug}`,
  )

  if (error.value || !article) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Article non trouvé',
      fatal: true,
    })
  }

  return article
}

export const useArticlesPage = async () => {
  const { data: articles, error } = await useFetch<Article[]>('/api/articles')

  if (error.value || !articles) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Page non trouvé',
      fatal: true,
    })
  }

  return articles
}
