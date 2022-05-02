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
            <div class="order-box" v-for="order, index in order" :key="order.order_id" v-show="(pendingstage && order.order_status == 'pending')">
              <p style="font-weight:bold; text-align:right; margin-bottom:-1.5em;">Status : <span style="color:blue;">{{order.order_status}}</span></p>
              <p style="font-weight:bold;">User id : {{order.user_username}} (Order id : {{order.order_id}})</p>
              <p style="font-weight:bold;">Total Items : {{order.item_quantity}} Items</p>
              <p style="font-weight:bold;">Total : <span style="font-size:18px; color:#FFBF18;">฿{{order.order_total}}</span></p>
              <div class="mt-5"></div>
              <p style="font-weight:bold;">ชื่อ-นามสกุล : {{order.fullname}}</p>
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
                        <p style="font-size:12px; color:gray;">{{obj.item_size}} US {{obj.item_type}}</p>
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
                <button class="button is-success is-light mr-3" @click="changeStatusOrder('complete', order.user_id,order.order_id, index)">Confirm order</button>
                <button class="button is-danger is-light" @click="changeStatusOrder('incomplete', order.user_id,order.order_id, index)">Cancel order</button>
              </div>
            </div>
            <!-- <div class="order-box" style="text-align:center;" v-show="order.length == 0">
              <p style="font-size:24px; font-weight:bold;">ยังไม่มีสินค้าที่รอยืนยัน</p>
            </div> -->

            <!--completed order box-->
            <div class="order-box" v-for="order, index in order" :key="order.order_id" v-show="completestage && order.order_status == 'complete'">
              <p style="font-weight:bold; text-align:right; margin-bottom:-1.5em;">Status : <span style="color:lightgreen;">{{order.order_status}}</span></p>
              <p style="font-weight:bold;">User id : {{order.user_username}} (Order id : {{order.order_id}})</p>
              <p style="font-weight:bold;">Total Items : {{order.item_quantity}} Items</p>
              <p style="font-weight:bold;">Total : <span style="font-size:18px; color:#FFBF18;">฿{{order.order_total}}</span></p>
              <div class="mt-5"></div>
              <p style="font-weight:bold;">ชื่อ-นามสกุล : {{order.fullname}}</p>
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
                        <p style="font-size:12px; color:gray;">{{obj.item_size}} US {{obj.item_type}}</p>
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
              <p style="font-weight:bold;">User id : {{order.user_username}} (Order id : {{order.order_id}})</p>
              <p style="font-weight:bold;">Total Items : {{order.item_quantity}} Items</p>
              <p style="font-weight:bold;">Total : <span style="font-size:18px; color:#FFBF18;">฿{{order.order_total}}</span></p>
              <div class="mt-5"></div>
              <p style="font-weight:bold;">ชื่อ-นามสกุล : {{order.fullname}}</p>
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
                        <p style="font-size:12px; color:gray;">{{obj.item_size}} US {{obj.item_type}}</p>
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
    changeStatusOrder(status, usr_id, order_id, index){
      // console.log(status, usr_id)
      let obj = []
      if(status == 'incomplete'){
        for(let j =0; j<this.obj.length;j++){
          if(this.order[index].order_id == this.obj[j].order_id){
            obj.push(this.obj[j])
          }
        }
        console.log('obj ', obj)
        for(let i =0; i<obj.length;i++){
          console.log('kuyt')
          axios.put("http://localhost:3000/cart/rollcount/", {obj:obj[i]})
          .then((response) => {
            console.log(response);
          })
          .catch((err) => {
            console.log(err);
          });
        }
      }
      axios.put("http://localhost:3000/user/change/status/order/"+usr_id, {status : status, order_id:order_id})
      .then(response => {console.log(response)})
      .catch(err => {console.log(err)})
      location.reload()
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
</script>
