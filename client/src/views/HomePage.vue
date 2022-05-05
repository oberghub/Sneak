<template>
  <div>
    <br />
    <div class="carous">
      <vue-flux
        :options="vfOptions"
        :images="vfImages"
        :transitions="vfTransitions"
        ref="slider"
        style="z-index: 0"
      >
        <template v-slot:controls>
          <flux-controls />
        </template>

        <template v-slot:pagination>
          <flux-pagination />
        </template>
      </vue-flux>
    </div>
    <div class="container">
      <br /><br />
      <p style="font-size: 32px; font-weight:bold; margin-bottom:1em;">หมวดหมู่รองเท้า</p>
      <br />
      <div class="columns">
        <div class="column">
          <router-link :to="{name : 'Shop', params : {value : 'men'}}">
            <div class="card shop-card home-card">
              <div class="card-image">
                <figure class="image is-4by3">
                  <img
                    src="https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%9C%E0%B8%B9%E0%B9%89-air-force-1-07-WrLlWX.png"
                    alt="Placeholder image"
                  />
                </figure>
              </div>
              <div class="card-content">
                <div class="media" style="cursor:pointer;">
                  <div class="media-content" style="overflow: hidden;">
                    <p class="title is-4">MEN</p>
                    <p class="subtitle is-4">รองเท้าผู้ชาย</p>
                  </div>
                </div>
              </div>
            </div>
          </router-link>
        </div>
        <div class="column">
          <router-link :to="{name : 'Shop', params : {value : 'women'}}">
            <div class="card shop-card home-card">
              <div class="card-image" >
                <figure class="image is-4by3">
                  <img
                    src="https://d1a2ggqmhsoom.cloudfront.net/O3lG9XokWWulhvoxIEVTfiZNmW4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/fila-7500-380211-1.jpg"
                    alt="Placeholder image"
                  />
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content" style="overflow: hidden">
                    <p class="title is-4">WOMEN</p>
                    <p class="subtitle is-4">รองเท้าผู้หญิง</p>
                  </div>
                </div>
              </div>
            </div>
          </router-link>
        </div>
        <div class="column">
          <router-link :to="{name : 'Shop', params : {value : 'kid'}}">
            <div class="card shop-card home-card">
              <div class="card-image">
                <figure class="image is-4by3">
                  <img
                    src="https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/0/c/0c94000c64afd35eeabb47ad218277e474e3076b194c6da4941db440ee4318ab.jpeg"
                    alt="Placeholder image"
                  />
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content" style="overflow: hidden">
                    <p class="title is-4">KIDS</p>
                    <p class="subtitle is-4">สำหรับเด็ก</p>
                  </div>
                </div>
              </div>
            </div>
          </router-link>
        </div>
      </div>
      <br />
      <p style="font-size:32px; font-weight:bold; margin-bottom:2em; margin-top:2em;">สินค้าแปลกแหวกแฟชั่น</p>
      <div class="shop-recitem-card">
        <div v-for="item in items" class="recitem-card mb-4" :key="item.item_id">
          <router-link style="color: black" :to="`/detail/${item.item_id}`">
              <div class="image-card">
                <img class="card-image-size" :src="imagePath(item.item_img)" />
              </div>
              <div class="item-info">
                <p class="item-info-title">{{ item.item_name }}</p>
                <p style="margin-bottom: 1em" class="item-info-type">
                  {{
                    item.item_type == 'men' ? 'ผู้ชาย' : item.item_type == 'women' ? 'ผู้หญิง' : 'เด็ก'
                  }}<span
                    style="font-size: 16px; color: red; margin-left: 1em"
                    v-show="item.item_remain == 0"
                    >สินค้าหมด</span
                  >
                </p>
                <p class="item-info-price">
                  ฿{{ formatCurrency(item.item_price) }}
                </p>
                <p class="item-info-remain">
                  มีสินค้าท้ังหมด {{ item.item_remain }} ชิ้น
                </p>
            </div>
          </router-link>
        </div>
      </div>
      <p style="font-size:32px; font-weight:bold; margin-bottom:2em; margin-top:2em;">Converse ใส่แล้วเกิดทุกแนวทาง</p>
      <div class="shop-recitem-card">
        <div v-for="item in items2" class="recitem-card mb-4" :key="item.item_id">
          <router-link style="color: black" :to="`/detail/${item.item_id}`">
              <div class="image-card">
                <img class="card-image-size" :src="imagePath(item.item_img)" />
              </div>
              <div class="item-info">
                <p class="item-info-title">{{ item.item_name }}</p>
                <p style="margin-bottom: 1em" class="item-info-type">
                  {{
                    item.item_type == 'men' ? 'ผู้ชาย' : item.item_type == 'women' ? 'ผู้หญิง' : 'เด็ก'
                  }}<span
                    style="font-size: 16px; color: red; margin-left: 1em"
                    v-show="item.item_remain == 0"
                    >สินค้าหมด</span
                  >
                </p>
                <p class="item-info-price">
                  ฿{{ formatCurrency(item.item_price) }}
                </p>
                <p class="item-info-remain">
                  มีสินค้าท้ังหมด {{ item.item_remain }} ชิ้น
                </p>
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { VueFlux, FluxControls, FluxPagination } from "vue-flux";
import axios from "@/plugins/axios";
export default {
  components: {
    VueFlux,
    FluxControls,
    FluxPagination,
  },

  data: () => ({
    items: null,
    items2 : null,
    vfOptions: {
      autoplay: true,
    },
    vfImages: [
      "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7ed0855435194229a525aad6009a0497_9366/Superstar_Shoes_White_EG4958_01_standard.jpg",
      "https://www.soul4street.com/wp-content/uploads/2020/01/https___hypebeast.com_image_2020_01_air-jordan-1-low-noble-red-553558-604-release-info-5.jpg",
      "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/e7ef43c8f2f64e9ab834ae0800981571_9366/Stan_Smith_Shoes_White_GW0488_01_standard.jpg",
      "https://www.unlockmen.com/wp-content/uploads/2017/06/170623-converse-1-cover.jpg",
      "https://cdn.pixabay.com/photo/2016/11/19/18/06/feet-1840619__480.jpg",
      "https://mvcmagazine.com/wp-content/uploads/2020/10/mvccopbalenciaga.jpg",
      "https://promotions.co.th/wp-content/uploads/2020/10/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B9%82%E0%B8%AD%E0%B8%99%E0%B8%B4%E0%B8%8B%E0%B8%B6%E0%B8%81%E0%B8%B0.jpg",
    ],
    vfTransitions: ["fade"],
  }),
  methods: {
    formatCurrency(currency) {
      //format เงินให้มีลูกน้ำ
      return currency.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
    },
    imagePath(path){
      if (path.substring(0, 5) != 'https') {
        return "http://localhost:3000/" + path;
      } else {
        return path;
      }
    },
  },
  created() {
    axios
      .get("http://localhost:3000/recitem")
      .then((response) => {
        this.items = response.data.item;
        this.items2 = response.data.item2
        console.log(response.data.item);
      })
      .catch((err) => {
        console.log(err);
        console.log("exittttt1t");
      });
  },
};
</script>

<style scoped>
</style>