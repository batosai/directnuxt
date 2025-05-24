<script setup lang="ts">
import { Header } from '@opsone/design_system'

const user = {"name":"Jane Doe"}

const { data: articles } = await useFetch('/api/articles')
const { data: home } = await useFetch('/api/home')
</script>

<template>
  <Header :user="user" />

  {{ articles }}
  {{ home }}

  <img :src="`/api/assets/${home?.image.id}/${home?.image.filename_download}`" :alt="home?.title">

  <NuxtRouteAnnouncer />
  <NuxtWelcome />
</template>
