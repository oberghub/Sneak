<template>
  <div>
    <section id="app">
      <!-- Starts cart div-->
      <div class="cart-container">
        <div class="cart-result">
          <p class="cart-title">สรุปรายการสั่งซื้อ</p>

          <div class="cart-item" v-for="obj in obj" :key="obj.id">
            <div class="cart-item-image">
              <img class="cart-image" :src="imagePath(obj.img)" />
            </div>
            <div class="cart-item-info">
              <p class="cart-item-title-c">{{ obj.name }}</p>
              <p class="cart-item-price-c">
                ฿{{ formatCurrency(obj.price) }}
                <span style="font-size: 12px; color: gray" class="my-1"
                  >{{ obj.size }} US {{ obj.type }}</span
                >
              </p>
              <p class="cart-item-quantity">จำนวน {{ obj.quantity }} ชิ้น</p>
            </div>
          </div>

          <div class="cart-item-result">
            <div class="cart-item-title mt-3">รวมทุกรายการ</div>
            <div class="cart-item-price mb-1">
              ฿{{ formatCurrency(sumAllPrice) }}
            </div>
            <div style="font-size: 12px">
              ได้รับแต้ม
              <span style="color: gold"> {{ sumAllPrice / 100 }} </span>แต้ม
            </div>
          </div>
        </div>
        <div class="cart-upload">
          <!-- <p style="font-size:100px;">ยังไม่ได้ทำปุ่ม SUBMIT</p> -->
          <p class="cart-title">Upload หลักฐาน</p>
          <div class="cart-addressbox">
            <p class="cart-adbox-info">
              <b>ชื่อ-นามสกุล : </b>{{ user.user_fname }}
              {{ user.user_lname }}
            </p>
            <p class="cart-adbox-info">
              <b>เบอร์โทรศัพท์ : </b>{{ user.user_tel }}
            </p>
            <p class="cart-adbox-info">
              <b>ที่อยู่จัดส่ง : </b> {{ user.user_address }}
            </p>
          </div>
          <button
            class="button is-danger is-light my-4"
            @click="modal_act = true"
          >
            ดูตัวอย่างการ Upload ที่นี่!
          </button>
          <!-- Modal ส่งหลักฐาน -->
          <div
            class="modal"
            :class="{ 'is-active': modal_act }"
            @click="modal_act = false"
          >
            <div class="modal-background"></div>
            <div class="modal-content">
              <p class="image is-4by3">
                <img
                  src="https://media3.giphy.com/media/TFr1IjKYPZokEEhqIG/giphy.gif?cid=790b7611b869f61fbe13e2a66165e215b7d76bf0975c6399&rid=giphy.gif&ct=g"
                  alt=""
                />
              </p>
            </div>
            <button
              class="modal-close is-large"
              aria-label="close"
              @click="modal_act = false"
            ></button>
          </div>
          <!-- Modal ส่งหลักฐาน -->

          <div class="cart-upload-image">
            <input
              class="button cart-pickimg"
              style="margin: auto"
              type="file"
              id="photo"
              name="photo"
              accept="image/*"
              @change="selectImages"
            />
          </div>

          <div id="cart-show-image" class="mt-4" v-if="images">
            <img id="pic" class="cart-slip" :src="showSelectImage(images)" />
          </div>
          <div id="cart-show-image" class="mt-4" v-else>
            <img
              id="pic"
              class="cart-slip"
              src="https://cdn.discordapp.com/attachments/877785654329753660/970944245533904906/279331497_381108473938290_2580588671558885245_n.jpg"
            />
          </div>

          <div class="cart-datetime">
            <input
              class="cart-pickdate"
              type="datetime-local"
              id="datetime"
              name="datetime"
              v-model="dateTime"
            />
          </div>
          <div class="mt-3"></div>
          <p style="font-size: 10px; color: red">
            *AM คือ เที่ยงคืน - 11 โมงเช้า (12AM - 11AM)
          </p>
          <p style="font-size: 10px; color: red">
            *PM คือ เที่ยงวัน - 5 ทุ่ม (12PM - 11PM)
          </p>
          <button
            type="button"
            @click="confirmOrder()"
            class="button is-success is-light is-large my-4"
          >
            ยืนยันการชำระเงิน
          </button>
          <!-- เช็คที่อยู่ของลูกค้า เช็ครูปว่าอัพมาหรือยัง เช็คว่าใส่วันที่ลงไปหรือยัง-->
        </div>
      </div>
      <!-- End cart div-->
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";
export default {
  props: ["user"],
  data() {
    return {
      modal_act: false,
      previewImage: null,
      dateTime: "",
      images: "",
      obj: null,
      itemOrder: [],
    };
  },
  mounted() {
    this.getCartItem();
  },
  methods: {
    selectImages(event) {
      this.images = event.target.files[0];
    },
    imagePath(path) {
      if (path.substring(0, 5) != "https") {
        return "http://localhost:3000/" + path;
      } else {
        return path;
      }
    },
    showSelectImage(image) {
      // for preview only
      console.log("kuyy");
      return URL.createObjectURL(image);
    },
    confirmOrder() {
      if (confirm("ยืนยันที่จะชำระเงินใช่หรือไม่") == true) {
        let formData = new FormData();
        formData.append("user", JSON.stringify(this.user));
        formData.append("total", this.sumAllPrice);
        formData.append("obj", JSON.stringify(this.obj));
        formData.append("date", this.dateTime.substring(0, 10));
        formData.append("time", this.dateTime.substring(11, 16));
        formData.append("photo", this.images);
        console.log(this.images);

        // console.log(formData)
        if (
          this.user.user_fname === "" ||
          this.user.user_lname === "" ||
          this.user.user_tel === "" ||
          this.user.user_address === ""
        ) {
          alert("ข้อมูลการจัดส่งไม่ครบ กรุณาไปกรอกข้อมูลที่หน้า profile");
          this.$router.push("/profile");
        } else if (this.dateTime === "") {
          alert("กรุณาระบุวันเวลาการโอน");
        } else if (this.images === "") {
          alert("กรุณาใส่รูปหลักฐาน");
        } else {
          axios //post order_item
            .post("http://localhost:3000/cart/confirm/", formData)
            .then((response) => {
              console.log(response);
            })
            .catch((err) => {
              console.log(err);
            });
          for (let i = 0; i < this.obj.length; i++) {
            axios //reduce item count
              .put("http://localhost:3000/cart/reducecount/", {
                obj: this.obj[i],
              })
              .then((response) => {
                console.log(response);
              })
              .catch((err) => {
                console.log(err);
              });
          }

          let item = JSON.parse(localStorage.getItem("cart"));
          this.obj.splice(0, this.obj.length);
          item.splice(0, item.length);
          localStorage.setItem("cart", JSON.stringify(item));
          this.$router.push({ path: "/" });
          alert("ยืนยันOrderสําเร็จ");
        }
      }
    },
    getCartItem() {
      let item = JSON.parse(localStorage.getItem("cart"));
      this.obj = item;
    },
    formatCurrency(currency) {
      //format เงินให้มีลูกน้ำ
      return currency.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
    },
  },
  // created(){

  // }
  computed: {
    sumAllPrice() {
      let sumprice = 0;
      for (let i = 0; i < this.obj.length; i++) {
        sumprice += this.obj[i].price * this.obj[i].quantity;
      }
      return sumprice;
    },
  },
};
//              <!-- oninput="pic.src=window.URL.createObjectURL(this.files[0])" -->
</script>

<style scoped>
</style>
