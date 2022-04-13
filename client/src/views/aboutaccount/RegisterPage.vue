<template>
    <div>
        <section id="app">
      <!--Start nav-->
      <div class="nav-bg">
        <nav class="navSize">
          <div class="itemLeft">
            <a>
              <img class="image-nav" style="border-radius:10%" src="https://cdn.discordapp.com/attachments/877785654329753660/963700674762260540/logo-proj.png" onClick="window.location.href = '/'">
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
              <router-link to="/shop" class="navbar-item itemSpacing font-in-nav">
                Shop
              </router-link>
            </div>
            <router-link to="/redeem" class="navbar-item itemSpacing font-in-nav" >
              Redeem
            </router-link>
            <router-link to="/cart" class="navbar-item itemSpacing font-in-nav">
              myCart
            </router-link>
            <router-link to="/feedback" class="navbar-item font-in-nav" >
              Feedback
            </router-link>
          </div>
          <div class="itemRight">
            <router-link to="/login" class="navbar-item font-in-nav" >
              Login
            </router-link>
            <router-link to="/register" class="navbar-item font-in-nav">
              Sign Up
            </router-link>
          </div>
        </nav>
        <div id="showmenu">
          <div class="cilckHamburger">
            <!-- <div style="background-color:red; width:100%; height:200px;"></div> -->
            <router-link to="/shop" class="navbar-item borderItem font-in-ham">
              Shop
            </router-link>
            <router-link to="/redeem" class="navbar-item borderItem font-in-ham">
              Redeem
            </router-link>
            <router-link to="/cart" class="navbar-item borderItem font-in-ham">
              MyCart
            </router-link>
            <router-link to="/feedback" class="navbar-item borderItem font-in-ham">
              Feedback
            </router-link>
            <div style="display: flex; margin-left: 1em; height: 65px;">
              <button class="button is-light heightCenter font-in-ham" >
              <router-link to="/login">
                Login
              </router-link>
              </button>
              <p class="font-in-ham" style="margin-left: 1em; margin-right: 1em; margin-top: auto; margin-bottom: auto;">Or</p>
              <button class="button is-light heightCenter font-in-ham">
              <router-link to="/register">
                Sign Up
              </router-link>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div id="showsubnav"></div>
      <!--end nav-->
            <div class="absolute-center">
                    <div class="formBox">
                        <div class="formInfo">
                            <p class="textform-left mb-5" style="font-size:24px;"> Sign up </p>
                            <form action="/login/" enctype="multipart/form-data" method="POST">

                            <div class="field">
                                <label class="label textform-left">Email</label>
                                <div class="control">
                                    <input class="input is-small" type="email" placeholder="hello@example.com"
                                            autocomplete="username" required />
                                </div>
                            </div>
                            
                            <div class="field">
                                <label class="label textform-left">Password</label>
                                <div class="control">
                                    <input class="input is-small" type="password" placeholder="**********"
                                    autocomplete="current-password" required />
                                </div>
                            </div>
                            <div class="field">
                                <label class="label textform-left">Confirm Password</label>
                                <div class="control">
                                    <input class="input is-small" type="password" placeholder="**********"
                                    autocomplete="current-password" required />
                                </div>
                            </div>
                
                            <div class="field is-grouped mt-4">
                                <div class="control">
                                    <button class="button is-block is-fullwidth is-primary is-small" type="submit">
                                        Register
                                    </button>
                                </div>
                                <div class="control">
                                    <router-link to="/" class="button is-block is-fullwidth is-primary is-small is-link is-light">Cancel</router-link>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
            </div>
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
        let y = document.getElementById("showsubnav")
        if(x.style.display === 'none'){
          x.style.display = 'block'
          y.style.display = 'block'
          console.log('block')
        }
        else if(x.style.display === 'block'){
          console.log('none')
          x.style.display = 'none'
          y.style.display = 'none'
        }
        else{
          console.log('else')
          x.style.display = 'block'
          y.style.display = 'block'
        }
      }
    }
  }
</script>

<style scoped>
</style>