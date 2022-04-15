<template>
  <div>
    <section id="app">
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
              <!-- Filter human type -->
              <div class="shop-filter-item">
                <div class="filter-title">By Human type</div>
                  <div v-for="type in human" :key="type.item_type" >
                    <label class="checkbox lblsize">
                      <input type="checkbox">
                      {{type.item_type.charAt(0).toUpperCase() + type.item_type.slice(1)}}
                    </label>
                  </div>
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
                  <br>
                  <label class="checkbox lblsize">
                    <input type="checkbox">
                    Accessories
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
                    <!-- <button class="button is-small is-rounded is-primary is-light" style="width:100%;">submit</button> -->
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
            <div class="" v-for="item in items" :key="item.item_id">
            <!-- item card -->
              <div class="item-card">
                <div class="image-card">
                  <img class="card-image-size" :src="item.item_img" >
                </div>
                <div class="item-info">
                  <p class="item-info-title">{{overTxt(item.item_name)}}</p>
                  <p class="item-info-price">฿{{formatCurrency(item.item_price)}}</p>
                  <p class="item-info-remain">สินค้าคงเหลือ {{item.item_remain}} ชิ้น</p>
                  <div class="item-info-heart">
                      <svg @click="focus_heart = !focus_heart" style="cursor: pointer; color: red;" xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                          <path v-show="focus_heart == false" d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" fill="red"></path> 
                          <!-- <path v-show="obj.focus_heart" fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" fill="red"></path> -->
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
import axios from 'axios'
export default {
    data() {
      return {
        minprice : 0,
        maxprice : 99999,
        items : null,
        human : null,
        brandname : "",
        focus_heart : false,
      }
    },
    methods : {
      formatCurrency(currency){ //format เงินให้มีลูกน้ำ
        return ((currency).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))
      },
      overTxt(txt){
        if(txt.length > 20){
          return txt.slice(0, 19) + '...'
        }
        else{
          return txt
        }
      },
    },
    created(){
      axios.get("http://localhost:3000/shop/", {})
      .then((response) => {
        this.items = response.data.items
        this.human = response.data.byHuman
        console.log('data = ', response.data)
      })
      .catch((err) => {
        console.log(err, "WTF")
      });
    }
  }
</script>

<style scoped>
</style>