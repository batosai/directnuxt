<script setup lang="ts">
import { Header } from '@opsone/design_system'

const user = {"name":"Jane Doe"}
const { slug } = useRoute().params

const article = await useArticlePage(slug as string)
</script>

<template>
  <Head>
    <Title>{{ article?.seo?.title || article?.title }}</Title>
    <Meta name="description" :content="article?.seo?.meta_description" />
    <Meta property="og:title" :content="article?.seo?.title || article?.title" />
    <Meta property="og:description" :content="article?.seo?.meta_description" />
    <Meta property="og:image" :content="'/assets/meta_image/' + article?.seo?.og_image" />
    <Meta property="og:type" content="article" />

    <Meta name="robots" :content="article?.seo?.no_follow ? 'nofollow' : 'follow'" />
    <Meta name="robots" :content="article?.seo?.no_index ? 'noindex' : 'index'" />
    <Meta name="robots" :content="article?.seo?.no_follow && article?.seo?.no_index ? 'noindex, nofollow' : 'index, follow'" />
  </Head>

  <Header :user="user" />

  <div v-if="article">
    {{ article }}
  </div>
</template>
