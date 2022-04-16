<template>
    <div>
      <section id="app">
        <div class="absolute-center">
          <div class="formBox">
              <div class="formInfo">
                  <p class="textform-left mb-5" style="font-size:24px;"> Sign up </p>
                    <div class="field">
                        <label class="label textform-left">Email</label>
                        <div class="control">
                            <input class="input is-small" name="email" type="email" placeholder="hello@example.com"
                                    autocomplete="username" v-model="email" required />
                        </div>
                    </div>
                    
                    <div class="field">
                        <label class="label textform-left">Password</label>
                        <div class="control">
                            <input class="input is-small" name="pwd" type="password" placeholder="**********"
                            autocomplete="password" v-model="pwd" required />
                        </div>
                    </div>
                    <div class="field">
                        <label class="label textform-left">Confirm Password</label>
                        <div class="control">
                            <input class="input is-small" name="confirmpwd" type="password" placeholder="**********"
                            autocomplete="confirmpassword" v-model="conpwd" required />
                        </div>
                    </div>
        
                    <div class="field is-grouped mt-4">
                        <div class="control">
                            <button class="button is-block is-fullwidth is-primary is-small" type="submit" @click="register">
                                Register
                            </button>
                        </div>
                        <div class="control">
                            <router-link to="/" class="button is-block is-fullwidth is-primary is-small is-link is-light">Cancel</router-link>
                        </div>
                    </div>
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
          email : "",
          pwd : "",
          conpwd : ""
      }
    },
    methods : {
        register(){
            if(this.pwd.length > 6 && this.conpwd.length > 6){
                if(this.pwd === this.conpwd){
                    axios.post("http://localhost:3000/register", {email : this.email, pwd : this.pwd})
                    .then((response) => {console.log(response)})
                    .catch((err) => {console.log(err)})
                    alert("สมัครสมาชิกสำเร็จ")
                    this.email = ""
                    this.pwd = ""
                    this.conpwd = ""
                    this.$router.push({path : '/login'})
                }
                else{
                    alert("รหัสมึงไม่ตรงนะ!")
                }
            }
            else{
                alert("รหัสต้องมากกว่า 6 ตัวนะโทดที")
            }
        }
    }
  }
</script>

<style scoped>
</style>