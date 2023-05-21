import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import MoviesView from '../views/MoviesView.vue'
import MovieDetailView from '../views/MovieDetailView.vue'
import SignUpView from '../views/account/SignUpView.vue'
import LoginView from '../views/account/LoginView.vue'
// import StoreView from '../views/StoreView.vue'
// import ProfileView from '../views/ProfileView.vue'
import  TestView from '../views/TestView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/movies',
    name: 'movies',
    component: MoviesView
  },
  {
    path: '/movie/:movie_id',
    name: 'movieDetail',
    component: MovieDetailView
  },
  {
    path: '/signup',
    name: 'signup',
    component: SignUpView
  },
  {
    path: '/login',
    name: 'login',
    component: LoginView
  },
  // {
  //   path: '/',
  //   name: 'movies',
  //   component: MoviesView
  // },
  // {
  //   path: '/movies',
  //   name: 'movies',
  //   component: MoviesView
  // },
  {
    path: '/test',
    name: 'test',
    component: TestView
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
