<template>
  <div>
    <section id="app">
      <form @submit.prevent="submit">
        <div class="absolute-center">
          <div class="formBox">
            <div class="formInfo">
              <p class="textform-left mb-5" style="font-size: 24px">Sign up</p>
              <div class="field">
                <label class="label textform-left">Username</label>
                <div
                  class="control"
                  :class="{ 'form-group--error': $v.username.$error }"
                >
                  <input
                    class="input is-small"
                    name="username"
                    type="text"
                    placeholder="username"
                    autocomplete="username"
                    v-model="username"
                    required
                  />
                </div>
                <div class="error has-text-danger" v-if="!$v.username.required">
                  กรุณาใส่ชื่อผู้ใช้
                </div>
                <div
                  class="error has-text-danger"
                  v-if="!$v.username.minLength"
                >
                  ชื่อผู้ใช้ต้องมีความยาวเกิน
                  {{ $v.username.$params.minLength.min }} ตัว.
                </div>
                <!-- <div
                  class="error has-text-danger"
                  v-if="!$v.username.sameAsUsr"
                >
                  มีคนใช้แล้ว
                </div> -->
              </div>

              <div class="field">
                <label class="label textform-left">Password</label>
                <div
                  class="control"
                  :class="{ 'form-group--error': $v.pwd.$error }"
                >
                  <input
                    class="input is-small"
                    name="pwd"
                    type="password"
                    placeholder="**********"
                    autocomplete="password"
                    v-model="pwd"
                    required
                  />
                </div>
                <div class="error has-text-danger" v-if="!$v.pwd.required">
                  กรุณาใส่รหัสผ่าน
                </div>
                <div class="error has-text-danger" v-if="!$v.pwd.minLength">
                  รหัสผ่านต้องมีความยาวเกิน
                  {{ $v.pwd.$params.minLength.min }} ตัว.
                </div>
                <div class="error has-text-danger" v-if="!$v.pwd.maxLength">
                  รหัสผ่านต้องมีความยาวไม่เกิน
                  {{ $v.pwd.$params.maxLength.max }} ตัว.
                </div>
              </div>
              <div class="field">
                <label class="label textform-left">Confirm Password</label>
                <div
                  class="control"
                  :class="{ 'form-group--error': $v.conpwd.$error }"
                >
                  <input
                    class="input is-small"
                    name="confirmpwd"
                    type="password"
                    placeholder="**********"
                    autocomplete="confirmpassword"
                    v-model="conpwd"
                    required
                  />
                </div>
                <div
                  class="error has-text-danger"
                  v-if="!$v.conpwd.sameAsPassword"
                >
                  รหัสผ่านไม่ตรงกัน
                </div>
              </div>

              <div class="field is-grouped mt-4">
                <div class="control">
                  <button
                    class="button is-block is-fullwidth is-primary is-small"
                    type="submit"
                    :disabled="submitStatus === 'PENDING'"
                    @click="register"
                  >
                    Register
                  </button>
                </div>
                <div class="control">
                  <router-link
                    to="/"
                    class="
                      button
                      is-block is-fullwidth is-primary is-small is-link is-light
                    "
                    >Cancel</router-link
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";
import {
  required,
  maxLength,
  minLength,
  sameAs,
} from "vuelidate/lib/validators";
export default {
  data() {
    return {
      username: "",
      pwd: "",
      conpwd: "",
    //   chkusr: 0
    };
  },
  methods: {
    register() {
    
      if (!this.$v.$invalid) {
          axios
            .post("http://localhost:3000/users/register", {
              username: this.username,
              pwd: this.pwd,
            })
            .then((response) => {
              console.log(response);
            })
            .catch((err) => {
              console.log(err);
            });
          alert("สมัครสมาชิกสำเร็จ");
          this.username = "";
          this.pwd = "";
          this.conpwd = "";
          this.$router.push({ path: "/login" });
      } else {
        alert("สมัครสมาชิกไม่สําเร็จ");
      }
    },
  },
  validations: {
    username: {
      required,
      minLength: minLength(5),
    //   sameAsUsr: sameAs(this.chkusr)
    },
    pwd: {
      required,
      minLength: minLength(8),
      maxLength: maxLength(25),
    },
    conpwd: {
      sameAsPassword: sameAs("pwd"),
    },
  },
};
</script>

<style scoped>
</style>