<script setup lang="ts">
import { Header } from '@opsone/design_system'

const user = {"name":"Jane Doe"}
const { slug } = useRoute().params

const { data: article, error } = await useFetch(`/api/articles/${slug}`)

if (error.value || !article.value) {
  throw createError({ 
    statusCode: 404, 
    statusMessage: 'Article non trouvé',
    fatal: true 
  })
}
</script>

<template>
  <Header :user="user" />

  <div v-if="article">
    {{ article }}
  </div>
</template>
