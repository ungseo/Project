import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import router from '../router'

Vue.use(Vuex)

const API_URL = 'http://127.0.0.1:8000'

export default new Vuex.Store({
  state: {
    isListLoaded: false,
    movieList: [],
    username: "",
    key: "",
    pages: 1,
    POSTER_URL: 'https://image.tmdb.org/t/p/original'
  },
  getters: {
    GettersMovieList(state) {
      return state.movieList
    }
  },
  mutations: {
    IS_LIST_LOADED(state) {
      state.isListLoaded = true
    },
    GET_MOVIES(state, movies) {
      let num = 0

      movies.map((movie) => {
        num++

        if (num === 21) {
          num = 1
          state.pages++
        }
        movie["page"] = state.pages

        return movie
      })

      state.movieList = movies
    },
    CHANGE_KEY(state, newKey) {
      state.key = newKey
    },
    CHANGE_USERNAME(state, newUsername) {
      state.username = newUsername
    }

  },
  actions: {
    getMovies(context) {
      
      if (context.state.isListLoaded) {
        return
      }

      context.commit("IS_LIST_LOADED")
      
      axios({
        method: 'get',
        url: `${API_URL}/api/v1/movies/`,
      })
      .then((response) => {
        if (response.status == 200) {
          context.commit('GET_MOVIES', response.data)
        }
      })
      .catch((error) => {
        if (error.response.status === 404) {
          return
        }

        console.error(error)
      })
    },
    signup(context, payload) {
      if (!payload.username.trim()) {
        alert("유효하지 않는 ID입니다.")
        return
      }

      if (!payload.password1.length) {
        alert("비밀번호를 입력해주세요.")
        return 
      }

      if (!payload.password2.length) {
        alert("비밀번호를 입력해주세요.")
        return
      }

      axios({
        method: "POST",
        url: `${API_URL}/accounts/signup/`,
        data: {
          username: payload.username,
          password1: payload.password1,
          password2: payload.password2
        }
      })
      .then((response) => {
        if (response.status === 201) {  
          alert("회원가입 성공")
          router.push({ name: 'home' })
        }
      })
      .catch((error) => {
        console.error(error)
        alert("회원가입 실패, 정보를 확인해주세요.")
      })
    },
    login(context, payload) {
      if (!payload.username.trim()) {
        alert("유효하지 않는 ID입니다.")
        return
      }

      if (!payload.password.length) {
        alert("비밀번호를 입력해주세요.")
        return 
      }

      return axios({
        method: "POST",
        url: `${API_URL}/accounts/login/`,
        data: payload
      })
      .then((response) => {
        if (response.status === 200) {
          context.commit("CHANGE_KEY", response.data.key)
          context.commit("CHANGE_USERNAME", payload.username)
          return true
        }
      })
      .catch((error) => {
        console.error(error)
        return false
      })
    },
    logout(context) {
      return axios({
        method: "POST",
        url: `${API_URL}/accounts/logout/`,
        headers: {
          Authorization: `Token ${context.state.key}`
        }
      })
      .then((response) => {
        if (response.status === 200) {
          context.commit("CHANGE_KEY", "")
          context.commit("CHANGE_USERNAME", "")
          return true
        }
      })
      .catch((error) => {
        console.error(error)
        return false
      })
    }
  },
  modules: {
  }
})
