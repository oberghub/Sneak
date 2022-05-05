const express = require("express");
const pool = require("../config");
const path = require("path")
const { isLoggedIn } = require('../middlewares')
const multer = require('multer');
router = express.Router();
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
      await conn.rollback();
      return res.status(400).json(err);
    } finally {
      console.log("finally");
      conn.release();
    }
  // }
});

router.put("/cart/point/:uid",isLoggedIn, async function (req, res, next) { //update user point
  const conn = await pool.getConnection()
  await conn.beginTransaction()
  
  try{
    const [rows, fields] = await conn.query("select user_point from user where user_id = ?", [req.params.uid])
    const [rows1, fields1] = await conn.query("update user set user_point = ? where user_id = ?", [rows[0].user_point + (req.body.total / 100), req.params.uid])
    conn.commit()
    res.status(200)
  }
  catch(err){
    conn.rollback()
    console.log(err)
  }
  finally{
    conn.release()
  }
});


router.put("/cart/reducecount",isLoggedIn, async function (req, res, next) {
  //ลบใน item_size
  const conn = await pool.getConnection()
  await conn.beginTransaction()
  
  try{
    const rd_size_r = await conn.query("select size_remain from item_size where item_id=? and size=?", [req.body.obj.id, req.body.obj.size])
    await conn.query("update item_size set size_remain=? where item_id = ? and size = ?", [parseInt(rd_size_r[0][0].size_remain - req.body.obj.quantity), req.body.obj.id, req.body.obj.size])

    await conn.query("update item set item_remain = (select sum(size_remain) from item_size where item_id = ?) where item_id = ?", [req.body.obj.id, req.body.obj.id])
  
    conn.commit()
    res.status(200)
  }
  catch(err){
    conn.rollback()
    console.log(err)
  }
  finally{
    conn.release()
  }
});


router.put("/cart/rollcount",isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()
  
  try{
    const rc_size_r = await conn.query("select size_remain from item_size where item_id=? and size=?", [req.body.obj.item_id, req.body.obj.item_size])
  
    await conn.query("update item_size set size_remain=? where item_id = ? and size = ?", [parseInt(rc_size_r[0][0].size_remain + req.body.obj.item_quantity), req.body.obj.item_id, req.body.obj.item_size])

    await conn.query("update item set item_remain = (select sum(size_remain) from item_size where item_id = ?) where item_id = ?", [req.body.obj.item_id, req.body.obj.item_id])
  

    conn.commit()
    res.status(200)
  }
  catch(err){
    conn.rollback()
    console.log(err)
  }
  finally{
    conn.release()
  }
});
exports.router = router;
