<template>
  <div>
    <section id="app">
      <!-- Start Div profile -->
      <div class="profile-main">
        <form class="profile-left-box">
          <div>
            <p class="profile-title">ข้อมูลผู้ใช้</p>
            <p class="profile-username">{{ user.user_username }}</p>
            <p style="font-size: 10px">
              แต้มของคุณมี : {{ user.user_point || 0 }}
            </p>
            <button
              type="submit"
              v-show="changepwd_bt"
              class="button is-small is-light is-warning heightCenter mt-2"
              @click="changepwd = true, changepwd_bt = false">
              เปลี่ยนรหัสผ่าน
            </button>
            <div v-show="changepwd">
              <div class="field">
                <label class="label textform-left">รหัสผ่านเดิม</label>
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
                <label class="label textform-left">รหัสผ่านใหม่</label>
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
                <label class="label textform-left">ยืนยันรหัสผ่านใหม่</label>
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
                    ยืนยัน
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
                    ยกเลิก
                  </button>
                </div>
              </div>
            </div>
          </div>
        </form>
        <form @submit.prevent="submit">
          <div class="profile-right-box">
            <div style="profile-header">
              <p class="profile-info">ข้อมูลส่วนตัวของคุณ</p>
              <div class="profile-saveinfo">
                <button
                  type="submit"
                  :disabled="submitStatus === 'PENDING'"
                  class="button is-light is-primary heightCenter is-small"
                  @click="saveInfo()"
                >
                  บันทึกข้อมูล
                </button>
                <button @click="showEditItem = true" class="button is-light is-warning heightCenter is-small ml-4">
                  ประวัติการสั่งซื้อทั้งหมด
                </button>
                <p class="ml-3" style="font-size: 12px" :style="{color : complete == 'Reject' ? 'red' : 'lightgreen'}">
                  {{ complete == 'Reject' ? 'อัปเดตไม่สำเร็จ ข้อมูลบางอย่างอาจไม่ถูกต้อง' : complete == 'Complete' ? 'อัปเดตสำเร็จ!' : '' }}
                </p>
              </div>
            </div>
            <div class="profile-name">
              <div class="field profile-fname">
                <label class="label textform-left">ชื่อจริง</label>
                <div
                  class="control"
                  :class="{ 'form-group--error': $v.fname.$error }"
                >
                  <input
                    class="input is-small"
                    type="text"
                    v-model="fname"
                    autocomplete="username"

                  />
                </div>
                <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.fname.required">
                  กรุณาใส่ชื่อ
                </div>
              </div>

              <div class="field profile-lname">
                <label class="label textform-left">นามสกุล</label>
                <div
                  class="control"
                  :class="{ 'form-group--error': $v.lname.$error }"
                >
                  <input
                    class="input is-small"
                    type="text"
                    v-model="lname"
                    autocomplete=""
                  />
                </div>
                <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.lname.required">
                  กรุณาใส่นามสกุล
                </div>
              </div>
            </div>

            <div class="field">
              <label class="label textform-left">อีเมล</label>
              <div
                class="control"
                :class="{ 'form-group--error': $v.email.$error }"
              >
                <input
                  class="input is-small"
                  type="email"
                  v-model="email"
                  autocomplete="username"
                />
              </div>
              <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.email.required">
                กรุณากรอกอีเมล
              </div>
              <div style="text-align:left; font-size:12px;" class="error has-text-danger" v-if="!$v.email.email">
                ไม่ใช่อีเมลนีหน่าาา กรุณากรอกใหม่
              </div>
            </div>

            <div class="field">
              <label class="label textform-left">เบอร์โทรศัพท์</label>
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
              <label class="label textform-left">ที่อยู่จัดส่ง</label>
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
                >รหัสผ่านปัจจุบัน (ถ้ามีการเปลี่ยนแปลงข้อมูล)</label
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
                <!-- Content ... -->
                <p style="font-size:24px; font-weight:bold; text-align:center; margin-bottom:1.5em;">ประวัติการสั่งซื้อทั้งหมด</p>
              <div style="font-size:32px; font-weight:500;" class="mb-4" v-show="obj.length == 0">คุณยังไม่เคยสั่งซื้ออะไรเลย T_T.</div>
              
              <div class="profile-purhis my-3" v-for="order in order" :key="order.id">
                <div style="width:100%; height:auto; background-color:white; padding:1em; display:flex; border-radius:0.5em; margin-bottom:0.5em;">
                  <div class="modal-bottom-l" style="margin-top:0;">
                    <div style="font-size:16px; font-weight:bold; text-align:left;">รหัสคำสั่งซื้อ : {{order.order_id}}</div>
                  </div>
                <div class="modal-bottom-r" style="margin-top:0;">
                    <div style="font-size:16px; font-weight:bold; align-items:flex-end;">สถานะ : <span  :style="{color : order.order_status == 'complete' ? 'lightgreen' : order.order_status == 'pending' ? 'blue' : 'red'}">{{order.order_status == 'pending' ? 'รอดำเนินการ' : order.order_status == 'complete' ? 'สำเร็จ' : 'ยกเลิก'}}</span></div>
                  </div>
                </div>
                <div class="modal-cart-item" v-for="obj in obj" :key="obj.id" v-show="obj.order_id == order.order_id">
                  <div class="modal-cart-item-image">
                    <img class="modal-cart-image" :src="imagePath(obj.item_img)">
                  </div>
                    <div class="modal-cart-item-info">
                      <p class="modal-cart-item-title-c">{{obj.item_name}}</p>
                      <p class="modal-cart-item-price-c">฿{{formatCurrency(obj.item_price * obj.item_quantity)}}</p>
                      <p style="font-size:12px; color:gray;">{{obj.item_size}} US {{obj.item_type}}</p>
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
    imagePath(path){
      if (path.substring(0, 5) != 'https') {
        return "http://localhost:3000/" + path;
      } else {
        return path;
      }
    },
    saveInfo() {
      if (this.$v.$invalid) {
        this.submitStatus = "ERROR";
        this.complete = "Reject";
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
            this.complete = "Success";
            location.reload()
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