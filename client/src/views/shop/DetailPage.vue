<template>
  <div>
    <section id="app">
      <!-- Start Detail div-->
      <div class="detail-box">
        <div class="detail-image">
          <img class="detail-image-size" :src="items.item_img" />
        </div>
        <div class="detail-info">
          <div class="detail-title">{{ items.item_name }}</div>
          <div class="detail-price">
            ฿ {{ formatCurrency(items.item_price) }}
          </div>
          <div class="detail-quantity">
            <p style="font-size:20px; color:red; text-align:left;" v-show="items.item_remain == 0">สินค้าหมด</p>
            <div style="display: flex" v-show="items.item_remain != 0">
              <a class="button" @click="checkZero">-</a>
              <a
                style="margin-top: auto; margin-bottom: auto; color: gray"
                class="mx-5"
                >{{ counter }}</a
              >
              <a class="button" @click="checkLimit">+</a>
            </div>
            <p v-if="size_remain === 'Choose Size' && items.item_remain != 0" class="item-remain">มีสินค้าทั้งหมด {{ items.item_remain }} ชิ้น</p>
            <p v-else-if="size_remain !== 'Choose Size' && items.item_remain != 0" class="item-remain">สินค้าคงเหลือ {{ size_remain.substr(-1) }} ชิ้น</p>
          </div>
          <div class="detail-option" v-show="items.item_remain != 0">
            <div class="select is-normal" v-if="items.item_type == 'kid'">
              <select v-model="size_remain">
                <option disabled>Choose Size</option>
                <option v-for="size in size" :key="size.size_id" :value="size.size + size.size_remain" :disabled="size.size_remain == 0" :style= "[size.size_remain == 0 ? {color : '#E1E1E1'} : {color : 'black'}]">US {{size.size}} Y</option>
              </select>
              <p style="color:red; font-size:12px;">{{al_msg}}</p>
            </div>
            <div class="select is-normal" v-else>
              <select v-model="size_remain" @change="counter=1">
                <option disabled>Choose Size</option>
                <option v-for="size in size" :key="size.size_id" :value="size.size + size.size_remain" :disabled="size.size_remain == 0" :style= "[size.size_remain == 0 ? {color : '#E1E1E1'} : {color : 'black'}]">US {{size.size}} {{items.item_type.charAt(0).toUpperCase()}}</option>
              </select>
              <p style="color:red; font-size:12px;">{{al_msg}}</p>
            </div>
          </div>
          <div class="detail-button">
            <button @click="addItem" class="button is-success is-large is-light mr-5" :disabled="items.item_remain == 0">
              Add to cart
            </button>
            <div style="display: flex" @click="toggleFav" v-if="user">
              <svg
                style="cursor: pointer; color: red; margin-top: 1em"
                xmlns="http://www.w3.org/2000/svg"
                width="1.8em"
                height="1.8em"
                fill="currentColor"
                class="bi bi-heart"
                viewBox="0 0 16 16"
              > 
                <!-- ไม่ได้กด fav ใช้ path นี้-->
                <path v-if="(checkHeart.length < 1) && showFavHeart == false" 
                  d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
                  fill="red"
                ></path>

                <path v-else-if="(checkHeart.length = 1) && showFavHeart == true"
                  fill-rule="evenodd"
                  d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
                  fill="red"
                ></path>
              </svg>
              <p
                class="favitem"
                style="
                  font-size: 20px;
                  margin-top: auto;
                  margin-bottom: auto;
                  margin-left: 1em;
                "
              >
                Add to favourite
              </p>
            </div>
            <div style="display:flex;" v-else>
              <svg
                style="cursor: pointer; color: red; margin-top: 1em"
                xmlns="http://www.w3.org/2000/svg"
                width="1.8em"
                height="1.8em"
                fill="currentColor"
                class="bi bi-heart"
                viewBox="0 0 16 16"
              >
                <path
                  d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
                  fill="red"
                ></path>
              </svg>
              <p
                class="favitem"
                style="
                  font-size: 20px;
                  margin-top: auto;
                  margin-bottom: auto;
                  margin-left: 1em;
                "
              >
                Add to favourite
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="detail-content">
        <p style="text-indent: 50px">
          {{items.item_desc}}
        </p>
      </div>
      <!-- end Detail div -->
    </section>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  props : ['user'],
  data() {
    return {
      counter: 1,
      focus_heart: false, //ใช้ทดสอบชั่วคราว,
      items: null,
      size: null,
      size_remain : "Choose Size",
      al_msg : '',
      showFavHeart: null
    };
  },
  methods: {
    addItem(){
      if(!this.user){
        alert("Please login before add item to your cart.")
      }
      else{
        if(this.size_remain === 'Choose Size'){
          this.al_msg = 'Please Choose Size'
        }
        else{
          this.al_msg = ''
          let lastdata = ({id:this.items.item_id,name : this.items.item_name, 
          price : this.items.item_price, 
          size : this.size_remain.substr(0, this.size_remain.length-1),
          type : this.items.item_type,
          quantity : this.counter,
          img : this.items.item_img})
          let save_item = JSON.parse(localStorage.getItem("cart"))
          for(let i=0;i<save_item.length;i++){
            if(save_item[i].size == lastdata.size && save_item[i].name == lastdata.name){
              lastdata.quantity = save_item[i].quantity + lastdata.quantity
              save_item.splice(i, 1)
              break
            }
          }
          save_item.push(lastdata)
          localStorage.setItem('cart', JSON.stringify(save_item))
          this.$router.go()
        }
      }
    },
    toggleFav(){
      if(this.checkHeart.length == 1){
        axios.delete("http://localhost:3000/detail/delFav/"+this.items.item_id, {
          headers:{
            'authorization': localStorage.getItem('token') 
          }, 
          data: { 
            userId : this.user.user_id 
          }
        })
        .then(response => {
          console.log(response)
          this.checkHeart.pop()
          this.showFavHeart = false
        })
        .catch(err => console.log(err))
      }
      else{
        console.log(this.checkHeart)
        axios.post("http://localhost:3000/detail/addFav/"+this.items.item_id, {userId : this.user.user_id})
        .then(response => {
          console.log(response)
          this.showFavHeart = true
        })
        .catch(err => console.log(err))
      }
    },
    //เช็คจำนวนที่จะเอาสินค้าลง cart
    checkZero() {
      if (this.counter <= 1) {
        this.counter = 1;
      }
      else {
        this.counter--;
      }
    },
    checkLimit(){
      if(this.size_remain == 'Choose Size' && this.counter == 1){
        this.counter = 1
        this.al_msg = 'Please Choose Size'
      }
      else if(this.counter >= this.size_remain.substr(-1)){
        this.counter = this.size_remain.substr(-1)
        this.al_msg = ''
      }
      else{
        this.counter++;
        this.al_msg = ''
      }
    },
    formatCurrency(currency) {
      //format เงินให้มีลูกน้ำ
      return currency.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&,");
    },
  },
  computed : {
    checkHeart(){
      let copy=[]
      for(let i=0;i<this.focus_heart.length;i++){
        if(this.focus_heart[i].user_id == this.user.user_id){
          copy.push(this.focus_heart[i])
        }
      }
      return copy
    }
  },
  created() {
    axios
      .get("http://localhost:3000/detail/" + this.$route.params.id)
      .then((response) => {
        this.items = response.data.items[0];
        this.size = response.data.items
        this.focus_heart = response.data.favItem[0]
        if(this.focus_heart.length == 0){
          this.showFavHeart = false
        }else {
          this.showFavHeart = true
        }
        console.log("data = ", response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<style scoped>
</style>