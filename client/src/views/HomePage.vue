<template>
  <div>
    <br />
    <div
      class="carous"
    >
      <vue-flux
        :options="vfOptions"
        :images="vfImages"
        :transitions="vfTransitions"
        ref="slider"
        style="z-index: 0;"
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
      <!-- <h1 style="font-size: 2.7em">SneakerShop ขอต้อนรับ</h1> -->
      <br />
      <div class="columns">
        <div class="column">
          <div class="card shop-card home-card">
            <div class="card-image">
              <figure class="image is-4by3">
                <img
                  src="https://balenciaga.dam.kering.com/m/2aa3ecc582db239f/Large-653870W2RA31212_F.jpg?v=4"
                  alt="Placeholder image"
                />
              </figure>
            </div>
            <div class="card-content">
              <div class="media">
                <div class="media-content" style="overflow:hidden;">
                  <p class="title is-4">Recommend Products</p>
                  <p class="subtitle is-4">สินค้าแนะนํา</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="column">
          <router-link to="/shop">
          <div class="card shop-card home-card">
            <div class="card-image">
              <figure class="image is-4by3">
                <img
                  src="https://www.kito.co.th/wp-content/uploads/2021/10/Kito-BE7-BW-1.jpg"
                  alt="Placeholder image"
                />
              </figure>
            </div>
            <div class="card-content">
              <div class="media">
                <div class="media-content" style="overflow:hidden;">
                  <p class="title is-4">ALL Products</p>
                  <p class="subtitle is-4">สินค้าทั้งหมด</p>
                </div>
              </div>
            </div>
          </div>
          </router-link>
        </div>
        <div class="column">
          <router-link to="/redeem">
          <div class="card shop-card home-card">
            <div class="card-image">
              <figure class="image is-4by3">
                <img
                  src="https://balenciaga.dam.kering.com/m/2aa3ecc582db239f/Large-653870W2RA31212_F.jpg?v=4"
                  alt="Placeholder image"
                />
              </figure>
            </div>
            <div class="card-content">
              <div class="media">
                <div class="media-content" style="overflow:hidden;">
                  <p class="title is-4">Redeem</p>
                  <p class="subtitle is-4">แลกสินค้า</p>
                </div>
              </div>
            </div>
          </div>
          </router-link>
        </div>
      </div>
      <br>
    </div>
  </div>
</template>

<script>
import { VueFlux, FluxControls, FluxPagination } from "vue-flux";
// import axios from '@/plugins/axios'
export default {
  components: {
    VueFlux,
    FluxControls,
    FluxPagination,
  },

  data: () => ({
    vfOptions: {
      autoplay: true,
    },
    vfImages: [
      "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7ed0855435194229a525aad6009a0497_9366/Superstar_Shoes_White_EG4958_01_standard.jpg",
      "https://www.soul4street.com/wp-content/uploads/2020/01/https___hypebeast.com_image_2020_01_air-jordan-1-low-noble-red-553558-604-release-info-5.jpg",
      "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/e7ef43c8f2f64e9ab834ae0800981571_9366/Stan_Smith_Shoes_White_GW0488_01_standard.jpg",
      "https://www.unlockmen.com/wp-content/uploads/2017/06/170623-converse-1-cover.jpg",
    ],
    vfTransitions: ['fade'],
  }),
};
</script>

<style scoped>
</style>