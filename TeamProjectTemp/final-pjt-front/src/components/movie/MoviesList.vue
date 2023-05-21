<template>
  <div>
    <div class="container">
      <div class="row">
        <MoviesListItem v-for="movie in movieList" :key="movie.id"
        :movie="movie"/>
      </div>
    </div>
  </div>
</template>

<script>
import MoviesListItem from '@/components/movie/MoviesListItem.vue'
import { mapGetters } from 'vuex'

export default {
  name: 'MoviesList',
  components: {
    MoviesListItem,
  },
  computed: {
  ...mapGetters({
    movieList: 'GettersMovieList'
  })
  }
}
</script>

<style>
</style>