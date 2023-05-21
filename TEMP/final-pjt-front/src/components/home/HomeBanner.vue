<template>
  <div class="jb-box center">
    <video muted autoplay loop>
      <source src="@/assets/banner.mp4" type="video/mp4">
      <strong>Your browser does not support the viedo tag.</strong>
    </video>
    <div class="jb-text">
      <p>배경입니다.</p>
    </div>
    <UserMiniProfile/>

  </div>
</template>

<script>
import UserMiniProfile from '@/components/UserMiniProfile.vue'

export default {
  components: {
    UserMiniProfile,
  }
}
</script>

<style >
.jb-box {
  width: auto;
  height: 50%;
  overflow: hidden;
  margin: 0px auto;
  position: relative;
}

.center {
  display: flex;
  justify-content: center;
}

/* video {
  width: 100%;
} */
.jb-text {
  position: absolute;
  top: 50%;
  width: 100%;

}
.jb-text p {
  margin-top: -24;
  text-align: center;
  font-size: 48px;
  color: #ffffff;
}
</style>