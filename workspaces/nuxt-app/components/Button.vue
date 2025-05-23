<template>
  <button
    :class="[
      'px-4 py-2 rounded',
      size === 'small' ? 'text-sm' : size === 'large' ? 'text-lg' : 'text-base',
      primary ? 'bg-blue-500 text-white' : 'bg-gray-200 text-gray-800'
    ]"
    :style="{ backgroundColor }"
    @click="$emit('click')"
  >
    {{ label }}
  </button>
</template>

<script setup lang="ts">
defineProps<{
  label: string
  primary?: boolean
  size?: 'small' | 'medium' | 'large'
  backgroundColor?: string
}>()

defineEmits<{
  (e: 'click'): void
}>()
</script> 