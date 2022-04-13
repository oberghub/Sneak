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

      <!-- Start Detail div-->
            <div class="detail-box">
                <div class="detail-image">
                    <img class="detail-image-size" src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b01c67f2-2481-45d7-b383-a1476d768f6e/รองเท้าผู้-air-force-1-07-next-nature-cg65FM.png" >
                </div>
                <div class="detail-info">
                    <div class="detail-title">Nike Air force 1</div>
                    <div class="detail-price">฿3,500</div>
                    <div class="detail-quantity">
                        <div style="display:flex">
                            <a class=button @click="checkZero">-</a>
                            <a style="margin-top:auto; margin-bottom:auto; color:gray;" class="mx-5">{{counter}}</a>
                            <a class=button @click="counter++">+</a>
                        </div>
                        <p class="item-remain">สินค้าเหลือ 12 ชิ้น</p>
                    </div>
                    <div class="detail-option">
                        <div class="select is-normal">
                          <select>
                            <option>Choose Size</option>
                            <option>US 7</option>
                            <option>US 7.5</option>
                            <option>US 8</option>
                            <option>US 8.5</option>
                            <option>US 9</option>
                            <option>US 9.5</option>
                            <option>US 10</option>
                            <option>US 10.5</option>
                            <option>US 11</option>
                            <option>US 11.5</option>
                            <option>US 12</option>
                          </select>
                        </div>
                    </div>
                    <div class="detail-button">
                        <button class="button is-success is-large is-light mr-5">Add to cart</button>
                        <div style="display:flex;">
                            <svg @click="focus_heart = !focus_heart" style="cursor: pointer; color: red; margin-top:1em;" xmlns="http://www.w3.org/2000/svg" width="1.8em" height="1.8em" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                <path v-show="focus_heart == false" d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" fill="red"></path> 
                                <path v-show="focus_heart" fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" fill="red"></path>
                            </svg>
                            <p class="favitem" style="font-size:20px; margin-top:auto; margin-bottom:auto; margin-left:1em">Add to favourite</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="detail-content">
                <p style="text-indent: 50px;">อยู่เหนือทุกการเล่น รองเท้าผลิตจากวัสดุรีไซเคิลอย่างน้อย 20% ตามน้ำหนัก เป็นคู่ออริจินัลที่เคยขีดเขียนประวัติศาสตร์สนีกเกอร์และในวันนี้ได้รับการปรับโฉมด้วยหนังสังเคราะห์</p>
            </div>
            <!-- end Detail div -->
    </section>
  </div>
</template>

<script>
export default {
    data() {
      return {
          counter : 1,
          focus_heart : false, //ใช้ทดสอบชั่วคราว
      }
    },
    methods : {
        //เช็คจำนวนที่จะเอาสินค้าลง cart
        checkZero(){
            if(this.counter <= 1){
                this.counter = 1
            }
            else{
                this.counter--
            }
        },
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