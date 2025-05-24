<script setup lang="ts">
import { Header } from '@opsone/design_system'

const user = { name: 'Jane Doe' }

const articles = await useArticlesPage()
</script>

<template>
  <Header :user="user" />

  {{ articles }}

  <template v-for="article in articles">
    <NuxtLink
      v-if="article"
      :key="article.id"
      :to="`/articles/${article.slug}`"
      >{{ article.title }}</NuxtLink
    >
    <br />
  </template>
</template>
