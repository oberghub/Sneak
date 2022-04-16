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
            <svg v-show="checkRoute($route.fullPath)" @click="showEditItem = true" class="nav-cart-icon" style="width:2em; height:2em;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 0C107.5 0 117.4 8.19 119.6 19.51L121.1 32H541.8C562.1 32 578.3 52.25 572.6 72.66L518.6 264.7C514.7 278.5 502.1 288 487.8 288H170.7L179.9 336H488C501.3 336 512 346.7 512 360C512 373.3 501.3 384 488 384H159.1C148.5 384 138.6 375.8 136.4 364.5L76.14 48H24C10.75 48 0 37.25 0 24C0 10.75 10.75 0 24 0H96zM128 464C128 437.5 149.5 416 176 416C202.5 416 224 437.5 224 464C224 490.5 202.5 512 176 512C149.5 512 128 490.5 128 464zM512 464C512 490.5 490.5 512 464 512C437.5 512 416 490.5 416 464C416 437.5 437.5 416 464 416C490.5 416 512 437.5 512 464z"/>
            </svg>
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
            <router-link to="/feedback" class="navbar-item itemSpacing font-in-nav" >
              Feedback
            </router-link>
            <svg v-show="checkRoute($route.fullPath)" @click="showEditItem = true" class="nav-cart-icon-d" style="width:2em; height:2em;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M96 0C107.5 0 117.4 8.19 119.6 19.51L121.1 32H541.8C562.1 32 578.3 52.25 572.6 72.66L518.6 264.7C514.7 278.5 502.1 288 487.8 288H170.7L179.9 336H488C501.3 336 512 346.7 512 360C512 373.3 501.3 384 488 384H159.1C148.5 384 138.6 375.8 136.4 364.5L76.14 48H24C10.75 48 0 37.25 0 24C0 10.75 10.75 0 24 0H96zM128 464C128 437.5 149.5 416 176 416C202.5 416 224 437.5 224 464C224 490.5 202.5 512 176 512C149.5 512 128 490.5 128 464zM512 464C512 490.5 490.5 512 464 512C437.5 512 416 490.5 416 464C416 437.5 437.5 416 464 416C490.5 416 512 437.5 512 464z"/>
            </svg>
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
      <!-- <div id="showsubnav"></div> -->
      <!--end nav-->

      <!-- Edit Item in cart -->
      <div class="modal" :class="{ 'is-active' : showEditItem }">
        <div class="modal-background"></div>
          <div class="modal-content">
            <header class="modal-card-head">
              <p class="modal-card-title">Your Item</p>
              <button class="delete" aria-label="close" @click="showEditItem = false"></button>
            </header>
            <section class="modal-card-body">
              <!-- Content ... -->
              <div class="modal-cart-item" v-for="obj,index in obj" :key="obj.id">
                <div class="modal-cart-item-image">
                  <img class="modal-cart-image" :src="obj.img">
                </div>
                  <div class="modal-cart-item-info">
                    <p class="modal-cart-item-title-c">{{obj.name}}</p>
                    <p class="modal-cart-item-price-c">฿{{formatCurrency(obj.price * obj.quantity)}}</p>
                    <div style="display:flex;">
                        <a class="button is-small" @click="checkZero(index)">-</a>
                        <a style="margin-top:auto; margin-bottom:auto; color:gray;" class="mx-4">{{obj.quantity}}</a>
                        <a class="button is-small" @click="obj.quantity++">+</a>
                        <button class="button is-warning is-light is-small ml-3" @click="deleteSomeItem(index)">Delete</button>
                    </div>
                  </div>
              </div>
              <p>Total {{formatCurrency(sumAllPrice)}}</p>
            </section>
            <footer class="modal-card-foot">
              <button class="button is-success" @click="showEditItem = false">
                  <router-link style="color:white;" to="cart">
                  Go to cart
                  </router-link>
                </button> <!-- กดแล้วไปหน้าสรุป CartPage พร้อมส่งค่าไปให้หน้านั้นดั้ว -->
                <button class="button is-danger" @click="clearCart()">
                  clear
                </button>
            </footer>
          </div>
        <button class="modal-close is-large" aria-label="close" @click="showEditItem = false"></button>
      </div>
      <!-- Edit item in cart -->
    <router-view :key="$route.fullPath" />
  </div>
</template>

<script>

export default {
  name: 'App',
  components: {
    
  },
  data () {
    return {
      showEditItem : false,
      counter : 0,
      obj : [{id:1, quantity:1, price:3500, name:"Nike Air Force 1", img : "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b01c67f2-2481-45d7-b383-a1476d768f6e/รองเท้าผู้-air-force-1-07-next-nature-cg65FM.png"},
             {id:2, quantity:1, price:2900, name:"Converse Chuck Taylor All Stars Repro 70's", img: "https://th-test-11.slatic.net/p/ce8d6c97c45bfb245fe92a806ee3e67b.jpg"},
             {id:3, quantity:1, price:4250, name:"Keen Uneek", img:"https://www.selektivbkk.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/_/1_2__1.jpg"}]
    }
  },
  methods : {
    showNavSm(){
      let x = document.getElementById("showmenu")
      // let y = document.getElementById("showsubnav")
      if(x.style.display === 'none'){
        x.style.display = 'block'
        // y.style.display = 'block'
        console.log('block')
      }
      else if(x.style.display === 'block'){
        console.log('none')
        x.style.display = 'none'
        // y.style.display = 'none'
      }
      else{
        console.log('else')
        x.style.display = 'block'
        // y.style.display = 'block'
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
      //axios.delete
      this.obj.splice(0, this.obj.length)
      console.log("cleared")
    },
    deleteSomeItem(index){
      this.obj.splice(index, 1)
    },
    formatCurrency(currency){ //format เงินให้มีลูกน้ำ
      return ((currency).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))
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
