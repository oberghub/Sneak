<template>
  <div>
    <section id="app">
      <!-- Start Detail div-->
      <div class="detail-box">
        <div class="detail-image">
          <img class="detail-image-size" :src="items.item_img" />
        </div>
        <div class="detail-info">
          <div class="detail-title">{{ items.item_name }}</div>
          <div class="detail-price">
            ฿ {{ formatCurrency(items.item_price) }}
          </div>
          <div class="detail-quantity">
            <p style="font-size:20px; color:red; text-align:left;" v-show="items.item_remain == 0">สินค้าหมด</p>
            <div style="display: flex" v-show="items.item_remain != 0">
              <a class="button" @click="checkZero">-</a>
              <a
                style="margin-top: auto; margin-bottom: auto; color: gray"
                class="mx-5"
                >{{ counter }}</a
              >
              <a class="button" @click="counter++">+</a>
            </div>
            <p v-if="size_remain === 'Choose Size' && items.item_remain != 0" class="item-remain">มีสินค้าทั้งหมด {{ items.item_remain }} ชิ้น</p>
            <p v-else-if="size_remain !== 'Choose Size' && items.item_remain != 0" class="item-remain">สินค้าคงเหลือ {{ size_remain }} ชิ้น</p>
          </div>
          <div class="detail-option" v-show="items.item_remain != 0">
            <div class="select is-normal" v-if="items.item_type == 'kid'">
              <select v-model="size_remain">
                <option disabled>Choose Size</option>
                <option v-for="size in size" :key="size.size_id" :value="size.size_remain" :disabled="size.size_remain == 0" :style= "[size.size_remain == 0 ? {color : '#E1E1E1'} : {color : 'black'}]">US {{size.size}} Y</option>
              </select>
            </div>
            <div class="select is-normal" v-else>
              <select v-model="size_remain">
                <option disabled>Choose Size</option>
                <option v-for="size, index in size" :key="size.size_id" :value="size.size_remain" :disabled="size.size_remain == 0" :input="setSize(index)" :style= "[size.size_remain == 0 ? {color : '#E1E1E1'} : {color : 'black'}]">US {{size.size}} {{items.item_type.charAt(0).toUpperCase()}}</option>
              </select>
            </div>
          </div>
          <div class="detail-button">
            <button @click="addItem" class="button is-success is-large is-light mr-5" v-show="items.item_remain != 0">
              Add to cart
            </button>
            <div style="display: flex">
              <svg
                @click="focus_heart = !focus_heart"
                style="cursor: pointer; color: red; margin-top: 1em"
                xmlns="http://www.w3.org/2000/svg"
                width="1.8em"
                height="1.8em"
                fill="currentColor"
                class="bi bi-heart"
                viewBox="0 0 16 16"
              >
                <path
                  v-show="focus_heart == false"
                  d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
                  fill="red"
                ></path>
                <path
                  v-show="focus_heart"
                  fill-rule="evenodd"
                  d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
                  fill="red"
                ></path>
              </svg>
              <p
                class="favitem"
                style="
                  font-size: 20px;
                  margin-top: auto;
                  margin-bottom: auto;
                  margin-left: 1em;
                "
              >
                Add to favourite
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="detail-content">
        <p style="text-indent: 50px">
          {{items.item_desc}}
        </p>
      </div>
      <!-- end Detail div -->
    </section>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  data() {
    return {
      counter: 1,
      focus_heart: false, //ใช้ทดสอบชั่วคราว,
      items: null,
      size: null,
      size_remain : "Choose Size",
      select_size : "",
      item_in_cart : []
    };
  },
  methods: {
    setSize(index){
      this.select_size = this.size[index].size
    },
    addItem(){
      this.item_in_cart.push({name : this.items.item_name, 
      price : this.items.item_price, 
      size : this.select_size + " US " + this.items.item_type,
      quantity : this.counter})
      localStorage.setItem("cart", JSON.stringify(this.item_in_cart))
    },
    //เช็คจำนวนที่จะเอาสินค้าลง cart
    checkZero() {
      if (this.counter <= 1) {
        this.counter = 1;
      } else {
        this.counter--;
      }
    },
    formatCurrency(currency) {
      //format เงินให้มีลูกน้ำ
      return currency.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
    },
  },
  created() {
    axios
      .get("http://localhost:3000/detail/" + this.$route.params.id)
      .then((response) => {
        this.items = response.data.items[0];
        this.size = response.data.items
        console.log("data = ", response.data);
      })
      .catch((err) => {
        console.log(err, "WTF");
      });
  },
};
</script>

<style scoped>
</style>