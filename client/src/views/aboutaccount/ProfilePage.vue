<template>
    <div>
      <section id="app">
      <!-- Start Div profile -->
      <div class="profile-main">
        <div class="profile-left-box">
          <p class="profile-title">Your Profile</p>
            <p class="profile-username">{{user.user_username}}</p>
            <p style="font-size:10px">Your point : {{user.user_point || 0}}</p>
            <button v-show="changepwd_bt" class="button is-small is-light is-warning heightCenter mt-2" @click="changepwd = true, changepwd_bt = false">
                Change your password
            </button>
            <div v-show="changepwd">
              <div class="field">
                  <label class="label textform-left">Old Password</label>
                  <div class="control">
                      <input class="input is-small" type="password" placeholder="**********"
                      autocomplete="current-password" required />
                  </div>
              </div>
                  
              <div class="field">
                  <label class="label textform-left">New Password</label>
                  <div class="control">
                      <input class="input is-small" type="password" placeholder="**********"
                      autocomplete="new-password" required />
                  </div>
              </div>

              <div class="field">
                  <label class="label textform-left">Confirm New Password</label>
                  <div class="control">
                      <input class="input is-small" type="password" placeholder="**********"
                      autocomplete="confirm-password" required />
                  </div>
              </div>

              <div class="field is-grouped mt-4">
                  <div class="control">
                      <button class="button is-block is-fullwidth is-primary is-small" type="submit">
                          Confirm
                      </button>
                  </div>
                  <div class="control">
                      <button class="button is-block is-fullwidth is-primary is-small is-link is-light" @click="changepwd_bt = true, changepwd = false">Cancel</button>
                  </div>
              </div>
            </div>
        </div>
        <div class="profile-right-box">
          <div style="profile-header">
            <p class="profile-info">Your Information</p>
            <div class="profile-saveinfo">
              <button class="button is-light is-primary heightCenter is-small" @click="saveInfo()">
                  Save Info
              </button>
              <p class="has-text-primary ml-3"> {{ complete}}</p>
            </div>
          </div>
          <div class="profile-name">
              <div class="field profile-fname">
                  <label class="label textform-left">Firstname</label>
                  <div class="control">
                      <input class="input is-small" type="email" v-model="fname "
                              autocomplete="username" required />
                  </div>
              </div>
                  
              <div class="field profile-lname">
                  <label class="label textform-left">Lastname</label>
                  <div class="control">
                      <input class="input is-small" type="text" v-model="lname "
                      autocomplete="" required />
                  </div>
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Email</label>
              <div class="control">
                  <input class="input is-small" type="email" v-model="email"
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Tel</label>
              <div class="control">
                  <input class="input is-small" type="text" v-model="tel"
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Address</label>
              <div class="control">
                  <textarea class="textarea" v-model="address" placeholder="123/4 ซอยหอม ถนนห้ามหวง เขตหวงห้าม เมืองวากานดา 69696"></textarea>
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Current password (ถ้ามีการเปลี่ยนแปลงข้อมูล)</label>
              <div class="control">
                  <input class="input is-small" type="password" placeholder="**********"
                  autocomplete="current-password" required v-model="currentPass"/>
              </div>
          </div>
        </div>
      </div>
      <!--End proile div-->


        </section>
    </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
    props: ['user'],
    data() {
      return {
        changepwd : false,
        changepwd_bt : true,
        fname: this.user.user_fname,
        lname: this.user.user_lname,
        email: this.user.user_email,
        tel: this.user.user_tel,
        address: this.user.user_address,
        currentPass: '',
        complete: ''
      }
    },
    methods : {
        saveInfo(){
            axios.put('http://localhost:3000/users/saveinfo/'+this.user.user_id, {fname:this.fname, lname: this.lname, email: this.email, tel: this.tel, address: this.address, password: this.currentPass})
            .then((response) => {
                console.log(response.data)
            })
            .catch((err) => {
                console.log(err);
            });
            this.currentPass = ''
            this.complete = 'Update success!'
        }
        
    }
  }
</script>

<style scoped>
</style>