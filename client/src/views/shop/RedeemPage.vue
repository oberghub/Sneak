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
        <div class="redeem-container">
          <p class="text-redeem">แลกรับของรางวัล</p>
          <p style="font-size:14px; font-weight:bold">Your point : 131</p>
          <div class="redeem-store-card">
            <div class="" v-for="obj, index in obj" :key="obj.id">
            <!-- redeem card -->
              <div class="redeem-card">
                <div class="image-redeem-card">
                  <img v-show="index % 2 == 0" class="card-image-redeem-size" src="https://aumento.officemate.co.th/media/catalog/product/O/F/OFMM001910.jpg">
                  <img v-show="index % 2 != 0" class="card-image-redeem-size" src="https://erp.waikawee.com/img.php?file=trulybkk/Uploads/C20C1SGYH2WH00/truly-12.jpg">
                </div>
                <div class="redeem-info">
                  <p  v-show="index % 2 == 0" class="redeem-info-title">Mini Bag</p>
                  <p  v-show="index % 2 == 0" class="redeem-info-price">125 แต้ม</p>
                  <p v-show="index % 2 != 0" class="redeem-info-title">Su(o)ck</p>
                  <p v-show="index % 2 != 0" class="redeem-info-price">90 แต้ม</p>
                  <p class="redeem-info-remain">รางวัลคงเหลือ 12 ชิ้น</p>
                  <div class="redeem-info-heart">
                      <button class="button is-primary is-light is-medium">Redeem</button>
                  </div>
                </div>
              </div>
            <!-- redeem card -->
            </div>
          </div>
        </div>
  </section>
  </div>
</template>

<script>
export default {
    data() {
      return {
        focus_heart : false,
        obj : [{id: 1, name : 'John', focus_heart : true}, {id: 1 ,name : 'John2'}, {id: 1, name : 'John3'}, {id: 1, name : 'John4'},
        {id: 1, name : 'John5', focus_heart : true}]
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