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
      <h1 style="font-size: 2.7em">SneakerShop ขอต้อนรับ</h1>
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
      "https://cdn.mos.cms.futurecdn.net/7biBAm9ouR7ELAnNsj4zpR.jpg",
      "https://runningmagazine.ca/wp-content/uploads/2022/03/SS22-Cloudmonster-GDN-Asset-9-1200x628-1.jpg",
      "https://cf.shopee.co.th/file/bf9af64aa05710a00cb0d4bc571793b3",
    ],
    vfTransitions: ['fade'],
  }),
};
</script>

<style scoped>
</style>