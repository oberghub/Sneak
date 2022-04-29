<template>
  <div>
    <section id="app">
      <!-- Start Div profile -->
      <div class="profile-main">
        <form class="profile-left-box">
          <div>
            <p class="profile-title">Your Profile</p>
            <p class="profile-username">{{ user.user_username }}</p>
            <p style="font-size: 10px">
              Your point : {{ user.user_point || 0 }}
            </p>
            <button
              type="submit"
              v-show="changepwd_bt"
              class="button is-small is-light is-warning heightCenter mt-2"
              @click="(changepwd = true), (changepwd_bt = false)"
            >
              Change your password
            </button>
            <div v-show="changepwd">
              <div class="field">
                <label class="label textform-left">Old Password</label>
                <div class="control">
                  <input
                    class="input is-small"
                    type="password"
                    placeholder="**********"
                    autocomplete="current-password"
                    v-model="oldpwd"
                    required
                  />
                </div>
              </div>

              <div class="field">
                <label class="label textform-left">New Password</label>
                <div class="control">
                  <input
                    class="input is-small"
                    type="password"
                    placeholder="**********"
                    autocomplete="new-password"
                    v-model="newpwd"
                    required
                  />
                </div>
                <p style="font-size: 10px; color: red; text-align: left">
                  {{ errmsg_cpwd }}
                </p>
              </div>

              <div class="field">
                <label class="label textform-left">Confirm New Password</label>
                <div class="control">
                  <input
                    class="input is-small"
                    type="password"
                    placeholder="**********"
                    autocomplete="confirm-password"
                    v-model="confirm_newpwd"
                    required
                  />
                </div>
                <p style="font-size: 10px; color: red; text-align: left">
                  {{ errmsg_cpwd }}
                </p>
              </div>

              <div class="field is-grouped mt-4">
                <div class="control">
                  <button
                    class="button is-block is-fullwidth is-primary is-small"
                    type="submit"
                    @click="changePwd()"
                  >
                    Confirm
                  </button>
                </div>
                <div class="control">
                  <button
                    class="
                      button
                      is-block is-fullwidth is-primary is-small is-link is-light
                    "
                    @click="(changepwd_bt = true), (changepwd = false)"
                  >
                    Cancel
                  </button>
                </div>
              </div>
            </div>
          </div>
        </form>
        <form @submit.prevent="submit">
          <div class="profile-right-box">
            <div style="profile-header">
              <p class="profile-info">Your Information</p>
              <div class="profile-saveinfo">
                <button
                  type="submit"
                  :disabled="submitStatus === 'PENDING'"
                  class="button is-light is-primary heightCenter is-small"
                  @click="saveInfo()"
                >
                  Save Info
                </button>
                <button @click="showEditItem = true" class="button is-light is-warning heightCenter is-small ml-4">
                  Purchase History
                </button>
                <p class="has-text-primary ml-3" style="font-size: 12px">
                  {{ complete }}
                </p>
              </div>
            </div>
            <div class="profile-name">
              <div class="field profile-fname">
                <label class="label textform-left">Firstname</label>
                <div
                  class="control"
                  :class="{ 'form-group--error': $v.fname.$error }"
                >
                  <input
                    class="input is-small"
                    type="text"
                    v-model="fname"
                    autocomplete="username"
                    required
                  />
                </div>
                <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.fname.required">
                  กรุณาใส่ชื่อ
                </div>
              </div>

              <div class="field profile-lname">
                <label class="label textform-left">Lastname</label>
                <div
                  class="control"
                  :class="{ 'form-group--error': $v.lname.$error }"
                >
                  <input
                    class="input is-small"
                    type="text"
                    v-model="lname"
                    autocomplete=""
                    required
                  />
                </div>
                <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.lname.required">
                  กรุณาใส่นามสกุล
                </div>
              </div>
            </div>

            <div class="field">
              <label class="label textform-left">Email</label>
              <div
                class="control"
                :class="{ 'form-group--error': $v.email.$error }"
              >
                <input
                  class="input is-small"
                  type="email"
                  v-model="email"
                  autocomplete="username"
                  required
                />
              </div>
              <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.email.required">
                กรุณากรอก Email
              </div>
              <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.email.email">
                ไม่ใช่ Email กรุณากรอกใหม่
              </div>
            </div>

            <div class="field">
              <label class="label textform-left">Tel</label>
              <div
                class="control"
                :class="{ 'form-group--error': $v.tel.$error }"
              >
                <input
                  class="input is-small"
                  type="number"
                  v-model="tel"
                  :maxlength="10"
                  autocomplete="username"
                  required
                />
              </div>
              <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.tel.required">
                กรุณากรอกเบอร์โทร
              </div>
              <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.tel.maxLength">
                เบอร์โทรต้องมีความยาว
                {{ $v.tel.$params.maxLength.max }} ตัว.
              </div>
              <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.tel.minLength">
                เบอร์โทรต้องมีความยาว
                {{ $v.tel.$params.minLength.min }} ตัว.
              </div>
              <!-- <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.tel.numeric">
                เบอร์โทรต้องเป็นตัวเลขเท่านั้น
              </div> -->
            </div>

            <div class="field">
              <label class="label textform-left">Address</label>
              <div class="control">
                <textarea
                  class="textarea"
                  v-model="address"
                  placeholder="123/4 ซอยหอม ถนนห้ามหวง เขตหวงห้าม เมืองวากานดา 69696"
                ></textarea>
              </div>
            </div>

            <div class="field">
              <label class="label textform-left"
                >Current password (ถ้ามีการเปลี่ยนแปลงข้อมูล)</label
              >
              <div class="control">
                <input
                  class="input is-small"
                  type="password"
                  placeholder="**********"
                  autocomplete="current-password"
                  v-model="currentPass"
                />
              </div>
            </div>
          </div>
        </form>
      </div>
      <!--End proile div-->

      <!-- modal history -->
      <div class="modal" :class="{ 'is-active' : showEditItem }">
        <div class="modal-background"></div>
          <div class="modal-content">
            <div class="modal-bg-custom">
              <div class="modal-card-head">
                <p class="modal-card-title">Purchase History</p>
              </div>
                <!-- Content ... -->
              <div style="font-size:32px; font-weight:500;" class="mb-4" v-show="obj.length == 0">You are haven't purchase yet.</div>
              <div class="profile-purhis my-3" v-for="order in order" :key="order.id">
                <div class="modal-cart-item" v-for="obj in obj" :key="obj.id">
                  <div class="modal-cart-item-image" v-show="obj.order_id == order.order_id">
                    <img class="modal-cart-image" :src="obj.item_img">
                  </div>
                    <div class="modal-cart-item-info" v-show="obj.order_id == order.order_id">
                      <p class="modal-cart-item-title-c">{{obj.item_name}}</p>
                      <p class="modal-cart-item-price-c">฿{{formatCurrency(obj.item_price * obj.item_quantity)}}</p>
                      <p style="font-size:12px; color:gray;" class="mt-1">{{obj.size}}</p>
                      <div style="display:flex;">
                        <p style="font-size:12px; text-align:left; color:black; margin-top:auto; margin-bottom:auto;">จำนวน {{obj.item_quantity}} ชิ้น</p>
                      </div>
                  </div>
              </div>
              <div style="width:100%; height:auto; background-color:white; padding:1em; display:flex; border-radius:0.5em;">
                <div class="modal-bottom-l" style="margin-top:0;">
                  <div style="font-size:16px; font-weight:bold; text-align:left;">รวมทั้งหมด</div>
                </div>
               <div class="modal-bottom-r" style="margin-top:0;">
                  <div style="font-size:16px; font-weight:bold; align-items:flex-end;">฿{{order.order_total}}</div>
                </div>
              </div>

              </div>
              <!-- <div class="modal-bottom">
                <div class="modal-bottom-l" v-show="obj.length !== 0">
                  <button class="button is-success is-light" @click="showEditItem = false, $router.push('/cart')">
                    Go to cart
                  </button>
                  <button class="button is-danger is-light ml-5" @click="clearCart()">
                    Clear
                  </button>
                </div>
                <div class="modal-bottom-r">
                  <p style="font-weight:bold;">Total ฿{{formatCurrency(sumAllPrice)}}</p>  
                </div>
              </div> -->
            </div>
          </div>
        <button class="modal-close is-large" aria-label="close" @click="showEditItem = false"></button>
      </div>
      <!--end modal-->
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";
import {
  required,
  maxLength,
  minLength,
  email,
  numeric,
} from "vuelidate/lib/validators";
export default {
  props: ["user"],
  data() {
    return {
      showEditItem : false,
      order : [],
      obj : [],
      changepwd: false,
      changepwd_bt: true,
      fname: this.user.user_fname,
      lname: this.user.user_lname,
      email: this.user.user_email,
      tel: this.user.user_tel,
      address: this.user.user_address,
      currentPass: "",
      complete: "",
      oldpwd: "",
      newpwd: "",
      confirm_newpwd: "",
      errmsg_cpwd: "",
      submitStatus: null,
    };
  },
  validations: {
    fname: {
      required,
      minLength: minLength(4),
    },
    lname: {
      required,
      minLength: minLength(4),
    },
    email: {
      required,
      email,
    },
    tel: {
      required,
      minLength: minLength(10),
      maxLength: maxLength(10),
      numeric,
    },
    // confirm_newpwd: {
    //   required,
    //   sameAsPassword: sameAs("newpwd"),
    // },
  },
  mounted () {
    this.getHistory()
  },
  methods: {
    submit() {
      console.log("submit!");
      this.$v.$touch();
      if (this.$v.$invalid) {
        this.submitStatus = "ERROR";
      } else {
        // do your submit logic here
        this.submitStatus = "PENDING";
        setTimeout(() => {
          this.submitStatus = "OK";
        }, 500);
      }
    },
    formatCurrency(currency){ //format เงินให้มีลูกน้ำ
      return ((currency).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))
    },
    // checklentel(){
    //   if(this.tel.length > 10){

    //   }
    // },
    saveInfo() {
      if (this.$v.$invalid) {
        this.submitStatus = "ERROR";
        this.complete = "Update ไม่สําเร็จ! ข้อมูลบางอย่างไม่ถูกต้อง";
      } else {
        axios
          .put("http://localhost:3000/users/saveinfo/" + this.user.user_id, {
            fname: this.fname,
            lname: this.lname,
            email: this.email,
            tel: this.tel,
            address: this.address,
            password: this.currentPass,
          })
          .then((response) => {
            console.log(response.data);
            this.complete = "Update สําเร็จ!";
          })
          .catch((err) => {
            console.log(err);
            alert("รหัสไม่ถูกต้อง");
          });
        this.complete = "";
        this.currentPass = "";
        // this.$router.go();
      }
    },
    changePwd() {
      // if (this.$v.$invalid) {
      //   this.submitStatus = "ERROR";
      //   alert("เปลี่ยนรหัสไม่สําเร็จ")
      // } else {
      if (
        this.newpwd !== this.confirm_newpwd ||
        this.newpwd.length == 0 ||
        this.confirm_newpwd.length == 0
      ) {
        this.errmsg_cpwd = "รหัสผ่านไม่ตรงกัน";
      } else {
        axios
          .put("http://localhost:3000/users/changepwd/" + this.user.user_id, {
            oldpwd: this.oldpwd,
            newpwd: this.newpwd,
          })
          .then((response) => {
            console.log(response);
          })
          .catch((err) => {
            console.log(err);
            alert("เปลี่ยนรหัสไม่สําเร็จ");
          });
        this.oldpwd = "";
        this.newpwd = "";
        this.confirm_newpwd = "";
      }
    },
    getHistory(){
      axios.get("http://localhost:3000/users/purchase/"+this.user.user_id)
      .then((response) => {
        this.obj = response.data.order
        this.order = response.data.orderBig
        console.log("order",response.data.order)
      })
      .catch((err) => {console.log(err)})
    }
  },
};
</script>

<style scoped>
</style>