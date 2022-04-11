<template>
  <div>
    <section id="app">
      <nav class="navSize">
        <div class="itemLeft">
          <a>
            <img src="https://bulma.io/images/bulma-logo.png" style="width: 120px;" onClick="window.location.href = '/'">
          </a>
          <!-- Md - Sm = ShowHamburger -->
          <div class="hamburgerNav" style="cursor: pointer;" @click="navburger = !navburger">
            <div class="hamburger"></div>
            <div class="hamburger"></div>
            <div class="hamburger"></div>
          </div>
        </div>
        <div class="itemCenter">
          <div>
            <router-link to="/shop" class="navbar-item itemSpacing">
              Shop
            </router-link>
          </div>
          <router-link to="/redeem" class="navbar-item itemSpacing" >
            Redeem
          </router-link>
          <router-link to="/cart" class="navbar-item itemSpacing">
            myCart
          </router-link>
          <router-link to="/feedback" class="navbar-item" >
            Feedback
          </router-link>
        </div>
        <div class="itemRight">
          <router-link to="/login" class="navbar-item" >
            Login
          </router-link>
          <router-link to="/register" class="navbar-item">
            Sign Up
          </router-link>
        </div>
      </nav>
      <div v-show="navburger" class="clickHamburger">
        <router-link to="/shop" class="navbar-item borderItem">
          Shop
        </router-link>
        <router-link to="/redeem" class="navbar-item borderItem">
          Redeem
        </router-link>
        <router-link to="/cart" class="navbar-item borderItem">
          MyCart
        </router-link>
        <router-link to="/feedback" class="navbar-item borderItem">
          Feedback
        </router-link>
        <div style="display: flex; margin-left: 1em; height: 65px;">
          <button class="button is-light heightCenter" >
          <router-link to="/login">
            Login
          </router-link>
          </button>
          <p style="margin-left: 3em; margin-right: 3em; margin-top: auto; margin-bottom: auto;">Or</p>
          <button class="button is-light heightCenter">
          <router-link to="/register">
            Sign Up
          </router-link>
          </button>
        </div>
      </div>
      <!-- Register Modal -->
      <div id="register-modal" class="modal">
        <div class="modal-background">
          <button class="modal-close is-large" aria-label="close"></button>
        </div>
      </div>
      <div class="boxs" ></div>
  </section>
  <div><h1 style="font-size:48px;">Shop</h1></div>
    <h1>Home</h1>
  </div>
</template>

<script>
export default {
    data() {
      return {}
    }
  }
</script>

<style scoped>
</style>