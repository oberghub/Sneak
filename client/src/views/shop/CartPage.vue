<template>
  <div>
    <section id="app">
      <!-- Starts cart div-->
      <div class="cart-container">
        <div class="cart-result">
          <p class="cart-title">สรุปรายการสั่งซื้อ</p>

          <div class="cart-item" v-for="obj in obj" :key="obj.id">
            <div class="cart-item-image">
              <img class="cart-image" src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b01c67f2-2481-45d7-b383-a1476d768f6e/รองเท้าผู้-air-force-1-07-next-nature-cg65FM.png">
            </div>
              <div class="cart-item-info">
                <p class="cart-item-title-c">Nike Air Force 1</p>
                <p class="cart-item-price-c">฿3,500 <span style="font-size:12px; color:gray;" class="my-1">Size 7 US Men</span></p>
                <p class="cart-item-quantity">x2</p>
              </div>
          </div>

          <div class="cart-item-result">
              <div class="cart-item-title mt-3">รวมทุกรายการ</div>
              <div class="cart-item-price mb-1">฿21,000</div>
              <div style="font-size:12px">ได้รับแต้ม <span style="color:gold;"> 210 </span>แต้ม</div>
          </div>

        </div>
        <div class="cart-upload">
          <!-- <p style="font-size:100px;">ยังไม่ได้ทำปุ่ม SUBMIT</p> -->
          <p class="cart-title">Upload หลักฐาน</p>
          <div class="cart-addressbox">
            <p class="cart-adbox-info"><b>ชื่อ-นามสกุล : </b>ปูนพร้อมก่อ สุดหล่อพร้อมยัง (084-342-6892)</p>
            <p class="cart-adbox-info"><b>เบอร์โทรศัพท์ : </b>084-342-6892</p>
            <p class="cart-adbox-info"><b>ที่อยู่จัดส่ง : </b> 123 / 4 ซอยตัน ถนนห้ามหวง เขตหวงห้าม เมืองวากานดา 69696</p>
          </div>
          <button class="button is-danger is-light my-4" @click="modal_act = true">ดูตัวอย่างการ Upload ที่นี่!</button>
          <!-- Modal ส่งหลักฐาน -->
          <div class="modal" :class="{ 'is-active' : modal_act }" @click="modal_act = false">
            <div class="modal-background"></div>
            <div class="modal-content">
              <p class="image is-4by3">
                <img src="https://bulma.io/images/placeholders/1280x960.png" alt="">
              </p>
            </div>
            <button class="modal-close is-large" aria-label="close" @click="modal_act = false"></button>
          </div>
          <!-- Modal ส่งหลักฐาน -->

          <div class="cart-upload-image">
            <input class="button cart-pickimg" style="margin:auto;" type="file"
                  id="photo" name="photo"
                  accept="image/*" oninput="pic.src=window.URL.createObjectURL(this.files[0])">
          </div>

          <div id="cart-show-image" class="mt-4">
            <img id="pic" class="cart-slip" src="https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png"/>
          </div>

          <div class="cart-datetime">
            <input class="cart-pickdate" type="datetime-local" id="datetime" name="datetime" v-model="dateTime">
          </div>
          <div class="mt-3"></div>
          <p style="font-size:10px; color:red;">*AM คือ เที่ยงคืน - 11 โมงเช้า (12AM - 11AM)</p>
          <p style="font-size:10px; color:red;">*PM คือ เที่ยงวัน - 5 ทุ่ม (12PM - 11PM)</p>
          <button class="button is-success is-light is-large my-4">ยืนยันการชำระเงิน</button> <!-- เช็คที่อยู่ของลูกค้า เช็ครูปว่าอัพมาหรือยัง เช็คว่าใส่วันที่ลงไปหรือยัง-->
        </div>
      </div>
      <!-- End cart div-->
  </section>
  </div>
</template>

<script>
export default {
    data() {
      return {
        modal_act : false,
        previewImage : null,
        dateTime : "",
        obj : [{id:1}, {id:2}, {id:3},{id:1}, {id:2}]
      }
    },
    methods : {
    }
  }
</script>

<style scoped>
</style>
