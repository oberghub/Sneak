<template>
    <div>
      <section id="app">
        <div class="absolute-center">
          <div class="formBox">
              <div class="formInfo">
                  <p class="textform-left mb-5" style="font-size:24px;"> Change your password </p>
                      <form action="/login/" enctype="multipart/form-data" method="POST">
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
                              <router-link to="/" class="button is-block is-fullwidth is-primary is-small is-link is-light">Cancel</router-link>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
        </div>
      </section>
    </div>
</template>

<script>
export default {
    data() {
      return {}
    },
    methods : {
    }
  }
</script>

<style scoped>
</style>