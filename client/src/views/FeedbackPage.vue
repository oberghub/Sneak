<template>
  <div>
    <section id="app">
      <!-- Feedback form -->
      <div class="feedback-container">
        <p class="feedback-title">ส่งความคิดเห็นให้กับเรา</p>
          <div class="field">
              <label class="label textform-left">หัวข้อ</label>
              <div class="control">
                  <input class="input is-small" type="text" v-model="title"
                          autocomplete="username" required />
              </div>
          </div>

          <div class="field">
              <label class="label textform-left">เนื้อความ</label>
              <div class="control">
                  <textarea maxlength="2000" v-model="feedback" class="textarea" style="height:500px;" placeholder="Anything what you want."></textarea>
              </div>
              <p class="feedback-counttext">{{countText}}/2000</p>
              <p style="font-size:12px; color:red;">{{errmsg}}</p>
          </div>
          <button class="button is-success is-light" @click="submitFeedback">ส่งความเห็น</button>
      </div>
      <!-- End feedback form -->

      <!--modal-->
      <div class="modal" :class="{ 'is-active' : showEditItem }" @click="showEditItem = false">
        <div class="modal-background"></div>
        <div class="modal-content">
          <section class="modal-card-body" style="width:50%; margin:auto; border-radius:1em;">
            <p style="font-size:20px; font-weight:bold; ">ขอบคุณที่ส่งความเห็นให้เราได้นำไปปรับปรุงและพัฒนา.</p>
            <p style="font-size:10px; color:green;">คลิกตรงไหนก็ได้เพื่อปิดสิ่งนี้.</p>
          </section>
        </div>
        <button class="modal-close is-large" aria-label="close"></button>
      </div>
  </section>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
    props : ['user'],
    data() {
      return {
        feedback : "",
        title: "",
        errmsg : '',
        showEditItem : false
      }
    },
    methods : {
      submitFeedback(){
        if(this.feedback.length == 0 || this.title.length == 0){
          this.errmsg = 'กรอกให้ครบนะ.'
        }
        else{
          axios.post("http://localhost:3000/feedback/sendpost", {id : this.user.user_id, title : this.title, feedback : this.feedback})
          .then(response => {console.log(response)})
          .catch(err => {console.log(err)})
          this.title = ''
          this.feedback = ''
          this.errmsg = ''
          this.showEditItem = true
        }
      }
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