<script setup lang="ts">
import { Header } from '@opsone/design_system'

const user = {"name":"Jane Doe"}
const { slug } = useRoute().params

const article = await useArticlePage(slug as string)
</script>

<template>
  <Header :user="user" />

  <div v-if="article">
    {{ article }}
  </div>
</template>
