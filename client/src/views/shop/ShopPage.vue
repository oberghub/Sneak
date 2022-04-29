
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
            <div style="display: block">
              <input
                style="width: 100%"
                class="input is-small is-rounded"
                type="text"
                v-model="brandname"
              />
              <div
                style="display: flex; justify-content: left; margin-top: 0.5em"
              >
              </div>
            </div>
          </div>
          <!-- <div class="shop-filter-item">
            <div class="filter-title">All Items ({{allitem}})</div>
          </div> -->
          <!-- Filter human type -->
          <div class="shop-filter-item">
            <div class="filter-title">By Human</div>
            <div v-for="type in human" :key="type.item_type">
              <label class="checkbox lblsize">
                <input type="checkbox" v-model="checkedType" :value="type.item_type"/>
                {{
                  type.item_type.charAt(0).toUpperCase() + type.item_type.slice(1)
                }}
                ({{type.count_type}})
              </label>
            </div>
          </div>
          <!-- Filter type -->
          <div class="shop-filter-item">
            <div class="filter-title">By Type</div>
            <label class="checkbox lblsize">
              <input type="checkbox" />
              Sneaker
            </label>
            <br />
            <label class="checkbox lblsize">
              <input type="checkbox" />
              Sports
            </label>
            <br />
            <label class="checkbox lblsize">
              <input type="checkbox" />
              Slippers
            </label>
            <br />
            <label class="checkbox lblsize">
              <input type="checkbox" />
              Accessories
            </label>
          </div>
          <!-- Filter Brand -->
          <div class="shop-filter-item">
            <div class="filter-title">By Brand</div>
            <div v-for="type in brand" :key="type.item_brand">
              <label class="checkbox lblsize">
                <input type="checkbox" v-model="checkedBrand" :value="type.item_brand"/>
                {{
                  type.item_brand.charAt(0).toUpperCase() +
                  type.item_brand.toLowerCase().slice(1)
                }}
                ({{type.count_brand}})
              </label>
            </div>
          </div>
          <!-- Filter Price -->
          <div class="shop-filter-item">
            <div class="filter-title">By Price</div>
            <div style="display: block">
              <input
                style="width: 100%"
                class="input is-small is-rounded"
                type="number"
                v-model="minprice"
              />
              <p style="width: 100%; text-align: center; font-size: 13px">to</p>
              <input
                style="width: 100%"
                class="input is-small is-rounded"
                type="number"
                v-model="maxprice"
              />
              <div
                style="display: flex; justify-content: left; margin-top: 0.5em"
              >
              </div>
            </div>
          </div>
          <!-- Sort Price -->
          <div class="shop-filter-item">
            <div class="filter-title">Sort By Price</div>
            <div class="control">
              <label class="radio lblsize">
                <input type="radio" name="sort" v-model="checkedSort" value="l-h"/>
                Low - High
              </label>
              <br />
              <label class="radio lblsize">
                <input type="radio" name="sort" v-model="checkedSort" value="h-l"/>
                High - Low
              </label>
            </div>
          </div>
          <!-- Sort by Name -->
          <div class="shop-filter-item">
            <div class="filter-title">Sort By Name</div>
            <div class="control">
              <label class="radio lblsize">
                <input type="radio" name="sort" v-model="checkedSort" value="a-z"/>
                A - Z
              </label>
              <br />
              <label class="radio lblsize">
                <input type="radio" name="sort" v-model="checkedSort" value="z-a"/>
                Z - A
              </label>
            </div>
          </div>
        </div>
        <div class="shop-store-card">
          <template v-for="item in showItem">
            <div class="item-card" :key="item.item_id" v-if="minprice <= item.item_price && item.item_price <= maxprice">
              <router-link style="color:black;" :to="`/detail/${item.item_id}`">
              
                <div class="image-card">
                  <img class="card-image-size" :src="item.item_img" />
                </div>
                <div class="item-info">
                  <p class="item-info-title">{{ item.item_name }}</p>
                  <p style="margin-bottom:1em;" class="item-info-type">{{ item.item_type.charAt(0).toUpperCase() + item.item_type.slice(1) }}<span style="font-size:16px; color:red; margin-left:1em;" v-show="item.item_remain == 0">สินค้าหมด</span> </p>
                  <p class="item-info-price">
                    ฿{{ formatCurrency(item.item_price) }}
                  </p>
                  <p class="item-info-remain">
                    มีสินค้าท้ังหมด {{ item.item_remain }} ชิ้น
                  </p>
                  <div v-if="!user"></div>
                  <div v-else>
                      <div class="item-info-heart">
                        <svg
                          style="cursor: pointer; color: red"
                          xmlns="http://www.w3.org/2000/svg"
                          width="20px"
                          height="20px"
                          fill="currentColor"
                          class="bi bi-heart"
                          viewBox="0 0 16 16"
                        >
                          <path v-if="checkHeart.some(heart=>heart.item_id === item.item_id)"
                            fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" 
                            fill="red"
                          ></path>
                          <path v-else
                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
                            fill="red"
                          ></path>
                        </svg>
                      </div>
                  </div>
                </div>
              </router-link>
            </div>
            <!-- Item card -->
          </template>
        </div>
      </div>
      <!-- end shop&filter div-->
    </section>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: ['user'],
  data() {
    return {
      minprice: 0,
      maxprice: 99999,
      items: null,
      human: null,
      allitem : null,
      brandname: "",
      itemcount : "",
      focus_heart: false,
      brand: null,
      checkedType: [],
      checkedBrand: [],
      checkedSort: 'l-h',
    };
  },
  methods: {
    formatCurrency(currency) {
      //format เงินให้มีลูกน้ำ
      return currency.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
    },
    // overTxt(txt) {
    //   if (txt.length > 30) {
    //     return txt.slice(0, 19) + "...";
    //   } else {
    //     return txt;
    //   }
    // }
  },
  computed : {
    checkHeart(){
      let copy = []
      for(let i=0;i<this.focus_heart.length;i++){
        if(this.focus_heart[i].user_id == this.user.user_id){
          copy.push(this.focus_heart[i])
        }
      }
      return copy
    },
    showItem(){
      let tempitems = this.items
      if(this.brandname != '' && this.brandname){
        tempitems = tempitems.filter((item) => { //array prototype match ใช้ตัวอักษรบางส่วนเทียบกับข้อความ ถ้ามี return true 
          return (item.item_name.toLowerCase().match(this.brandname.toLowerCase()))
        })
      }

      if(this.checkedType.length){
        let copy = []
        tempitems = tempitems.filter((item) => {
          for(let i=0; i<this.checkedType.length; i++){
            if(item.item_type === this.checkedType[i]){
              copy.push(item)
            }
          }
        })
        tempitems = copy
      }
      
      if(this.checkedBrand.length){
        let copy = []
        tempitems = tempitems.filter((item) => {
          for(let i=0; i<this.checkedBrand.length; i++){
            if(item.item_brand.toLowerCase() === this.checkedBrand[i].toLowerCase()){
              copy.push(item)
            }
          }
        })
        tempitems = copy
      }
      
      if(this.checkedSort === 'l-h'){
        tempitems = tempitems.sort((a,b) =>{
          if(a.item_price < b.item_price){
            console.log(1)
            return -1
          }
          if(a.item_price > b.item_price){
            return 1
          }
          return 0
        })
      }

      if(this.checkedSort === 'h-l'){
        tempitems = tempitems.sort((a,b) =>{
          if(a.item_price < b.item_price){
            return 1
          }
          if(a.item_price > b.item_price){
            return -1
          }
          return 0
        })
      }
      
      if(this.checkedSort === 'a-z'){
        tempitems = tempitems.sort((a,b) =>{
          if(a.item_name.toLowerCase() < b.item_name.toLowerCase()){
            return -1
          }
          if(a.item_name.toLowerCase() > b.item_name.toLowerCase()){
            return 1
          }
          return 0
        })
      }

      if(this.checkedSort === 'z-a'){
        tempitems = tempitems.sort((a,b) =>{
          if(a.item_name.toLowerCase() < b.item_name.toLowerCase()){
            return 1
          }
          if(a.item_name.toLowerCase() > b.item_name.toLowerCase()){
            return -1
          }
          return 0
        })
      }
      return tempitems;
    }
  },
  created() {
    axios
      .get("http://localhost:3000/shop/", {})
      .then((response) => {
        this.items = response.data.items;
        this.human = response.data.byHuman;
        this.brand = response.data.brand;
        this.allitem = response.data.allitem[0].count;
        this.focus_heart = response.data.fav[0]
        console.log("data = ", response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<style scoped>
</style>
