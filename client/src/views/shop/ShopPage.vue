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


      <!-- Start shop&filter div-->
        <div class="shop-container">
          <!--Filter tab-->
          <div class="shop-filter">
            <!--Search bar -->
            <div class="shop-filter-item">
                <div class="filter-title">Search bar</div>
                <div style="display:block">
                  <input style="width:100%;" class="input is-small is-rounded" type="text" v-model="brandname">
                  <div style="display:flex; justify-content:left; margin-top:0.5em">
                    <button class="button is-small is-rounded is-primary is-light" style="width:100%;">search</button>
                  </div>
                </div>
              </div>
              <!-- Filter sex -->
              <div class="shop-filter-item">
                <div class="filter-title">By yourself</div>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Men
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Women
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Kids
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Other
                  </label>
              </div>
              <!-- Filter type -->
              <div class="shop-filter-item">
                <div class="filter-title">By Type</div>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Sneaker
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Sports
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Slippers
                  </label>
              </div>
              <!-- Filter Brand -->
              <div class="shop-filter-item">
                <div class="filter-title">By Brand</div>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Nike
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Adidas
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Converse
                  </label>
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Keen
                  </label>
              </div>
              <!-- Filter Price -->
              <div class="shop-filter-item">
                <div class="filter-title">By Price</div>
                <div style="display:block">
                  <input style="width:100%;" class="input is-small is-rounded" type="number" v-model="minprice">
                  <p style="width:100%; text-align:center; font-size:13px;">to</p>
                  <input style="width:100%;" class="input is-small is-rounded" type="number" v-model="maxprice">
                  <div style="display:flex; justify-content:left; margin-top:0.5em">
                    <button class="button is-small is-rounded is-primary is-light" style="width:100%;">submit</button>
                  </div>
                </div>
              </div>
              <!-- Sort Price -->
              <div class="shop-filter-item">
                <div class="filter-title">Sort By Price</div>
                  <div class="control">
                    <label class="radio lblsize">
                      <input type="radio" name="sortalpha" checked>
                      Low - High
                    </label>
                    <br>
                    <label class="radio lblsize">
                      <input type="radio" name="sortalpha">
                      High - Low
                    </label>
                  </div>
              </div>
              <!-- Sort by Name -->
              <div class="shop-filter-item">
                <div class="filter-title">Sort By Price</div>
                  <div class="control">
                    <label class="radio lblsize">
                      <input type="radio" name="sortprice" checked>
                      A - Z
                    </label>
                    <br>
                    <label class="radio lblsize">
                      <input type="radio" name="sortprice">
                      Z - A
                    </label>
                  </div>
              </div>
          </div>
          <div class="shop-store-card">
            <div class="" v-for="obj in obj" :key="obj.id">
            <!-- item card -->
              <div class="item-card">
                <div class="image-card">
                  <img class="card-image-size" src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b01c67f2-2481-45d7-b383-a1476d768f6e/รองเท้าผู้-air-force-1-07-next-nature-cg65FM.png">
                </div>
                <div class="item-info">
                  <p class="item-info-title">Nike Air Force 1</p>
                  <p class="item-info-price">฿3,500</p>
                  <p class="item-info-remain">สินค้าคงเหลือ 12 ชิ้น</p>
                  <div class="item-info-heart">
                      <svg @click="focus_heart = !focus_heart" style="cursor: pointer; color: red;" xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                          <path v-show="focus_heart == false" d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" fill="red"></path> 
                          <path v-show="obj.focus_heart" fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" fill="red"></path>
                      </svg>
                  </div>
                </div>
              </div>
            <!-- Item card -->
            </div>
          </div>
        </div>
        <!-- end shop&filter div-->
  </section>
  </div>
</template>

<script>
export default {
    data() {
      return {
        minprice : 0,
        maxprice : 99999,
        brandname : "",
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