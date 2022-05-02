<template>
  <div>
    <section id="app">
        <div class="manage-ovf">
            <div class="manage-bar">
            <div class="sub-box-manage" @click="itemdetailstage = true, itemsizestage = false">
                <div class="text-manage-bar">Add / Edit Item Details</div>
            </div> 
            <div class="sub-box-manage" @click="itemdetailstage = false, itemsizestage = true">
                <div class="text-manage-bar">Add / Edit Item Size</div>
            </div>
            </div>
        </div>
        <div class="list-item-box">
            <!-- หน้า detail -->
            <div v-show="itemdetailstage">
                <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item,index) in itemdetails" :key="item.item_id">
                            <td>{{item.item_name}}</td>
                            <td>
                                <div class="content" v-if="index===editToggle">
                                    <input v-model="editDesc" class="input" type="text" />
                                </div>
                                <div v-else>
                                    {{item.item_desc}}
                                </div>
                            </td>
                            <td>
                                <div class="content" v-if="index===editToggle">
                                    <input v-model="editPrice" class="input" type="text" />
                                </div>
                                <div v-else>
                                    ฿{{formatCurrency(item.item_price)}}
                                </div>
                            </td>
                            <td WIDTH="200">
                                <div v-if="index===editToggle">
                                    <button @click="saveEditItem(item.item_id,index)" class="button is-warning mr-3" >
                                        <span>Save</span>
                                    </button>
                                    <button @click="editToggle = -1" class="button is-danger is-outlined">
                                        <span>Cancel</span>
                                    </button>
                                </div>
                                <button v-else @click="editToggle = index; editDesc = item.item_desc; editPrice = item.item_price" class='button is-primary'>Edit</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- หน้า size -->
            <div v-show="itemsizestage">
                <div class="select mb-3">
                    <select v-model="selectItem">
                        <option disabled value="">Select Item</option>
                        <option v-for="item, index in itemdetails" :key="item.size" :value="[item.item_name, item.item_id]">
                            {{ item.item_name }} ({{sumsize[index].sumall}} ea)
                        </option>
                    </select>
                </div>
                <button v-show="selectItem && !addstage" class='button is-info is-rounded ml-3 mb-3' @click="addstage = true">Add</button>
                <button v-show="addstage" class='button is-warning is-rounded ml-3 mb-3' @click="addSize(selectItem[1])">Confirm</button>
                <button v-show="addstage" class='button is-danger is-outlined is-rounded ml-3 mb-3' @click="addstage = false">Cancel</button>
                <!-- เพิ่ม size ใหม่ -->
                <p style="font-size:12px; text-align:left;" :style="{color : al_msg == 'ซ้ำโว้ยยยยยย' ? 'red' : 'lightgreen'}">{{al_msg}}</p>
                <div class="mb-3" v-show="addstage">
                    <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Item Size</th>
                            <th>Item Remain</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{selectItem[0]}}</td>
                            <td><input v-model="newSize" class="input" type="text" /></td>
                            <td><input v-model="newRemain" class="input" type="text" /></td>
                        </tr>
                    </tbody>
                    </table>
                </div>
                <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Item Size</th>
                            <th>Item Remain</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item, index) in itemsize" :key="index" v-show="item.item_name == selectItem[0]">
                            <td>{{item.item_name}}</td>
                            <td>
                                {{item.size}}
                            </td>
                            <td>
                                <div class="content" v-if="index===editToggle">
                                    <input v-model="editRemain" class="input" type="text" />
                                </div>
                                <div v-else>
                                    {{item.size_remain}}
                                </div>
                            </td>
                            <td>
                                <div v-if="index===editToggle">
                                    <button @click="saveEditSize(item.item_id, index, item.size)" class="button is-warning mr-3" >
                                        <span>Save</span>
                                    </button>
                                    <button @click="editToggle = -1" class="button is-danger is-outlined">
                                        <span>Cancel</span>
                                    </button>
                                </div>
                                <button v-else @click="editToggle = index; editRemain = item.size_remain" class='button is-primary'>Edit</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
      itemdetails : [],
      itemsize : [],
      sumsize : [],
      itemdetailstage : true,
      itemsizestage : false,
      addstage: false,
      selectItem: '',
      editToggle: -1,
      editDesc: "",
      editPrice: null,
      editRemain: null,
      newSize: "",
      newRemain: "",
      al_msg : '',
      checkdup : false
    }
  },
  methods : {
    formatCurrency(currency){ //format เงินให้มีลูกน้ำ
      return ((currency).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))
    },
    saveEditItem(itemId, index){
        axios
        .put(`http://localhost:3000/user/detail/${itemId}`, {
          desc: this.editDesc,
          price: parseFloat(this.editPrice)
        })
        .then((response) => {
          this.itemdetails[index].item_desc = response.data.desc;
          this.itemdetails[index].item_price = response.data.price;
          this.editToggle = -1;
        })
        .catch((error) => {
          this.error = error.message;
        });
    },
    saveEditSize(itemId, index, itemSize){
        axios
        .put(`http://localhost:3000/user/size/` + itemId, {
          size: itemSize,
          remain: this.editRemain
        })
        .then((response) => {
          this.itemsize[index].size_remain = response.data.remain;
          this.editToggle = -1;
        })
        .catch((error) => {
          this.error = error.message;
        });
    },
    addSize(itemId){
        for(let i=0;i<this.itemsize.length;i++){
            if(this.newSize == this.itemsize[i].size && itemId == this.itemsize[i].item_id){
                this.checkdup = true
                break
            }
        }
        if(this.checkdup){
            this.al_msg = 'ซ้ำโว้ยยยยยย'
        }
        else{
            this.al_msg = 'เพิ่มให้ละน้าาาาาา'
            this.checkdup = false
            axios
            .put(`http://localhost:3000/user/addsize/` + itemId, {
            newsize: this.newSize,
            newremain: parseInt(this.newRemain)
            })
            .then((response) => {
                this.itemsize.push({
                    item_id: response.data.item_id,
                    item_name: response.data.item_name,
                    size_remain: response.data.size_remain,
                    size: response.data.size
                })
                console.log(response);
                this.addstage = false;
            })
            .catch((error) => {
                this.error = error.message;
            });
        }
        this.newRemain = ''
        this.newSize = ''
        this.checkdup = false
    }
  },
    created() {
        axios
        .get("http://localhost:3000/user/itemdetail", {})
        .then((response) => {
            this.itemdetails = response.data.item;
        })
        .catch((err) => {
            console.log(err, "WTF");
        }),
        axios
        .get("http://localhost:3000/user/itemsize", {})
        .then((response) => {
            this.itemsize = response.data.item;
            this.sumsize = response.data.sumall
        })
        .catch((err) => {
            console.log(err);
        });
    },
}
</script>
