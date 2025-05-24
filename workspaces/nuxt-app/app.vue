<script setup lang="ts">
import { Header } from '@opsone/design_system'

const user = {"name":"Jane Doe"}

const { data } = await useFetch('/api/articles')
</script>

<template>
  <Header :user="user" />

  {{ data }}

  <NuxtRouteAnnouncer />
  <NuxtWelcome />
</template>
