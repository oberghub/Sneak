<template>
  <div>
    <section id="app">
      <div class="redeem-container">
        <p class="text-redeem">แลกรับของรางวัล</p>
        <p style="font-size: 14px; font-weight: bold" v-if="user">
          แต้มของคุณมี : {{ user.user_point }}
        </p>
        <p style="font-size: 14px; font-weight: bold" v-else>
          โปรดเข้าสู่ระบบก่อนแลกรางวัล 'นะจ๊ะ'.
        </p>
        <div class="redeem-store-card">
          <div class="" v-for="item in items" :key="item.red_id">
            <!-- redeem card -->
            <div class="redeem-card">
              <div class="image-redeem-card">
                <img class="card-image-redeem-size" :src="item.red_img" />
              </div>
              <div class="redeem-info">
                <p class="redeem-info-title">{{ item.red_name }}</p>
                <p class="redeem-info-price">{{ item.red_point }} แต้ม</p>
                <p
                  style="font-size: 16px; color: red; margin-top: 0.7em;"
                  class="item-info-type"
                  v-if="item.red_remain == 0"
                >
                  สินค้าหมด
                </p>
                <p class="redeem-info-remain" v-else>
                  รางวัลคงเหลือ {{ item.red_remain }} ชิ้น
                </p>

                <div class="redeem-info-heart"  v-if="user">
                  <button
                    :disabled="
                      item.red_remain == 0 || user.user_point < item.red_point
                    "
                    @click="goRedeem(item.red_id)"
                    class="button is-primary is-light is-medium"
                  >
                    Redeem
                  </button>
                </div>
                <div class="redeem-info-heart"  v-if="!user">
                  <button
                    disabled
                    @click="goRedeem(item.red_id)"
                    class="button is-primary is-light is-medium"
                  >
                    Redeem
                  </button>
                </div>
              </div>
            </div>
            <!-- redeem card -->
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";
export default {
  props: ["user"],
  data() {
    return {
      minprice: 0,
      maxprice: 99999,
      items: null,
      // human: null,
      brandname: "",
      // focus_heart: false,
      remain: 0,
      point: 0,
    };
  },
  methods: {
    goRedeem(id) {
      if (confirm("ต้องการแลกสินค้านี้มั้ย") == true) {
        axios
          .put("http://localhost:3000/redeem/" + id, {
            user: this.user.user_id,
          })
          .then((response) => {
            console.log("data = ", response.data);
            // this.user.user_point = response.data.point
          })
          .catch((err) => {
            console.log(err, "WTF");
          });
        axios
          .post("http://localhost:3000/redeem/" + id, {
            user: this.user.user_id,
          })
          .then((response) => {
            console.log("data = ", response.data);
            // this.user.user_point = response.data.point
          })
          .catch((err) => {
            console.log(err, "WTF");
          });
      }
      this.$router.go();
    },
  },
  created() {
    axios
      .get("http://localhost:3000/redeem/", {})
      .then((response) => {
        this.items = response.data.items;
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