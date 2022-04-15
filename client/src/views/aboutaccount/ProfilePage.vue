<template>
    <div>
      <section id="app">
      <!-- Start Div profile -->
      <div class="profile-main">
        <div class="profile-left-box">
          <p class="profile-title">Your Profile</p>
            <div>
                <img class="img-profile mt-3" src="https://cdn.discordapp.com/attachments/774659091745734659/963110934308593815/244753413_134410555607297_7985134242756502927_n.jpg">
            </div>
            <p class="profile-username">user001</p>
            <p style="font-size:10px">Your point : 131</p>
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
              <button class="button is-light is-primary heightCenter is-small">
                  Save Info
              </button>
            </div>
          </div>
          <div class="profile-name">
              <div class="field profile-fname">
                  <label class="label textform-left">Firstname</label>
                  <div class="control">
                      <input class="input is-small" type="email" value=""
                              autocomplete="username" required />
                  </div>
              </div>
                  
              <div class="field profile-lname">
                  <label class="label textform-left">Lastname</label>
                  <div class="control">
                      <input class="input is-small" type="text" value=""
                      autocomplete="" required />
                  </div>
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Email</label>
              <div class="control">
                  <input class="input is-small" type="email" value="hello@example.com"
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Tel</label>
              <div class="control">
                  <input class="input is-small" type="text"
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Address</label>
              <div class="control">
                  <textarea class="textarea" placeholder="123/4 ซอยหอม ถนนห้ามหวง เขตหวงห้าม เมืองวากานดา 69696"></textarea>
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Current password (ถ้ามีการเปลี่ยนแปลงข้อมูล)</label>
              <div class="control">
                  <input class="input is-small" type="password" placeholder="**********"
                  autocomplete="current-password" required />
              </div>
          </div>
        </div>
      </div>
      <!--End proile div-->


        </section>
    </div>
</template>

<script>
export default {
    data() {
      return {
        changepwd : false,
        changepwd_bt : true
      }
    },
    methods : {
    }
  }
</script>

<style scoped>
</style>