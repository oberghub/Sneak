<template>
  <div>
    <section id="app">
      <nav class="navSize">
          <div class="itemLeft">
            <a>
              <img src="https://bulma.io/images/bulma-logo.png" style="width: 120px;" onClick="window.location.href = '/'">
            </a>
            <!-- Md - Sm = ShowHamburger -->
            <div class="hamburgerNav" @click="showNavSm()">
                <div class="hamburger"></div>
                <div class="hamburger"></div>
                <div class="hamburger"></div>
            </div>
          </div>
          <div class="itemCenter">
            <div class="nav-links">
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
          <div id="showmenu">
            <div class="cilckHamburger">
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
          </div>
      <div class="boxs"></div>
      <div class="boxs"></div>
      <div class="boxs"></div>
  </section>
  </div>
</template>

<script>
export default {
    data() {
      return {}
    },
    methods : {
      showNavSm(){
        let x = document.getElementById("showmenu")
        if(x.style.display === 'none'){
          x.style.display = 'block'
          console.log('block')
        }
        else if(x.style.display === 'block'){
          console.log('none')
          x.style.display = 'none'
        }
        else{
          console.log('else')
          x.style.display = 'block'
        }
      }
    }
  }
</script>

<style scoped>
</style>