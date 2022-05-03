const express = require("express");
const pool = require("../config");
const path = require("path")
const { isLoggedIn } = require('../middlewares')
const multer = require('multer')
// SET STORAGE
const storage = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, "./static/uploads");
  },
  filename: function (req, file, callback) {
    callback(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname)
    );
  },
});
const upload = multer({ storage: storage })
router = express.Router();

router.post("/cart/confirm",isLoggedIn ,upload.single('photo'), async function (req, res, next) {
  // if (req.method == "POST") {
    const file = req.file;
    console.log(file)
    if (!file) {
      const error = new Error("Please upload a file");
      error.httpStatusCode = 400;
      return next(error);
    }
    const user = req.body.user;
    const total = req.body.total;
    const obj = JSON.parse(req.body.obj);
    const date = req.body.date;
    const  time = req.body.time;
    // const [rows2, fields2] = await pool.query("insert into `order` (user_id, order_status, order_address, order_date, order_total) values (?,?,?,CURRENT_TIMESTAMP,?)", [req.body.user.user_id, "pending", req.body.user.user_address, req.body.total])
    // let o_id = rows2.insertId
    // const [rows1, fields1] = await pool.query("insert payment (order_id, pay_image, pay_date, pay_time) values (?,?,?,?)", [o_id,"https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671",req.body.date,req.body.time])
    // for(let i=0;i<req.body.obj.length;i++){
    //   const [rows, fields] = await pool.query("insert into order_item (order_id, item_id, item_quantity, item_amount, item_price, item_size) values (?,?,?,?,?,?)", [o_id, req.body.obj[i].id, req.body.obj[i].quantity, req.body.obj[i].price * req.body.obj[i].quantity, req.body.obj[i].price, req.body.obj[i].size])
    // }
    const conn = await pool.getConnection();
    // Begin transaction
    await conn.beginTransaction();
    try {

      // let path = [blogId, file.path.substring(6), index == 0 ? 1 : 0];
      const order = await conn.query("insert into `order` (user_id, order_status, order_address, order_date, order_total) values (?,?,?,CURRENT_TIMESTAMP,?)", [req.user.user_id, "pending", req.user.user_address, total])
      let o_id = order[0].insertId
      console.log("step1")
      console.log(o_id, file.path.substr(6), date, time)
      await conn.query("insert payment (order_id, pay_image, pay_date, pay_time) values (?,?,?,?)", [o_id, file.path.substr(6), date, time])
      console.log("step2")
      for (let i = 0; i < obj.length; i++) {
        console.log(o_id, obj[i].id, obj[i].quantity, obj[i].price * obj[i].quantity, obj[i].price, obj[i].size)
      await conn.query("insert into order_item (order_id, item_id, item_quantity, item_amount, item_price, item_size) values (?,?,?,?,?,?)", [o_id, obj[i].id, obj[i].quantity, obj[i].price * obj[i].quantity, obj[i].price, obj[i].size])
      }
      console.log("step3")

      await conn.commit();
      res.send("success!");
    } catch (err) {
      console.log("kuyyyyyyy")
      await conn.rollback();
      return res.status(400).json(err);
    } finally {
      console.log("finally");
      conn.release();
    }
  // }
});
router.put("/cart/point",isLoggedIn, async function (req, res, next) {
  const [rows, fields] = await pool.query("select user_point from user where user_id = ?", [req.user.user_id])
  const [rows1, fields1] = await pool.query("update user set user_point = ? where user_id = ?", [parseInt(rows[0].user_point) + parseInt(req.body.total / 100), req.user.user_id])
});


router.put("/cart/reducecount",isLoggedIn, async function (req, res, next) {
  //ลบใน item_size
  const rd_size_r = await pool.query("select size_remain from item_size where item_id=? and size=?", [req.body.obj.id, req.body.obj.size])
  const rd_size = await pool.query("update item_size set size_remain=? where item_id = ? and size = ?", [parseInt(rd_size_r[0][0].size_remain - req.body.obj.quantity), req.body.obj.id, req.body.obj.size])


  const rd_item = await pool.query("select item_remain from `item` where item_id = ?", [req.body.obj.id])

  const rd_item2 = await pool.query("update item set item_remain = ? where item_id = ?", [parseInt(rd_item[0][0].item_remain - req.body.obj.quantity), req.body.obj.id])
});


router.put("/cart/rollcount",isLoggedIn, async function (req, res, next) {
  const rc_size_r = await pool.query("select size_remain from item_size where item_id=? and size=?", [req.body.obj.item_id, req.body.obj.item_size])
  const rc_item = await pool.query("select item_remain from `item` where item_id = ?", [req.body.obj.item_id])

  const rc_size = await pool.query("update item_size set size_remain=? where item_id = ? and size = ?", [parseInt(rc_size_r[0][0].size_remain + req.body.obj.item_quantity), req.body.obj.item_id, req.body.obj.item_size])


  const rc_item2 = await pool.query("update item set item_remain = ? where item_id = ?", [parseInt(rc_item[0][0].item_remain + req.body.obj.item_quantity), req.body.obj.item_id])
});
exports.router = router;
