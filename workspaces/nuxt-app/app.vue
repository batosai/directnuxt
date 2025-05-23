<script setup lang="ts">
import { Header } from '@opsone/storybook'

const user = {"name":"Jane Doe"}
</script>

<template>
  <Header :user="user" />
  <NuxtRouteAnnouncer />
  <NuxtWelcome />
</template>
