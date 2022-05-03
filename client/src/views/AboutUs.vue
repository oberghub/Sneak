<template>
  <div>
    <br />
    <div class="container">
      <br /><br />
      <!-- <h1 style="font-size: 2.7em">SneakerShop ขอต้อนรับ</h1> -->
      <br />
      <div class="columns">
        <div class="column">
          <div class="card shop-card home-card">
            <div class="card-image">
              <figure class="image is-4by4">
                <img
                  src="https://media.discordapp.net/attachments/877785654329753660/970944245533904906/279331497_381108473938290_2580588671558885245_n.jpg?width=561&height=619"
                  alt="Placeholder image"
                />
              </figure>
            </div>
            <div class="card-content">
              <div class="media">
                <div class="media-content" style="overflow: hidden">
                  <p class="title is-4">สมาชิกคนที่1</p>
                  <p class="subtitle is-4">นายณัชพล นันทัสนติ</p>
                  <p class="subtitle is-4">63070049</p>
                  <p class="subtitle is-4">Developer</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="column">
          <router-link to="/shop">
            <div class="card shop-card home-card">
              <div class="card-image">
                <figure class="image">
                  <img
                    src="https://www.kito.co.th/wp-content/uploads/2021/10/Kito-BE7-BW-1.jpg"
                    alt="Placeholder image"
                  />
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content" style="overflow: hidden">
                    <p class="title is-4">สมาชิกคนที่2</p>
                    <p class="subtitle is-4">นายณัฐพล วังคํา</p>
                    <p class="subtitle is-4">63070056</p>
                    <p class="subtitle is-4">Developer</p>
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
                    src="https://media.discordapp.net/attachments/839907788629082152/970945306546024448/line_1465371854896417.jpg?width=412&height=619"
                    alt="Placeholder image"
                  />
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content" style="overflow: hidden">
                    <p class="title is-4">สมาชิกคนที่3</p>
                    <p class="subtitle is-4">นายธิติวุฒิ หุ่นท่าไม้</p>
                    <p class="subtitle is-4">63070085</p>
                    <p class="subtitle is-4">Developer</p>
                  </div>
                </div>
              </div>
            </div>
          </router-link>
        </div>
      </div>
      <br />
    </div>
  </div>
</template>

<script>
// import { VueFlux, FluxControls, FluxPagination } from "vue-flux";
// import axios from "@/plugins/axios";
export default {};
</script>

<style scoped>
</style>