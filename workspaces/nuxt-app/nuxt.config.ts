// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-05-15',
  devtools: { enabled: true },
  modules: ['@nuxt/eslint', '@nuxtjs/sitemap', '@nuxtjs/robots'],
  routeRules: {
    // Generated at build time for SEO purpose
    '/': { prerender: true },
    // Cached for 1 hour
    '/api/*': { 
      cache: process.env.NODE_ENV === 'production' 
        ? { maxAge: process.env.CACHE_MAX_AGE ? parseInt(process.env.CACHE_MAX_AGE) : 60 * 60 }
        : false
     },
  },
  runtimeConfig: {
    // Variables privées (côté serveur uniquement)
    directusToken: process.env.DIRECTUS_TOKEN,
    directusUrl: process.env.DIRECTUS_URL,
    // Variables publiques (accessibles côté client)
    public: {
      // Ajoutez ici les variables publiques si nécessaire
    }
  }
})