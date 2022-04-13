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

      <!-- Start Div profile -->
      <div class="profile-main">
        <div class="profile-left-box">
          <p class="profile-title">Your Profile</p>
            <div>
                <img class="img-profile mt-3" src="https://cdn.discordapp.com/attachments/774659091745734659/963110934308593815/244753413_134410555607297_7985134242756502927_n.jpg">
            </div>
            <p class="profile-username">user001</p>
            <p style="font-size:10px">Your point : 131</p>
            <button v-show="changepwd_bt" class="button is-small is-light is-warning heightCenter mt-2" @click="changepwd = true, changepwd_bt = false">
                Change your password
            </button>
            <div v-show="changepwd">
              <div class="field">
                  <label class="label textform-left">Old Password</label>
                  <div class="control">
                      <input class="input is-small" type="password" placeholder="**********"
                      autocomplete="current-password" required />
                  </div>
              </div>
                  
              <div class="field">
                  <label class="label textform-left">New Password</label>
                  <div class="control">
                      <input class="input is-small" type="password" placeholder="**********"
                      autocomplete="new-password" required />
                  </div>
              </div>

              <div class="field">
                  <label class="label textform-left">Confirm New Password</label>
                  <div class="control">
                      <input class="input is-small" type="password" placeholder="**********"
                      autocomplete="confirm-password" required />
                  </div>
              </div>

              <div class="field is-grouped mt-4">
                  <div class="control">
                      <button class="button is-block is-fullwidth is-primary is-small" type="submit">
                          Confirm
                      </button>
                  </div>
                  <div class="control">
                      <button class="button is-block is-fullwidth is-primary is-small is-link is-light" @click="changepwd_bt = true, changepwd = false">Cancel</button>
                  </div>
              </div>
            </div>
        </div>
        <div class="profile-right-box">
          <div style="profile-header">
            <p class="profile-info">Your Information</p>
            <div class="profile-saveinfo">
              <button class="button is-light is-primary heightCenter is-small">
                  Save Info
              </button>
            </div>
          </div>
          <div class="profile-name">
              <div class="field profile-fname">
                  <label class="label textform-left">Firstname</label>
                  <div class="control">
                      <input class="input is-small" type="email" value=""
                              autocomplete="username" required />
                  </div>
              </div>
                  
              <div class="field profile-lname">
                  <label class="label textform-left">Lastname</label>
                  <div class="control">
                      <input class="input is-small" type="text" value=""
                      autocomplete="" required />
                  </div>
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Email</label>
              <div class="control">
                  <input class="input is-small" type="email" value="hello@example.com"
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Tel</label>
              <div class="control">
                  <input class="input is-small" type="text"
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Address</label>
              <div class="control">
                  <textarea class="textarea" placeholder="123/4 ซอยหอม ถนนห้ามหวง เขตหวงห้าม เมืองวากานดา 69696"></textarea>
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Current password (ถ้ามีการเปลี่ยนแปลงข้อมูล)</label>
              <div class="control">
                  <input class="input is-small" type="password" placeholder="**********"
                  autocomplete="current-password" required />
              </div>
          </div>
        </div>
      </div>
      <!--End proile div-->


        </section>
    </div>
</template>

<script>
export default {
    data() {
      return {
        changepwd : false,
        changepwd_bt : true
      }
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