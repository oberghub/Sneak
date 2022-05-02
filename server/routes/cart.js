const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')

router = express.Router();

router.post("/cart/confirm", async function (req, res, next) {
  const [rows2, fields2] = await pool.query("insert into `order` (user_id, order_status, order_address, order_date, order_total) values (?,?,?,CURRENT_TIMESTAMP,?)", [req.body.user.user_id, "pending", req.body.user.user_address, req.body.total])
  let o_id = rows2.insertId
  const [rows1, fields1] = await pool.query("insert payment (order_id, pay_image, pay_date, pay_time) values (?,?,?,?)", [o_id,"https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671",req.body.date,req.body.time])
  for(let i=0;i<req.body.obj.length;i++){
    const [rows, fields] = await pool.query("insert into order_item (order_id, item_id, item_quantity, item_amount, item_price, item_size) values (?,?,?,?,?,?)", [o_id, req.body.obj[i].id, req.body.obj[i].quantity, req.body.obj[i].price * req.body.obj[i].quantity, req.body.obj[i].price, req.body.obj[i].size])
  }
});
router.put("/cart/point", async function (req, res, next) {
  const [rows, fields] = await pool.query("select user_point from user where user_id = ?",[req.body.user.user_id])
  const [rows1, fields1] = await pool.query("update user set user_point = ? where user_id = ?", [rows[0].user_point+(req.body.total/100),req.body.user.user_id])
});
router.put("/cart/reducecount", async function (req, res, next) {
  //ลบใน item_size
  const rd_size_r = await pool.query("select size_remain from item_size where item_id=? and size=?", [req.body.obj.id, req.body.obj.size])
  const rd_size = await pool.query("update item_size set size_remain=? where item_id = ? and size = ?", [parseInt(rd_size_r[0][0].size_remain - req.body.obj.quantity), req.body.obj.id, req.body.obj.size])


  //มีปัญหา
  const rd_item = await pool.query("select item_remain from `item` where item_id = ?", [req.body.obj.id])

  const rd_item2 = await pool.query("update item set item_remain = ? where item_id = ?", [parseInt(rd_item[0][0].item_remain - req.body.obj.quantity), req.body.obj.id])  
});
router.put("/cart/rollcount", async function (req, res, next) {
  const rc_size_r = await pool.query("select size_remain from item_size where item_id=? and size=?", [req.body.obj.item_id, req.body.obj.item_size])
  const rc_size = await pool.query("update item_size set size_remain=? where item_id = ? and size = ?", [parseInt(rc_size_r[0][0].size_remain + req.body.obj.item_quantity), req.body.obj.item_id, req.body.obj.item_size])

  //มีปัญหา
  const rc_item = await pool.query("select item_remain from `item` where item_id = ?", [req.body.obj.item_id])
  const rc_item2 = await pool.query("update item set item_remain = ? where item_id = ?", [parseInt(rc_item[0][0].item_remain + req.body.obj.item_quantity), req.body.obj.item_id])
});
router.put("/cart/itemsold", async function (req, res, next) {
  //มีปัญหา
  const item_sold = await pool.query("select item_sold from `item` where item_id = ?", [req.body.obj.item_id])
  const item_sold2 = await pool.query("update item set item_sold = ? where item_id = ?", [parseInt(item_sold[0][0].item_sold + req.body.obj.item_quantity), req.body.obj.item_id])
});
exports.router = router;
