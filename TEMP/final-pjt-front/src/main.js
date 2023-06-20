import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// npm install --save @fortawesome/fontawesome-svg-core 
// npm install --save @fortawesome/free-solid-svg-icons
// npm i --save @fortawesome/free-regular-svg-icons 
// npm i --save @fortawesome/vue-fontawesome@latest-2
// import { library } from '@fortawesome/fontawesome-svg-core'
// import { 
//   faStar as fasStar 
// } from '@fortawesome/free-solid-svg-icons'
// import { 
//   faStar as farStar
// } from '@fortawesome/free-regular-svg-icons'
// import {
//   faCircleCheck as farCircleCheck
// } from '@fortawesome/free-regular-'
// import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// library.add(
//   farCircleCheck,
//   farCircle,
//   farStar,
//   fasStar
//   )
// Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.config.productionTip = false
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
