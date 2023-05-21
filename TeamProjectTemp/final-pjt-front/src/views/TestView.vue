<template>
  <div>
    <!-- <h1>{{ video!.title }}</h1> -->
    <!-- <button @click="getSearchData">검색어 테스트</button> -->
    <!-- <p>{{ videoSrc()  }}</p> -->

    <div v-if="true" class="ratio ratio-16x9">
      <iframe 
      :src="videoSrc" 
      title="YouTube video player"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;"
      allowfullscreen
      ></iframe>
    </div>
  </div>
</template>

<script>
export default {
  name: "TestView",
  data() {
    return {
    }
  },
  props: {
    videoSrc: String
  },
  computed: {
    TF() {
      if (this.videoSrc) {
        return true
      }
      else {
        return false
      }
    }
  },
}
</script>

<style>
</style>