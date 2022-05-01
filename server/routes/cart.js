const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')

router = express.Router();

router.get("/cart", async function (req, res, next) {
  // Your code here
  console.log("kuy")
  res.render('cart')
});
router.post("/cart/confirm", async function (req, res, next) {
  // const [rows5, fields5] = await pool.query("select order_id from `order` order by order_id DESC limit 1")
  // const [rows3, fields3] = await pool.query("insert into `order` value (?,?,?,?,CURRENT_TIMESTAMP,?)", [rows5[0].order_id + 1, req.body.user.user_id, "pending", req.body.user.user_address, req.body.total])
  const [rows4, fields4] = await pool.query("select order_id from `order_item` order by order_id DESC limit 1")
  // const [rows2, fields2] = await pool.query("select item_id from item where item_name = ?", [req.body.obj[].name])
  console.log(req.body.obj.name)
  for (i = 0; i < req.body.obj.length; i++) {
    const [rows6, fields6] = await pool.query("select item_no from `order_item` order by item_no DESC limit 1")
    const [rows, fields] = await pool.query("insert into order_item values (?,?,?,?,?,?,?)", [rows6[0].item_no+1,rows4[0].order_id+1, req.body.obj[i].id, req.body.obj[i].quantity, req.body.obj[i].price * req.body.obj[i].quantity, req.body.obj[i].price, req.body.obj[i].size])
  }
});
router.post("/cart/order", async function (req, res, next) {
  const [rows1, fields1] = await pool.query("select order_id from `order` order by order_id DESC limit 1")
  const [rows2, fields2] = await pool.query("insert into `order` values (?,?,?,?,CURRENT_TIMESTAMP,?)", [rows1[0].order_id + 1, req.body.user.user_id, "pending", req.body.user.user_address, req.body.total])
  // console.log(rows1[0])
});
router.put("/cart/point", async function (req, res, next) {
  const [rows, fields] = await pool.query("select user_point from user where user_id = ?",[req.body.user.user_id])
  const [rows1, fields1] = await pool.query("update user set user_point = ? where user_id = ?", [rows[0].user_point+(req.body.total/100),req.body.user.user_id])
});
router.post("/cart/payment", async function (req, res, next) {
  const [rows, fields] = await pool.query("select pay_id from `payment` order by pay_id DESC limit 1")
  const [rows4, fields4] = await pool.query("select order_id from `order_item` order by order_id DESC limit 1")
  const [rows1, fields1] = await pool.query("insert payment values (?,?,?,?,?)", [rows[0].pay_id+1,rows4[0].order_id,"https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671",req.body.date,req.body.time])
});
router.put("/cart/reducecount", async function (req, res, next) {
  // let arr = []
  // for (i = 0; i < req.body.obj.length; i++) {
  //   const [rows6, fields6] = await pool.query("select item_remain from `item` where item_name = ?", [req.body.obj[i].name])
  //   arr.push(rows6[0].item_remain-1)
  // }
  // console.log(arr)
  // for (i = 0; i < arr.length; i++) {
  //   const [rows8, fields8] = await pool.query("update item set item_remain = ? where item_name = ?", [arr[i],req.body.obj[i].name])
  // }
});
exports.router = router;
