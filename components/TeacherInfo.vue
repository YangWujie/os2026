<script setup>
defineProps({
  name: String,
  email: String,
  phone: String,
  office: String
})
</script>

<template>
  <div class="max-w-xl mx-auto space-y-4">
    <div class="flex items-center gap-4 p-4 rounded-xl bg-gray-500/10 border-l-4 border-primary shadow-sm">
      <div class="text-2xl">👤</div>
      <div>
        <span class="opacity-60 text-xs block">NAME</span>
        <b class="text-base">{{ name }}</b>
      </div>
    </div>

    <div class="flex items-center gap-4 p-4 rounded-xl bg-gray-500/10 border-l-4 border-primary shadow-sm">
      <div class="text-2xl">📧</div>
      <div>
        <span class="opacity-60 text-xs block">EMAIL</span>
        <b class="text-base">{{ email }}</b>
      </div>
    </div>

    <div class="flex items-center gap-4 p-4 rounded-xl bg-gray-500/10 border-l-4 border-primary shadow-sm">
      <div class="text-2xl">📞</div>
      <div>
        <span class="opacity-60 text-xs block">PHONE</span>
        <b class="text-base">{{ phone }}</b>
      </div>
    </div>
  </div>
</template>