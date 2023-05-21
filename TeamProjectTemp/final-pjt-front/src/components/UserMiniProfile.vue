<template>
  <div class="miniprofile container text-dark align-items-center px-auto">
    <div class="row">
      <div class="col text-center fs-3">
        <p class="my-auto">{{username}}님의 프로필</p>
      </div>
    </div>

      <hr>
    <div class="row">
      <div class="col justify-content-center text-center">
        <img class="profileIMG" @mouseover="mouseOver" @mouseleave="mouseLeave" src="@/assets/logo.png" alt="프로필ㅋ">
        <div class="uploadIMG" v-show="isHover" @mouseover="mouseOver" @mouseleave="mouseLeave">
          <form >
          <label for="file">
            <div class="btn-upload">+</div>
          </label>
          <input @change="onFileChange($event)" type="file" name="file" id="file" ref="updatedImg">
        </form>
        </div>
      </div>
    </div>
    <hr>

    <div class="row">
      <div class="col justify-content-center text-center">
      <p>내용 1</p>
      </div>
    </div>
    <hr>

    <div class="row">
      <div class="col justify-content-center text-center">
        <p>내용 2</p>
      </div>
    </div>
    <hr>

    <div class="row">
      <div class="col d-flex offset-3">

      </div>
      <div class="col-3 d-flex justify-content-end">
        <button class="btn btn-danger" data-bs-dismiss="offcanvas" aria-label="Close" type="submit">CLOSE</button>
      </div>
      <div class="col-3 d-flex  justify-content-end">
        <button class="btn btn-primary" type="submit" @click="submitIMG">SAVE</button>
      </div>
    </div>
  </div>

</template>

<script>
import axios from 'axios'

export default {
    name: 'UserMiniProfile',
    data() {
      return {
        isHover: false,
        API_URL: 'http://127.0.0.1:8000/',
        username: this.$store.state.username,
        img: '',
      }
    },
    methods: {
      mouseOver() {
        this.isHover = true
      },
      mouseLeave() {
        this.isHover = false
      },
      submitIMG() {
        axios({
          method: 'post',
          url: `${this.API_URL}accounts/userinfo/`,
          data: { formData: this.formData, username: this.username },
          headers: {
            Authorization: `Token ${this.$store.state.key}`,
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((res) => {
          console.log('hi')
          console.log(res)
        })
        .catch((err) => {
          console.error(err)
        })
      },
      onFileChange(event) {
      this.img = event.target.files[0];
      this.updateFormData();
      },
      updateFormData() {
        const formData = new FormData();
        formData.append("file", this.img);
        this.formData = formData;
      },

    },
}
</script>

<style scoped>
.miniprofile {
    border: solid 1px black;
    width: 300px;
    height: 500px;
    background-color: aliceblue;
    border-radius: 15px;
}
.profileIMG {
  border-radius:70%;
  border: solid 1px black;
  width: 200px;
  height: 200px;

}
.uploadIMG {
  border-radius:70%;
  position: absolute;
  background-color: #169bfa5e;
  width: 200px;
  height: 200px;
  top: 71px;
  /* left: ; */
  right: 50px;
}

#file {
  display: none;
}
.btn-upload {
  position: absolute;
  top: 20px;
  left: 66px;
  font-size: 100px;
  color: white;
}
</style>