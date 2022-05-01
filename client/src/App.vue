<template>
  <div id="app">
      <!--Start nav-->
      <div class="nav-bg">
        <nav class="navSize">
          <div class="itemLeft">
            <a>
              <img class="image-nav" style="border-radius:10%" src="https://cdn.discordapp.com/attachments/877785654329753660/963700674762260540/logo-proj.png" onClick="window.location.href = '/'">
            </a>
            <div class="hamburgerNav" @click="showNavSm()">
              <div class="bigburger itemSpacing">
                <div class="hamburger"></div>
                <div class="hamburger"></div>
                <div class="hamburger"></div>
              </div>
            </div>
            <div @click="getCartItem" class="nav-cart-icon"> <!--Cart-->
              <svg v-show="checkRoute($route.fullPath)" @click="showEditItem = true" style="width:2em; height:2em;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path d="M96 0C107.5 0 117.4 8.19 119.6 19.51L121.1 32H541.8C562.1 32 578.3 52.25 572.6 72.66L518.6 264.7C514.7 278.5 502.1 288 487.8 288H170.7L179.9 336H488C501.3 336 512 346.7 512 360C512 373.3 501.3 384 488 384H159.1C148.5 384 138.6 375.8 136.4 364.5L76.14 48H24C10.75 48 0 37.25 0 24C0 10.75 10.75 0 24 0H96zM128 464C128 437.5 149.5 416 176 416C202.5 416 224 437.5 224 464C224 490.5 202.5 512 176 512C149.5 512 128 490.5 128 464zM512 464C512 490.5 490.5 512 464 512C437.5 512 416 490.5 416 464C416 437.5 437.5 416 464 416C490.5 416 512 437.5 512 464z"/>
              </svg>
              <svg xmlns="http://www.w3.org/2000/svg" class="noti-icon" viewBox="0 0 512 512">
                <path d="M256 0C114.6 0 0 114.6 0 256s114.6 256 256 256s256-114.6 256-256S397.4 0 256 0zM232 152C232 138.8 242.8 128 256 128s24 10.75 24 24v128c0 13.25-10.75 24-24 24S232 293.3 232 280V152zM256 400c-17.36 0-31.44-14.08-31.44-31.44c0-17.36 14.07-31.44 31.44-31.44s31.44 14.08 31.44 31.44C287.4 385.9 273.4 400 256 400z"/>
              </svg>
            </div>
          </div>
          <div class="itemCenter">
            <div v-show="!checkRoute($route.fullPath)" style="margin-left:3em;"></div>
            <!--For Guest-->
            <div style="display:flex;">
                <router-link to="/shop" class="navbar-item itemSpacing font-in-nav">
                  Shop
                </router-link>
                <router-link to="/redeem" class="navbar-item itemSpacing font-in-nav">
                  Redeem
                </router-link>
                <router-link to="/feedback" class="navbar-item itemSpacing font-in-nav" v-if="!user || (user && user.user_role == 'normal')">
                  Feedback 
                </router-link>
                <router-link to="/manage" class="navbar-item itemSpacing font-in-nav" style="color:blue;" v-if="user && user.user_role == 'admin' ">
                  Manage
                </router-link>
                <!--Cart-->
                <div @click="getCartItem" v-show="checkRoute($route.fullPath)"> 
                  <svg @click="showEditItem = true, getCartItem" class="nav-cart-icon-d" style="width:2em; height:2em;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 0C107.5 0 117.4 8.19 119.6 19.51L121.1 32H541.8C562.1 32 578.3 52.25 572.6 72.66L518.6 264.7C514.7 278.5 502.1 288 487.8 288H170.7L179.9 336H488C501.3 336 512 346.7 512 360C512 373.3 501.3 384 488 384H159.1C148.5 384 138.6 375.8 136.4 364.5L76.14 48H24C10.75 48 0 37.25 0 24C0 10.75 10.75 0 24 0H96zM128 464C128 437.5 149.5 416 176 416C202.5 416 224 437.5 224 464C224 490.5 202.5 512 176 512C149.5 512 128 490.5 128 464zM512 464C512 490.5 490.5 512 464 512C437.5 512 416 490.5 416 464C416 437.5 437.5 416 464 416C490.5 416 512 437.5 512 464z"/>
                  </svg>
                  <svg v-show="obj.length > 0" xmlns="http://www.w3.org/2000/svg" class="nav-cart-icon-d" style="position:absolute; top:12; width:17px; fill:red;" viewBox="0 0 512 512">
                    <path d="M256 0C114.6 0 0 114.6 0 256s114.6 256 256 256s256-114.6 256-256S397.4 0 256 0zM232 152C232 138.8 242.8 128 256 128s24 10.75 24 24v128c0 13.25-10.75 24-24 24S232 293.3 232 280V152zM256 400c-17.36 0-31.44-14.08-31.44-31.44c0-17.36 14.07-31.44 31.44-31.44s31.44 14.08 31.44 31.44C287.4 385.9 273.4 400 256 400z"/>
                  </svg>
                </div>
            </div>

          </div>
          <div class="itemRight">
            <router-link to="/login" class="navbar-item font-in-nav" v-if="!user">
              Login
            </router-link>
            <router-link to="/register" class="navbar-item font-in-nav" v-if="!user">
              Sign Up
            </router-link>
            <div style="display:flex;" v-if="user">
              <svg @click="showRedeemItem = true" xmlns="http://www.w3.org/2000/svg" style="cursor:pointer; width:2em; height:2em; margin:auto;" class="itemSpacing" viewBox="0 0 512 512">
                <path d="M152 0H154.2C186.1 0 215.7 16.91 231.9 44.45L256 85.46L280.1 44.45C296.3 16.91 325.9 0 357.8 0H360C408.6 0 448 39.4 448 88C448 102.4 444.5 115.1 438.4 128H480C497.7 128 512 142.3 512 160V224C512 241.7 497.7 256 480 256H32C14.33 256 0 241.7 0 224V160C0 142.3 14.33 128 32 128H73.6C67.46 115.1 64 102.4 64 88C64 39.4 103.4 0 152 0zM190.5 68.78C182.9 55.91 169.1 48 154.2 48H152C129.9 48 112 65.91 112 88C112 110.1 129.9 128 152 128H225.3L190.5 68.78zM360 48H357.8C342.9 48 329.1 55.91 321.5 68.78L286.7 128H360C382.1 128 400 110.1 400 88C400 65.91 382.1 48 360 48V48zM32 288H224V512H80C53.49 512 32 490.5 32 464V288zM288 512V288H480V464C480 490.5 458.5 512 432 512H288z"/>
              </svg>
              <router-link to="/profile" class="navbar-item font-in-nav">
                <p>Hi! {{user.user_username}}</p>
              </router-link>
              <p class="button is-danger is-light" @click="logout()">Log out</p>
            </div>
          </div>
        </nav>
        <div id="showmenu">
          <div class="cilckHamburger">
            <router-link to="/shop" class="navbar-item borderItem font-in-ham">
              Shop
            </router-link>
            <router-link to="/redeem" class="navbar-item borderItem font-in-ham">
              Redeem
            </router-link>
            <router-link to="/feedback" class="navbar-item borderItem font-in-ham" v-if="!user || (user && user.user_role == 'normal')">
              Feedback
            </router-link>
            <router-link to="/manage" class="navbar-item borderItem font-in-nav" style="color:blue;" v-if="user && user.user_role == 'admin' ">
              Manage
            </router-link>

            <div style="display: flex; margin-left: 1em; height: 65px;" v-if="user">
              <router-link to="/profile" class="navbar-item font-in-nav heightCenter">
                <p>Hi! {{user.user_username}}</p>
              </router-link>
              <p class="button is-danger is-light heightCenter ml-3" @click="logout()">Log out</p>
              <svg @click="showRedeemItem = true" xmlns="http://www.w3.org/2000/svg" style="width:2em; height:2em; margin-top:auto; margin-bottom:auto; margin-left:1em;" viewBox="0 0 512 512">
                <path d="M152 0H154.2C186.1 0 215.7 16.91 231.9 44.45L256 85.46L280.1 44.45C296.3 16.91 325.9 0 357.8 0H360C408.6 0 448 39.4 448 88C448 102.4 444.5 115.1 438.4 128H480C497.7 128 512 142.3 512 160V224C512 241.7 497.7 256 480 256H32C14.33 256 0 241.7 0 224V160C0 142.3 14.33 128 32 128H73.6C67.46 115.1 64 102.4 64 88C64 39.4 103.4 0 152 0zM190.5 68.78C182.9 55.91 169.1 48 154.2 48H152C129.9 48 112 65.91 112 88C112 110.1 129.9 128 152 128H225.3L190.5 68.78zM360 48H357.8C342.9 48 329.1 55.91 321.5 68.78L286.7 128H360C382.1 128 400 110.1 400 88C400 65.91 382.1 48 360 48V48zM32 288H224V512H80C53.49 512 32 490.5 32 464V288zM288 512V288H480V464C480 490.5 458.5 512 432 512H288z"/>
              </svg>
            </div>

            <div v-else style="display: flex; margin-left: 1em; height: 65px;">
              <button class="button is-light heightCenter font-in-ham"  >
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
      <!--end nav-->

      <!-- Edit Item in cart -->
      <div class="modal" :class="{ 'is-active' : showEditItem }">
        <div class="modal-background"></div>
          <div class="modal-content">
            <div class="modal-bg-custom">
                <!-- Content ... -->
              <div style="font-size:32px; font-weight:500;" class="mb-4" v-show="obj.length == 0">There are no item in cart.</div>
              <div class="modal-cart-item" v-for="obj,index in obj" :key="obj.id">
                <div class="modal-cart-item-image">
                  <img class="modal-cart-image" :src="obj.img">
                </div>
                  <div class="modal-cart-item-info">
                    <p class="modal-cart-item-title-c">{{obj.name}}</p>
                    <p class="modal-cart-item-price-c">฿{{formatCurrency(obj.price * obj.quantity)}}</p>
                    <p style="font-size:12px; color:gray;" class="mt-1">{{obj.size}} US {{obj.type}}</p>
                    <div style="display:flex;">
                      <p style="font-size:12px; text-align:left; color:black; margin-top:auto; margin-bottom:auto;">จำนวน {{obj.quantity}} ชิ้น</p>
                        <button class="button is-warning is-light is-small ml-3" @click="deleteSomeItem(index)">Delete</button>
                    </div>
                  </div>
              </div>
              <div class="modal-bottom">
                <div class="modal-bottom-l" v-show="obj.length !== 0">
                  <button class="button is-success is-light" @click="showEditItem = false, $router.push('/cart')">
                    Go to cart
                  </button>
                  <button class="button is-danger is-light ml-5" @click="clearCart()">
                    Clear
                  </button>
                </div>
                <div class="modal-bottom-r">
                  <p style="font-weight:bold;">Total ฿{{formatCurrency(sumAllPrice)}}</p>  
                </div>
              </div>
            </div>
          </div>
        <button class="modal-close is-large" aria-label="close" @click="showEditItem = false"></button>
      </div>
      <!-- Edit item in cart -->

      <!-- Redeem item history -->
      <div class="modal" :class="{ 'is-active' : showRedeemItem }">
        <div class="modal-background"></div>
          <div class="modal-content">
            <div class="modal-bg-custom">
                <!-- Content ... -->
              <p style="font-size:24px; font-weight:bold; text-align:center; margin-bottom:1.5em;">Redeem History</p>
              <div style="font-size:32px; font-weight:500;" class="mb-4" v-show="red_his.length == 0">There are no redeem item.</div>
              <div class="modal-cart-item" v-for="obj in red_his" :key="obj.red_id">
                <div class="modal-cart-item-image">
                  <img class="modal-cart-image" :src="obj.red_img">
                </div>
                  <div class="modal-cart-item-info">
                    <p class="modal-cart-item-title-c">{{obj.red_name}}</p>
                    <p style="font-size:12px; color:gray;">{{obj.red_point}} แต้ม</p>
                    <div style="display:flex;">
                      <p style="font-size:12px; text-align:left; color:black; margin-top:auto; margin-bottom:auto;">จำนวน 1 ชิ้น</p>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        <button class="modal-close is-large" aria-label="close" @click="showRedeemItem = false"></button>
      </div>
      <!-- Redeem item history -->


      
    <router-view :key="$route.fullPath" @auth-change="onAuthChange" :user="user" />
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  name: 'App',
  components: {
    
  },
  data () {
    return {
      user : null,
      showEditItem : false,
      showRedeemItem : false,
      counter : 0,
      obj : [],
      red_his : []
    }
  },
  mounted () {
    this.onAuthChange()
    this.getRedeem()
  },
  methods : {
    onAuthChange () {
      const token = localStorage.getItem('token')
      if (token) {
        this.getUser()
      }
    },
    getUser () {
        axios.get('/user/me').then(res => {
        this.user = res.data
      })
    },
    getRedeem(){
      axios.get('http://localhost:3000/user/redeem/')
      .then((response) => {
        this.red_his = response.data
        console.log(response.data)
      })
      .catch(err => {console.log(err)})
    },
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
    },
    checkRoute(pt){
      if(pt == '/cart'){
        return false
      }
      return true
    },
    checkZero(index){
        if(this.obj[index].quantity <= 1){
            this.obj[index].quantity = 1
        }
        else{
            this.obj[index].quantity--
        }
    },
    clearCart(){
      let item = JSON.parse(localStorage.getItem('cart'))
      this.obj.splice(0, this.obj.length)
      item.splice(0, item.length)
      localStorage.setItem("cart", JSON.stringify(item))
    },
    deleteSomeItem(index){
      let item = JSON.parse(localStorage.getItem('cart'))
      this.obj.splice(index, 1)
      item.splice(index, 1)
      localStorage.setItem("cart", JSON.stringify(item))
    },
    formatCurrency(currency){ //format เงินให้มีลูกน้ำ
      return ((currency).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))
    },
    logout(){
      this.$router.push('/')
      localStorage.removeItem('token')
      let item = JSON.parse(localStorage.getItem('cart'))
      item.splice(0, item.length)
      localStorage.setItem("cart", JSON.stringify(item))
      location.reload()
    },
    getCartItem(){
      let item = JSON.parse(localStorage.getItem("cart"))
      this.obj = item
    }
  },
  computed : {
    sumAllPrice(){
      let sumprice =0
      for(let i=0;i<this.obj.length;i++){
        sumprice += (this.obj[i].price * this.obj[i].quantity)
      }
      return sumprice
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
