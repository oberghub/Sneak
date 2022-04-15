<template>
  <div>
    <section id="app">
      <div class="redeem-container">
        <p class="text-redeem">แลกรับของรางวัล</p>
        <p style="font-size:14px; font-weight:bold">Your point : 131</p>
        <div class="redeem-store-card">
          <div class="" v-for="obj, index in obj" :key="obj.id">
          <!-- redeem card -->
            <div class="redeem-card">
              <div class="image-redeem-card">
                <img v-show="index % 2 == 0" class="card-image-redeem-size" src="https://aumento.officemate.co.th/media/catalog/product/O/F/OFMM001910.jpg">
                <img v-show="index % 2 != 0" class="card-image-redeem-size" src="https://erp.waikawee.com/img.php?file=trulybkk/Uploads/C20C1SGYH2WH00/truly-12.jpg">
              </div>
              <div class="redeem-info">
                <p  v-show="index % 2 == 0" class="redeem-info-title">Mini Bag</p>
                <p  v-show="index % 2 == 0" class="redeem-info-price">125 แต้ม</p>
                <p v-show="index % 2 != 0" class="redeem-info-title">Su(o)ck</p>
                <p v-show="index % 2 != 0" class="redeem-info-price">90 แต้ม</p>
                <p class="redeem-info-remain">รางวัลคงเหลือ 12 ชิ้น</p>
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
export default {
    data() {
      return {
        focus_heart : false,
        obj : [{id: 1, name : 'John', focus_heart : true}, {id: 1 ,name : 'John2'}, {id: 1, name : 'John3'}, {id: 1, name : 'John4'},
        {id: 1, name : 'John5', focus_heart : true}]
      }
    },
    methods : {
    }
  }
</script>

<style scoped>
</style>