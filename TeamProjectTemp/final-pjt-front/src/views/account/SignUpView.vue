<template>
  <div>
    <h1>Sign Up Page</h1>
    <form @submit.prevent="signup">
      <div class="form-floating mb-3 mx-auto">
        <input type="text" class="form-control bg-dark text-white" id="floatingInput" placeholder="ID" v-model="username">
        <label for="floatingInput">ID</label>
      </div>
      <br>

      <div class="form-floating mb-3 mx-auto">
        <input type="password" class="form-control bg-dark text-white" id="floatingInput" placeholder="Password1" v-model="password1">
        <label for="floatingInput">Password1</label>
      </div>
      <br>
      <div class="form-floating mb-3 mx-auto">
        <input type="password" class="form-control bg-dark text-white" id="floatingInput" placeholder="Password1" v-model="password2">
        <label for="floatingInput">Password2</label>
      </div>
      <br>
      <div class="justify-content-center d-flex">
      <button type="button" class="btn btn-success" @click="signup">회원가입</button>
      </div>
    </form>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: "SignUp",
  data() {
    return {

      username: "",

      password1: "",
      password2: "",
    }
  },
  methods: {
    ...mapActions({
      ActionSignup: 'signup',
    }),
    signup() {
      const payload = {
        username: this.username,
        password1: this.password1,
        password2: this.password2
      }
      this.ActionSignup(payload)
    }
  }
}
</script>

<style>
.signup {
  width: 500px;

}
</style>