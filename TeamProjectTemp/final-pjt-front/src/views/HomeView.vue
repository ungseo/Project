<template>
  <div class="home">
    <HomeBanner />
  </div>
</template>

<script>
import HomeBanner from '@/components/home/HomeBanner.vue'
import { mapGetters } from 'vuex'


export default {
  name: 'HomeView',
  components: {
    HomeBanner,
  },
  computed: {
    ...mapGetters({
      movieList: 'GettersMovieList'
    })
  },
  methods: {
  },
}
</script>
