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
            <div style="display: flex">
              <a class="button" @click="checkZero">-</a>
              <a
                style="margin-top: auto; margin-bottom: auto; color: gray"
                class="mx-5"
                >{{ counter }}</a
              >
              <a class="button" @click="counter++">+</a>
            </div>
            <p v-if="size_remain === 'Choose Size'" class="item-remain">สินค้าเหลือ {{ items.item_remain }} ชิ้น</p>
            <p v-else class="item-remain">สินค้าเหลือ {{ size_remain }} ชิ้น</p>
          </div>
          <div class="detail-option">
            <div class="select is-normal">
              <select v-model="size_remain">
                <option disabled>Choose Size</option>
                <option v-for="size in size" :key="size.size_id" :value="size.size_remain">US {{size.size}}</option>
              </select>
            </div>
          </div>
          <div class="detail-button">
            <button class="button is-success is-large is-light mr-5">
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
import axios from "axios";
export default {
  data() {
    return {
      counter: 1,
      focus_heart: false, //ใช้ทดสอบชั่วคราว,
      items: null,
      size: null,
      size_remain : "Choose Size"
    };
  },
  methods: {
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