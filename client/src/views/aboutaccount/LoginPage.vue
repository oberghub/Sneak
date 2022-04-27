<template>
  <div>
    <section id="app">
      <div class="absolute-center">
        <div class="formBox">
          <div class="formInfo">
            <p class="textform-left mb-5" style="font-size: 24px">Login</p>
            <div class="field">
              <label class="label textform-left">Username</label>
              <div class="control">
                <input
                  class="input is-small"
                  type="text"
                  placeholder="username"
                  v-model="username"
                  autocomplete="username"
                  required
                />
              </div>
            </div>

            <div class="field">
              <label class="label textform-left">Password</label>
              <div class="control">
                <input
                  class="input is-small"
                  type="password"
                  placeholder="**********"
                  v-model="password"
                  autocomplete="current-password"
                  required
                />
              </div>
            </div>

            <div class="field is-grouped mt-4">
              <div class="control" @click="login()">
                <button
                  class="button is-block is-fullwidth is-primary is-small"
                  type="submit"
                >
                  Login
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
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";
export default {
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    login() {
      let cart = [];
      axios
        .post("http://localhost:3000/users/login", {
          username: this.username,
          password: this.password,
        })
        .then((response) => {
          localStorage.setItem("token", response.data.token);
          localStorage.setItem("cart", JSON.stringify(cart));
          console.log(response);
          this.$emit("auth-change");
          this.$router.push({ path: "/" });
          location.reload();
        })
        .catch((err) => {
          console.log(err);
          alert("Login ไม่สําเร็จ");
        });
      this.$router.push({ name: "Home" });
    },
  },
};
</script>

<style scoped>
</style>