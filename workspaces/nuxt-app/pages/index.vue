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

  <img :src="`/assets/home/${home?.image?.id}/${home?.image?.title}.jpg`" :alt="home?.title">

  <NuxtLink to="/articles">Articles</NuxtLink>

  <NuxtRouteAnnouncer />
  <NuxtWelcome />
</template>
