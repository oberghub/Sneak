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
      <!-- Register Modal -->
      <div id="register-modal" class="modal">
        <div class="modal-background">
          <button class="modal-close is-large" aria-label="close"></button>
        </div>
      </div>

      <!-- Starts cart div-->
      <div class="cart-container">

        <div class="cart-upload">
          <!-- <p style="font-size:100px;">ยังไม่เสร็จ</p> -->
          <p class="cart-title">Upload หลักฐาน</p>
          <button class="button is-danger is-light mb-4" @click="modal_act = true">ดูตัวอย่างการ Upload ที่นี่!</button>
          <!-- Modal ส่งหลักฐาน -->
          <div class="modal" :class="{ 'is-active' : modal_act }" @click="modal_act = false">
            <div class="modal-background"></div>
            <div class="modal-content">
              <p class="image is-4by3">
                <img src="https://bulma.io/images/placeholders/1280x960.png" alt="">
              </p>
            </div>
            <button class="modal-close is-large" aria-label="close" @click="modal_act = false"></button>
          </div>
          <!-- Modal ส่งหลักฐาน -->

          <div class="cart-upload-image">
            <input class="button" style="margin:auto;" type="file"
                  id="photo" name="photo"
                  accept="image/*" oninput="pic.src=window.URL.createObjectURL(this.files[0])">
          </div>

          <div id="cart-show-image" class="mt-4">
            <img id="pic"/>
          </div>

          <div class="cart-datetime">
            <input style="width:250px;" type="datetime-local" id="datetime" name="datetime">
          </div>
          <div class="mt-3"></div>
          <p style="font-size:10px; color:red;">*AM คือ เที่ยงคืน - 11 โมงเช้า (12AM - 11AM)</p>
          <p style="font-size:10px; color:red;">*PM คือ เที่ยงวัน - 5 ทุ่ม (12PM - 11PM)</p>
        </div>

        <div class="cart-result">
          <p class="cart-title">สรุปรายการสั่งซื้อ</p>

          <div class="cart-item" v-for="obj in obj" :key="obj.id">
            <div class="cart-item-image">
              <img class="cart-image" src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b01c67f2-2481-45d7-b383-a1476d768f6e/รองเท้าผู้-air-force-1-07-next-nature-cg65FM.png">
            </div>
              <div class="cart-item-info">
                <p class="cart-item-title-c">Nike Air force one</p>
                <p class="cart-item-price-c">฿3,500</p>
                <p class="cart-item-quantity">x2</p>
              </div>
          </div>

          <div class="cart-item-result">
              <div class="cart-item-title mt-3">รวมทุกรายการ</div>
              <div class="cart-item-price">฿21,000</div>
          </div>

        </div>
      </div>
      <!-- End cart div-->
  </section>
  </div>
</template>

<script>
export default {
    data() {
      return {
        modal_act : false,
        previewImage : null,
        obj : [{id:1}, {id:2}, {id:3},{id:1}, {id:2}, {id:3},{id:1}, {id:2}, {id:3},{id:1}]
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
      },
    }
  }
</script>

<style scoped>
</style>
