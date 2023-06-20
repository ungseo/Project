<template>
  <div class="col-3">
    <div class="card" @mouseover="mouseover" @mouseleave="mouseleave" @click="movieDetail">
      <img :src="moviePostUrl()" alt="cardImg" class='card-img'>
      <div class="card-img-overlay BGC" v-show="isHover">

        <div class="container">
          <div class="row">
            <p class="card-title vw2">{{ movieTitle()[0] }}</p>
            <p class="card-title vw1-5" v-if="movieTitle()[1]">{{ movieTitle()[1] }}</p>
          </div>

          <div class="row">
            <p class="card-title vw1-5">{{ movieVoteAverage() }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: "MovieListItem",
  props: {
    movie: Object
  },
  data(){
    return {
      isHover: false
    }
  },
  methods: {
    moviePostUrl() {
      return `${this.$store.state.POSTER_URL}${this.movie.poster_path}`
    },
    movieTitle() {
      return this.movie.title.split(':')
    },
    movieVoteAverage() {
      return this.movie.vote_average
    },
    mouseover() {
      this.isHover = true
    },
    mouseleave() {
      this.isHover = false
    },
    movieDetail(){
      this.$router.push({ name: 'movieDetail', params: { movie_id: this.movie.id } })
    }
  }
}
</script>

<style scoped>
.card {
  cursor: pointer;
}

.vw1-5 {
  font-size: 1.5vw;
}

.vw2 {
  font-size: 2vw;
}

.BGC {
  background-color: rgba(111, 230, 96, 0.8);
}
</style>