<template>
  <div>
    <h1>영화 상세 페이지</h1>
    <div class="container">
      <div class="row">
        <div class="col-12 col-md-4">
          <div class="d-flex justify-content-center">
            <p class="VT">{{ movieTitle() }}</p>
            <img class="poster" :src="moviePosterPath()" alt="moviePoster">
          </div>
        </div>
        <div class="col-12 col-md-8">
          <TestView :videoSrc="RvideoSrc()"/>
          <p>{{ movieOverview() }}</p>  
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import dayjs from 'dayjs'
import TestView from '@/views/TestView.vue'

export default {
  name: "MovieDetailView",
  components: {
    TestView
  },
  data() {
    return {
      movie: {},
      video: {},
      URL: "https://www.googleapis.com/youtube/v3",
      KEY: "AIzaSyDbTlLB8pg3qRGo6UoVPZ0c6U4Q1W3sykA",
      videoSrc: ""
    }
  },
  computed: {
  },

  methods: {
    movieTitle() {
      return this.movie.title
    },
    movieOriginalTitle() {
      return this.movie.original_title
    },
    movieReleaseData() {
      return this.movie.release_date
    },
    moviePopularity() {
      return this.movie.popularity
    },
    movieVoteCount() {
      return this.movie.vote_count
    },
    movieVoteAverage() {
      return this.movie.vote_average
    },
    movieOverview() {
      return this.movie.overview
    },
    moviePosterPath() {
      return `${this.$store.state.POSTER_URL}${this.movie.poster_path}`
    },
    getVideo(word) {
      axios({
        method: "GET",
        url: `${this.URL}/search`,
        params: {
          key: this.KEY,
          part: "snippet",
          type: "video",
          q: word,
          maxResults: 1
        }
      })
      .then((response) => {
        const item = response.data.items[0]
        const parseVideo = {
          videoId: item.id.videoId,
          title: item.snippet.title,
          description: item.snippet.description,
          publishTime: dayjs(item.snippet.publishTime).format("YYYY-MM-DD"),
          thumbnails: item.snippet.thumbnails
        }
        this.video = parseVideo
      })
      .catch((error) => {
        console.error(error)
      })
    },
    RvideoSrc() {
      return `https://www.youtube.com/embed/${this.video.videoId}?autoplay=1`
    }
  },
  created() {
    const movie_id = this.$route.params.movie_id

    axios({
      method: "GET",
      url: `http://127.0.0.1:8000/api/v1/movies/${movie_id}/`
    })
    .then((response) => {
      if (response.status === 200) {
        this.movie = response.data
         this.getVideo(`${response.data.title} 트레일러`)
      }
    })
    .catch((error) => {
      console.error(error)
    })
  }
}
</script>

<style scoped>
.poster {
  height: 75vh;
}

.VT {
  font-size: 1.5vw;
}
</style>