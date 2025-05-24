<script setup lang="ts">
import { Header } from '@opsone/design_system'

const user = {"name":"Jane Doe"}

const articles = await useArticlesPage()
const home = await useHomePage()
</script>

<template>
  <Header :user="user" />

  {{ articles }}
  <br />
  <br />
  {{ home }}

  <img :src="`/api/assets/${home?.image?.id}/${home?.image?.title}.jpg`" :alt="home?.title">

  <NuxtRouteAnnouncer />
  <NuxtWelcome />
</template>
