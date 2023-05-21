<template>
  <div>
    <h1>영화 목록</h1>
    <MoviesList/>
  </div>
</template>

<script>
import MoviesList from '@/components/movie/MoviesList.vue'
export default {
    name: 'MoviesView',
    components: {
      MoviesList,  
    },
    data() {
        return {
            movies: this.$store.state.movieList
        }
    },

}
</script>

<style>
</style>