<template>
  <div class="bg-dark text-white" id="app">
    <TheNavbar/>
    
    <main>
      <content>
        <router-view/>
      </content>
    </main>

    <footer>
      <TheFooter/>
    </footer>
  </div>

</template>
<script>
import TheFooter from '@/components/layout/TheFooter.vue'
import TheNavbar from '@/components/layout/TheNavbar.vue'
import { mapActions } from 'vuex'

export default {
  name: 'app',
  components: {
    TheFooter,
    TheNavbar
  },
  methods: {
    ...mapActions(['getMovies'])
  },
  created() {
    this.getMovies()
  }
}
</script>

<style>
/* #app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  border: solid black 1px;
} */

#app {
  display: flex;
  flex-direction: column;
  height: 100vh;
}

main {
  overflow-y: auto;
  flex-grow: 1;
  /* padding-top: 56px; */
}

/* nav {
  padding: 30px;
} */

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}

/* * {
  border: solid black 1px;
} */

</style>
