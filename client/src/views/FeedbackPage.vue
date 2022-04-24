<template>
  <div>
    <section id="app">
      <!-- Feedback form -->
      <div class="feedback-container">
        <p class="feedback-title">Send your feedback</p>
          <div class="field">
              <label class="label textform-left">Title</label>
              <div class="control">
                  <input class="input is-small" type="text" value=""
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">Report</label>
              <div class="control">
                  <textarea maxlength="2000" v-model="feedback" class="textarea" style="height:500px;" placeholder="Anything what you want."></textarea>
              </div>
              <p class="feedback-counttext">{{countText}}/2000</p>
          </div>

      </div>
      <!-- End feedback form -->
  </section>
  </div>
</template>

<script>
// import axios from '@/plugins/axios'
export default {
    data() {
      return {
        feedback : "",
      }
    },
    methods : {
    },
    computed : {
      countText(){
        return this.feedback.length
      }
    }
  }
</script>

<style scoped>
</style>