<template>
<div id="login" class="justify-content-center">
    <h1 class='text-center mt-3'>Sign In</h1>
    <hr><br>

    <form class="text-center text-secondary" @submit.prevent="login">
      <div class="form-floating mb-3 mx-auto">
        <input type="text" class="form-control bg-dark text-white" id="floatingInput" placeholder="ID" v-model="username">
        <label for="floatingInput">ID</label>
      </div>
      <div class="form-floating mx-auto">
        <input type="password" class="form-control bg-dark text-white" id="floatingPassword" placeholder="Password" v-model="password">
        <label for="floatingPassword">Password</label>
      </div>
      <br>
      <br>
    </form>
    <div class="justify-content-center d-flex">
    <button type="button" class="btn btn-success mx-auto" @click="login">login</button>
    </div>
    <br>
    <p class="text-center">가입하려면 <router-link class="text-center" :to="{ name: 'signup' }">여기</router-link>를 누르세요</p>
</div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'LoginView',
  data() {
    return {
      username: "",
      password: "",
    }
  },
  methods: {
    ...mapActions({
      ActionLogin: 'login'
    }),
    login() {
      this.ActionLogin({
        username: this.username,
        password: this.password,
      })
      .then((flag) => {
        if (flag) {
          alert("로그인 성공")
          this.$router.push({ name: 'home' })
        }
        else {
          alert("로그인 실패")
        }
      })
      .catch((error) => {
        console.error(error)
      })
    }
  }
}
</script>

<style scoped>
#login {
  border: solid 1px white;
  width: 300px;
  margin:auto;
}
p {
  font-size: 10px;
}

.form-floating {
  width: 250px;
  
}

</style>