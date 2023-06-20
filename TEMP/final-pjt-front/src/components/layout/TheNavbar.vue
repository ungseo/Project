<template>
<nav class="navbar navbar-dark bg-dark">
    <div class="collapse navbar-collapse container-fluid justify-content-end">
    <a class="navbar-brand" href="#"><img src="#" alt=""></a>
    <router-link class="navbar-brand" :to="{ name: 'home' }">Home</router-link>
    <router-link class="navbar-brand" :to="{ name: 'movies' }">Movies</router-link>
    <router-link class="navbar-brand" :to="{ name: 'login' }" v-if="isLogin">Login</router-link>
    <a class="navbar-brand" v-else @click.prevent="logout">Logout</a>
    <!-- <router-link class="navbar-brand" :to="{ name: 'test' }">TEST</router-link> -->
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Dark offcanvas</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-center flex-grow-1">
          <li class="nav-item">
            <UserMiniProfile class="overlay mx-auto" v-if="!isLogin" />
          </li>
        </ul>

      </div>
    </div>
  </div>
</nav>
</template>

<script>
import { mapState, mapActions } from 'vuex'
// 수정
import UserMiniProfile from '@/components/UserMiniProfile.vue'
// 잘보고
export default {
  name: 'TheNavbar',
  //여기 수정함 
  data() {
    return {
      isModal: false,
    }
  },
  // 
  computed: {
    ...mapState(['key']),
    isLogin() {
      if (this.key) {
        return false
      }
      return true
    }
  },
  components: {
    UserMiniProfile,
  },
  methods: {
  ...mapActions({
    ActionLogout: 'logout'
  }),
  logout() {
    const flag = this.ActionLogout()
    if (flag) {
      if (this.$route.name != 'home') {
        this.$router.push({ name: 'home' })
      }
    }
  },
  popupProfile() {
    this.isModal = !this.isModal
  }
}
}
</script>

<style>
.overlay {
  position: fixed;
  top: 56px;
  right: 0;
  width: 100%;
  height: 100%;
  z-index: 999;
}
</style>