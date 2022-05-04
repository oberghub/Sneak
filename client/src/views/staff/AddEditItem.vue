<template>
  <div>
    <section id="app">
        <div class="manage-ovf">
            <div class="edit-bar">
            <div class="sub-box-addedit" @click="additemstage = true, itemdetailstage = false, itemsizestage = false">
                <div class="text-manage-bar">Add New Item</div>
            </div> 
            <div class="sub-box-addedit" @click="additemstage = false, itemdetailstage = true, itemsizestage = false">
                <div class="text-manage-bar">Edit Item Details</div>
            </div> 
            <div class="sub-box-addedit" @click="additemstage = false, itemdetailstage = false, itemsizestage = true">
                <div class="text-manage-bar">Add / Edit Item Size</div>
            </div>
            </div>
        </div>
        <div class="list-item-box">
            <!-- หน้า Add Item -->
            <div v-show="additemstage" class="columns">
                <div class="column">
                    <label class="label">Item Name</label>
                    <input v-model="newItemName" class="input mb-3" type="text">
                    <div class="columns">
                        <div class="column">
                            <label class="label">Item Price</label>
                            <input v-model="newItemPrice" class="input mb-5" type="number">
                            <label class="label">Item Brand</label>
                            <input v-model="newItemBrand" class="input" type="text">
                        </div>
                        <div class="column">
                            <label class="label">Item Type</label>
                            <div class="select mb-5">
                                <select v-model="newItemType">
                                    <option value="men">Men</option>
                                    <option value="women">Women</option>
                                    <option value="kid">Kid</option>
                                </select>
                            </div>
                            <!-- ยืม class มาใช้ -->
                            <label class="label">Item Image</label>
                            <div class="cart-upload-image">
                                <input
                                class="button cart-pickimg"
                                style="margin: auto"
                                type="file"
                                id="photo"
                                name="photo"
                                accept="image/*"
                                @change="selectImages"
                                />
                            </div>
                            <div id="cart-show-image" class="mt-4" v-if="images != ''">
                                <img id="pic" class="cart-slip" :src="showSelectImage(images)" />
                            </div>
                            <div id="cart-show-image" class="mt-4" v-else>
                                <img id="pic" class="cart-slip" src="https://cdn.discordapp.com/attachments/894919456126554143/971114985017200640/unknown.png" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column">
                    <label class="label">Item Description</label>
                    <textarea v-model="newItemDesc" class="textarea mb-3"></textarea>
                    <button class='button is-warning is-rounded ml-3' @click="addItem()">Confirm</button>
                </div>
            </div>
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
                <button v-show="selectItem && !addSizestage" class='button is-info is-rounded ml-3 mb-3' @click="addSizestage = true">Add</button>
                <button v-show="addSizestage" class='button is-warning is-rounded ml-3 mb-3' @click="addSize(selectItem[1])">Confirm</button>
                <button v-show="addSizestage" class='button is-danger is-outlined is-rounded ml-3 mb-3' @click="addSizestage = false">Cancel</button>
                <!-- เพิ่ม size ใหม่ -->
                <p style="font-size:12px; text-align:left;" :style="{color : al_msg == 'โปรดกรอกไซส์ใหม่' ? 'red' : 'lightgreen'}">{{al_msg}}</p>
                <div class="mb-3" v-show="addSizestage">
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
      additemstage : false,
      itemdetailstage : true,
      itemsizestage : false,
      addSizestage: false,
      selectItem: '',
      editToggle: -1,
      editDesc: "",
      editPrice: null,
      editRemain: null,
      newSize: "",
      newRemain: "",
      al_msg : '',
      checkdup : false,
      newItemName: "",
      newItemDesc: "",
      newItemPrice: "",
      newItemType: "",
      newItemBrand: "",
      images: "",
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
            this.al_msg = 'โปรดกรอกไซส์ใหม่'
        }
        else{
            this.al_msg = 'เพิ่มสินค้าใหม่แล้ว'
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
                this.addSizestage = false;
            })
            .catch((error) => {
                this.error = error.message;
            });
        }
        this.newRemain = ''
        this.newSize = ''
        this.checkdup = false
    },
    selectImages(event) {
      this.images = event.target.files[0];
    },
    showSelectImage(image) {
      // for preview only
      return URL.createObjectURL(image);
    },
    addItem(){
        //เพิ่มสินค้าใหม่ แล้วไป edit, size ไม่ได้
        if (confirm("ยืนยันที่จะเพิ่มสินค้าใช่หรือไม่") == true) {
            let formData = new FormData();
            formData.append("name", this.newItemName);
            formData.append("desc", this.newItemDesc);
            formData.append("price", this.newItemPrice);
            formData.append("type", this.newItemType);
            formData.append("brand", this.newItemBrand);
            formData.append("photo", this.images);

            if (
                this.newItemName == "" ||
                this.newItemDesc == "" ||
                this.newItemPrice == "" ||
                this.newItemType == "" ||
                this.newItemBrand == "" ||
                this.images === ""
            ) {
                alert("ข้อมูลการเพิ่มสินค้าไม่ครบ");
            } else {
                axios
                .post("http://localhost:3000/user/additem", formData)
                .then((response) => {
                    console.log(response);
                    this.itemdetails.push({
                        item_id: response.data.itemId,
                        item_name: this.newItemName, 
                        item_desc: this.newItemDesc, 
                        item_price: this.newItemPrice
                    })
                    this.sumsize.push({
                        sumall : "0"
                    })
                    this.newItemName = ""
                    this.newItemDesc = ""
                    this.newItemPrice = ""
                    this.newItemType = ""
                    this.newItemBrand = ""
                    this.images = ""
                })
                .catch((err) => {
                    console.log(err);
                });
                this.$router.go()
            }
        }
    }
  },
    created() {
        axios
        .get("http://localhost:3000/user/itemdetail", {})
        .then((response) => {
            this.itemdetails = response.data.item;
        })
        .catch((err) => {
            console.log(err);
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
