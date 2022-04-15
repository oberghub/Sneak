<template>
  <div>
    <section id="app">
      <div class="redeem-container">
        <p class="text-redeem">แลกรับของรางวัล</p>
        <p style="font-size:14px; font-weight:bold">Your point : 131</p>
        <div class="redeem-store-card">
          <div class="" v-for="item in items" :key="item.red_id">
          <!-- redeem card -->
            <div class="redeem-card">
              <div class="image-redeem-card">
                <img class="card-image-redeem-size" :src="item.red_img">
              </div>
              <div class="redeem-info">
                <p v-show="index % 2 != 0" class="redeem-info-title">{{overTxt(item.red_name)}}</p>
                <p v-show="index % 2 != 0" class="redeem-info-price">{{item.red_point}} แต้ม</p>
                <p class="redeem-info-remain">รางวัลคงเหลือ {{item.red_remain}} ชิ้น</p>
                <div class="redeem-info-heart">
                    <button class="button is-primary is-light is-medium">Redeem</button>
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
      axios.get("http://localhost:3000/redeem/", {})
      .then((response) => {
        this.items = response.data.items
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