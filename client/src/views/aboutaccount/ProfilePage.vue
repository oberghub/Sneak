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
                <!-- <div
                  class="error has-text-danger"
                  v-if="!$v.confirm_newpwd.required"
                >
                  กรุณายืนยันรหัสผ่าน
                </div>
                <div
                  class="error has-text-danger"
                  v-if="!$v.confirm_newpwd.sameAsPassword"
                >
                  รหัสผ่านไม่ตรงกัน
                </div> -->
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
                <div class="error has-text-danger" v-if="!$v.fname.required">
                  กรุณาใส่ชื่อ
                </div>
                <div class="error has-text-danger" v-if="!$v.fname.minLength">
                  ชื่อต้องมีความยาวเกิน
                  {{ $v.fname.$params.minLength.min }} ตัวอักษร.
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
                <div class="error has-text-danger" v-if="!$v.lname.required">
                  กรุณาใส่นามสกุล
                </div>
                <div class="error has-text-danger" v-if="!$v.lname.minLength">
                  นามสกุลต้องมีความยาวเกิน
                  {{ $v.lname.$params.minLength.min }} ตัวอักษร.
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
              <div class="error has-text-danger" v-if="!$v.email.required">
                กรุณากรอก Email
              </div>
              <div class="error has-text-danger" v-if="!$v.email.email">
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
                  type="text"
                  v-model="tel"
                  autocomplete="username"
                  required
                />
              </div>
              <div class="error has-text-danger" v-if="!$v.tel.required">
                กรุณากรอกเบอร์โทร
              </div>
              <div class="error has-text-danger" v-if="!$v.tel.maxLength">
                เบอร์โทรต้องมีความยาว
                {{ $v.tel.$params.maxLength.max }} ตัว.
              </div>
              <div class="error has-text-danger" v-if="!$v.tel.minLength">
                เบอร์โทรต้องมีความยาว
                {{ $v.tel.$params.minLength.min }} ตัว.
              </div>
              <div class="error has-text-danger" v-if="!$v.tel.numeric">
                เบอร์โทรต้องเป็นตัวเลขเท่านั้น
              </div>
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
                  required
                  v-model="currentPass"
                />
              </div>
            </div>
          </div>
        </form>
      </div>
      <!--End proile div-->
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
    saveInfo() {
      if (this.$v.$invalid) {
        this.submitStatus = "ERROR";
        this.complete = "Update ไม่สําเร็จ! รหัสผ่านอาจไม่ถูกต้อง";
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
          })
          .catch((err) => {
            console.log(err);
          });
        this.currentPass = "";
        this.complete = "Update สําเร็จ!";
        this.$router.go();
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
  },
  // },
};
</script>

<style scoped>
</style>