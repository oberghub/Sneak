<template>
  <div>
    <section id="app">
        <div class="manage-bar">
          <div class="sub-box-manage" @click="feedstage = false, pendingstage = true, historystage = false, completestage= false">
            <div class="text-manage-bar">Pending Order</div>
          </div> 
          <div class="sub-box-manage" @click="completestage=true, feedstage = false, pendingstage = false, historystage = false">
            <div class="text-manage-bar">Completed Order</div>
          </div>
          <div class="sub-box-manage" @click="completestage=false, feedstage = false, pendingstage = false, historystage = true">
            <div class="text-manage-bar">Check order history</div>
          </div>
          <div class="sub-box-manage" @click="feedstage = true, pendingstage = false, historystage = false, completestage=false">
            <div class="text-manage-bar">Feedback from user</div>
          </div>
        </div>

        <div class="list-item-box">
            <!--Feedback box-->
            <div class="feed-box" v-for="feed in feed" :key="feed.req_id" v-show="feedstage">
              <div class="feed-text-title">
                Title : {{feed.req_title}}
              </div>
              <div class="feed-text-p">
                Detail : {{feed.req_detail}}
              </div>
              <div class="feed-text-p mt-4" style="font-size:14px; font-weight:bold;">
                Comment by : {{feed.user_username}}
              </div>
            </div>
            <!--Feedback box-->

            <!--pending order box-->
            <div class="order-box" v-for="order, index in order" :key="order.order_id" v-show="pendingstage && order.order_status == 'pending'">
              <p style="font-weight:bold; text-align:right; margin-bottom:-1.5em;">Status : <span style="color:blue;">{{order.order_status}}</span></p>
              <p style="font-weight:bold;">User id : {{order.user_username}}</p>
              <p style="font-weight:bold;">Total Items : {{order.item_quantity}} Items</p>
              <p style="font-weight:bold;">Total : <span style="font-size:18px; color:#FFBF18;">฿{{order.order_total}}</span></p>
              <div class="mt-5"></div>
              <p style="font-weight:bold;">ชื่อ-นามสกุล : {{order.user_fname+" "+order.user_lname}}</p>
              <p style="font-weight:bold;">เบอร์โทร : {{order.user_tel}}</p>
              <p style="font-weight:bold;">ที่อยู่ : {{order.user_address}}</p>
              <div class="mt-5"></div>
              <!--Item list-->
              <div v-for="obj in obj" :key="obj.order_id">
                <div class="profile-purhis my-3" v-show="obj.order_id == order.order_id">
                  <div class="modal-cart-item">
                    <div class="modal-cart-item-image">
                      <img class="modal-cart-image" :src="obj.item_img">
                    </div>
                      <div class="modal-cart-item-info">
                        <p class="modal-cart-item-title-c">{{obj.item_name}}</p>
                        <p class="modal-cart-item-price-c">฿{{formatCurrency(obj.item_price * obj.item_quantity)}}</p>
                        <p style="font-size:12px; color:gray;" class="mt-1">{{obj.size}}</p>
                        <div style="display:flex;">
                          <p style="font-size:12px; text-align:left; color:black; margin-top:auto; margin-bottom:auto;">จำนวน {{obj.item_quantity}} ชิ้น</p>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--Item list-->
              <!--pending order box-->

              <!-- Modal หลักฐานการโอน -->
              <div class="modal" :class="{ 'is-active' : modal_act }" @click="modal_act = false">
                <div class="modal-background"></div>
                <div class="modal-content">
                  <p class="image">
                    <img :src="modalind">
                  </p>
                </div>
                <button class="modal-close is-large" aria-label="close" @click="modal_act = false"></button>
              </div>
              <!-- Modal หลักฐานการโอน -->

              <div class="mt-5"></div>
              <div style="display:flex;">
                <button class="button is-warning is-light mr-3" @click="modal_act = true, getpayImg(index)">See a payment</button>
                <button class="button is-success is-light mr-3">Confirm order</button>
                <button class="button is-danger is-light">Cancel order</button>
              </div>
            </div>




            <!--completed order box-->
            <div class="order-box" v-for="order, index in order" :key="order.order_id" v-show="completestage && order.order_status == 'complete'">
              <p style="font-weight:bold; text-align:right; margin-bottom:-1.5em;">Status : <span style="color:lightgreen;">{{order.order_status}}</span></p>
              <p style="font-weight:bold;">User id : {{order.user_username}}</p>
              <p style="font-weight:bold;">Total Items : {{order.item_quantity}} Items</p>
              <p style="font-weight:bold;">Total : <span style="font-size:18px; color:#FFBF18;">฿{{order.order_total}}</span></p>
              <div class="mt-5"></div>
              <p style="font-weight:bold;">ชื่อ-นามสกุล : {{order.user_fname+" "+order.user_lname}}</p>
              <p style="font-weight:bold;">เบอร์โทร : {{order.user_tel}}</p>
              <p style="font-weight:bold;">ที่อยู่ : {{order.user_address}}</p>
              <div class="mt-5"></div>
              <!--Item list-->
              <div v-for="obj in obj" :key="obj.order_id">
                <div class="profile-purhis my-3" v-show="obj.order_id == order.order_id">
                  <div class="modal-cart-item">
                    <div class="modal-cart-item-image">
                      <img class="modal-cart-image" :src="obj.item_img">
                    </div>
                      <div class="modal-cart-item-info">
                        <p class="modal-cart-item-title-c">{{obj.item_name}}</p>
                        <p class="modal-cart-item-price-c">฿{{formatCurrency(obj.item_price * obj.item_quantity)}}</p>
                        <p style="font-size:12px; color:gray;" class="mt-1">{{obj.size}}</p>
                        <div style="display:flex;">
                          <p style="font-size:12px; text-align:left; color:black; margin-top:auto; margin-bottom:auto;">จำนวน {{obj.item_quantity}} ชิ้น</p>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--Item list-->
              <!--completed order box-->

              <!-- Modal หลักฐานการโอน -->
              <div class="modal" :class="{ 'is-active' : modal_act }" @click="modal_act = false">
                <div class="modal-background"></div>
                <div class="modal-content">
                  <p class="image">
                    <img :src="modalind">
                  </p>
                </div>
                <button class="modal-close is-large" aria-label="close" @click="modal_act = false"></button>
              </div>
              <!-- Modal หลักฐานการโอน -->

              <div class="mt-5"></div>
              <div style="display:flex;">
                <button class="button is-warning is-light mr-3" @click="modal_act = true, getpayImg(index)">See a payment</button>
              </div>
            </div>


            <!--all order history box-->
            <div class="order-box" v-for="order, index in order" :key="order.order_id" v-show="historystage">
              <p style="font-weight:bold; text-align:right; margin-bottom:-1.5em;">Status : <span :style="{color:order.order_status == 'pending' ? 'blue' : order.order_status == 'complete' ? 'lightgreen' : 'red'}">{{order.order_status}}</span></p>
              <p style="font-weight:bold;">User id : {{order.user_username}}</p>
              <p style="font-weight:bold;">Total Items : {{order.item_quantity}} Items</p>
              <p style="font-weight:bold;">Total : <span style="font-size:18px; color:#FFBF18;">฿{{order.order_total}}</span></p>
              <div class="mt-5"></div>
              <p style="font-weight:bold;">ชื่อ-นามสกุล : {{order.user_fname+" "+order.user_lname}}</p>
              <p style="font-weight:bold;">เบอร์โทร : {{order.user_tel}}</p>
              <p style="font-weight:bold;">ที่อยู่ : {{order.user_address}}</p>
              <div class="mt-5"></div>
              <!--Item list-->
              <div v-for="obj in obj" :key="obj.order_id">
                <div class="profile-purhis my-3" v-show="obj.order_id == order.order_id">
                  <div class="modal-cart-item">
                    <div class="modal-cart-item-image">
                      <img class="modal-cart-image" :src="obj.item_img">
                    </div>
                      <div class="modal-cart-item-info">
                        <p class="modal-cart-item-title-c">{{obj.item_name}}</p>
                        <p class="modal-cart-item-price-c">฿{{formatCurrency(obj.item_price * obj.item_quantity)}}</p>
                        <p style="font-size:12px; color:gray;" class="mt-1">{{obj.size}}</p>
                        <div style="display:flex;">
                          <p style="font-size:12px; text-align:left; color:black; margin-top:auto; margin-bottom:auto;">จำนวน {{obj.item_quantity}} ชิ้น</p>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--Item list-->
              <!--all order history box-->

              <!-- Modal หลักฐานการโอน -->
              <div class="modal" :class="{ 'is-active' : modal_act }" @click="modal_act = false">
                <div class="modal-background"></div>
                <div class="modal-content">
                  <p class="image">
                    <img :src="modalind">
                  </p>
                </div>
                <button class="modal-close is-large" aria-label="close" @click="modal_act = false"></button>
              </div>
              <!-- Modal หลักฐานการโอน -->

              <div class="mt-5"></div>
              <div style="display:flex;">
                <button class="button is-warning is-light mr-3" @click="modal_act = true, getpayImg(index)">See a payment</button>
              </div>
            </div>
        </div>
  </section>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  name: 'App',
  components: {
  },
  data () {
    return {
      user : null,
      modalind : null,
      modal_act : false,
      counter : 0,
      order : [],
      obj : [],
      feed : [],
      feedstage : false,
      pendingstage : true,
      historystage : false,
      completestage : false,
    }
  },
  mounted () {
    this.getFeed()
  },
  methods : {
    getpayImg(index){
      this.modalind = this.order[index].pay_image
    },
    getFeed(){
      axios.get("http://localhost:3000/feedback")
      .then((response) => {
        this.feed = response.data.feedback
      }) 
      .catch(err => {console.log(err)})
    },
    formatCurrency(currency){ //format เงินให้มีลูกน้ำ
      return ((currency).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))
    },
  },
    created() {
    axios
      .get("http://localhost:3000/user/order", {})
      .then((response) => {
        this.order = response.data.orderBig;
        this.obj = response.data.order;
        console.log("data = ", response.data);
      })
      .catch((err) => {
        console.log(err, "WTF");
      });
  },
}
// {id: 1, username : 'user_t1', status: 'Pending', quantity : 1, total : 10000, fullname : 'ปูนพร้อมก่อ สุดหล่อพร้อมยัง', tel : '0983211445', address : '123/4 ซอยตัน', pay : 'https://scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=ae9488&_nc_ohc=1wxSkCqmlJkAX-MhZLT&tn=WcwTTfOD8BqN81e6&_nc_ht=scontent.fbkk22-3.fna&oh=03_AVJ21oPQMGj4raP1B8FIgJgRoY8GImnQ3fxRo-Fj90Ao2Q&oe=628F9731'},
//               {id: 2, username : 'user_t2', status: 'Pending',quantity : 2, total : 9000, fullname : 'อยากเป็นหวานใจ ทำไมเธอเมิน', tel : '0613325445', address : '1213/4 ซอยหอม', pay : 'https://scontent.fbkk22-2.fna.fbcdn.net/v/t1.15752-9/278912626_709551823725321_2070053246784373022_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=ae9488&_nc_ohc=hsg7HTwsmYMAX8ya6CB&_nc_ht=scontent.fbkk22-2.fna&oh=03_AVLw1ZiVz6XW_pQYkbARadPx3qGBLMcXzy4XqWHfYu_40Q&oe=62919192'},
//               {id: 3, username : 'user_t2', status: 'Complete', quantity : 2, total : 9000, fullname : 'อยากเป็นหวานใจ ทำไมเธอเมิน', tel : '0613325445', address : '1213/4 ซอยหอม', pay : 'https://scontent.fbkk22-2.fna.fbcdn.net/v/t1.15752-9/278912626_709551823725321_2070053246784373022_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=ae9488&_nc_ohc=hsg7HTwsmYMAX8ya6CB&_nc_ht=scontent.fbkk22-2.fna&oh=03_AVLw1ZiVz6XW_pQYkbARadPx3qGBLMcXzy4XqWHfYu_40Q&oe=62919192'},
//               {id: 4, username : 'user_t2', status: 'Cancel', quantity : 2, total : 9000, fullname : 'อยากเป็นหวานใจ ทำไมเธอเมิน', tel : '0613325445', address : '1213/4 ซอยหอม', pay : 'https://scontent.fbkk22-2.fna.fbcdn.net/v/t1.15752-9/278912626_709551823725321_2070053246784373022_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=ae9488&_nc_ohc=hsg7HTwsmYMAX8ya6CB&_nc_ht=scontent.fbkk22-2.fna&oh=03_AVLw1ZiVz6XW_pQYkbARadPx3qGBLMcXzy4XqWHfYu_40Q&oe=62919192'}],
//       obj : [{name : 'Nike Air force 1', price : 3500, quantity : 1, image : '', size : '10 US Men', o_id : 1},
//       {name : 'Nike Air force 2', price : 5500, quantity : 1, image : '', size : '11 US Men', o_id : 2},
//       {name : 'Nike Air force 1', price : 3500, quantity : 1, image : '', size : '10 Us Men', o_id : 2},
//       {name : 'Nike Air force 1', price : 3500, quantity : 1, image : '', size : '10 Us Men', o_id : 3},
//       {name : 'Nike Air force 1', price : 3500, quantity : 1, image : '', size : '10 Us Men', o_id : 4}],
</script>
