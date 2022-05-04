const express = require("express");
const pool = require("../config");
const bcrypt = require('bcrypt');
const multer = require('multer');
const saltRounds = 10
const path = require('path');
const jwt = require("jsonwebtoken");
const secret = 'secret'
const { isLoggedIn } = require('../middlewares')
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
router = express.Router() 

router.get('/user/me', isLoggedIn, async (req, res, next) => {
  res.json(req.user)
})
router.post("/users/register", async function (req, res, next) {
  // Your code here
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  const username = req.body.username
  const password = req.body.pwd

  try {
    //check input
    if (!(username && password)) {
      res.status(400).send("Please Insert data all input")
    }
    //check dulpicate username
    const valuser = await conn.query("select user_username from user where user_username=?", [username])
    if (valuser[0].length > 0) {
      res.status(409).send("This username has already exist!")
    }
    //add data in database
    const hashpwd = bcrypt.hashSync(password, saltRounds)
    console.log(hashpwd)

    //create token
    const token = jwt.sign(
      { username: username },
      secret,
    )
    const user = await conn.query("insert into user(user_username, user_password, user_point, user_role) value(?, ?, 0, 'normal')", [username, hashpwd])
    const getlastusid = await conn.query("select user_id from user order by user_id desc limit 1;")
    console.log(getlastusid[0])
    const addtoken = await conn.query("insert into token(user_id, token) value(?, ?)", [getlastusid[0][0].user_id, token])

    conn.commit()
    res.status(200).json({
      msg: "you have register completed.",
      token: token
    })
  }
  catch (err) {
    conn.rollback()
    console.log(err)
  }
  finally {
    conn.release()
  }
});
router.post("/users/login", async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  const username = req.body.username
  const password = req.body.password
  try {
    //check correct username 
    const checkuser = await conn.query("select * from user join token using(user_id) where user_username=?", [username])
    if (checkuser[0].length == 0) {
      res.status(400).send("invalid username!")
    }
    //check password
    if (!(await bcrypt.compare(password, checkuser[0][0].user_password))) {
      res.status(400).send("invalid password!")
    }


    //create token
    const token = jwt.sign(
      { username: username },
      secret,
    )
    conn.commit()
    res.status(200).json(checkuser[0][0])
  }
  catch (err) {
    conn.rollback()
    console.log(err)
  }
  finally {
    conn.release()
  }
})
router.put("/users/saveinfo/:id", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try {
    const pass = await conn.query("select user_password from user where user_id=?", [req.params.id])
    //check password
    if (!(await bcrypt.compare(req.body.password, pass[0][0].user_password))) {
      res.status(400).send("invalid password!")
    }
    else {
      let results = await conn.query(
        "UPDATE user SET user_fname=?, user_lname=?, user_email=?, user_tel=?, user_address=? WHERE user_id=?",
        [req.body.fname, req.body.lname, req.body.email, req.body.tel, req.body.address, req.params.id]
      )
    }
    conn.commit()
    res.status(200).json('yeah')
  } catch (err) {
    conn.rollback()
    console.log(err)
  } finally {
    conn.release()
  }
})
router.put("/users/changepwd/:id", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try {
    const pass = await conn.query("select user_password from user where user_id=?", [req.params.id])
    //check password
    console.log(req.body.oldpwd, pass[0][0].user_password)
    if (!(await bcrypt.compare(req.body.oldpwd, pass[0][0].user_password))) {
      res.status(400).send("invalid password!")
    }
    else {
      const newpass = await bcrypt.hash(req.body.newpwd, saltRounds)
      let results = await conn.query(
        "UPDATE user SET user_password=? WHERE user_id=?",
        [newpass, req.params.id]
      )
    }
    conn.commit()
    res.status(200).json('yeah')
  } catch (err) {
    conn.rollback()
    console.log(err)
  } finally {
    conn.release()
  }
})
router.get("/users/purchase/:uid", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const order = await conn.query("SELECT * FROM `user`" +
    " join `order`" +
    " using (user_id)" +
    " join order_item" +
    " using (order_id)" +
    " join item" +
    " using (item_id)" +
    " WHERE user_id = ?"
    , [req.params.uid])
    const order1 = await conn.query("SELECT order_id,order_total, order_status FROM `order` WHERE user_id = ?", [req.params.uid]) 

    res.json({ order: order[0], orderBig: order1[0] })

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
})
router.get('/user/order', isLoggedIn, async (req, res, next) => {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const order = await conn.query("SELECT user_id, user_username, order_id, count(item_quantity) as item_quantity, sum(item_amount) as order_total, concat(user_fname, ' ' ,user_lname) as fullname, user_tel, user_address, order_status, pay_image FROM `user`" +
    " join `order`" +
    " using (user_id)" +
    " join order_item" +
    " using (order_id)" +
    " join payment" +
    " using (order_id) group by order_item.order_id")
    const order1 = await conn.query("SELECT * FROM `order` join order_item using (order_id) join item using (item_id)")
    res.json({orderBig:order[0], order: order1[0]}) 
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
})
router.put('/user/change/status/order/:uid', isLoggedIn, async (req, res, next) => {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const up_status = await conn.query("update `order` set order_status=? where user_id=? and order_id = ?", [req.body.status, req.params.uid, req.body.order_id])
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
})
//แก้ไขข้อมูลสินค้า
router.put('/user/detail/:itemId', isLoggedIn, async (req, res, next) => {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows1, fields1] = await conn.query('UPDATE item SET item_desc=?, item_price=? WHERE item_id=?', [req.body.desc, req.body.price, req.params.itemId])
    res.json({ desc: req.body.desc, price: req.body.price})
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
})
//แก้ไขจำนวนสินค้า
router.put('/user/size/:itemId', isLoggedIn, async (req, res, next) => {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows1, fields1] = await conn.query('UPDATE item_size SET size_remain=? WHERE item_id=? AND size=?', [req.body.remain, req.params.itemId, req.body.size])
    const [rows2, fields2] = await conn.query('SELECT sum(size_remain) `sumall` FROM item_size WHERE item_id=?', [req.params.itemId])
    const [rows3, fields3] = await conn.query('UPDATE item SET item_remain=? WHERE item_id=?', [rows2[0].sumall, req.params.itemId])
    res.json({ remain: req.body.remain})
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
})
//เพิ่ม Size สินค้า
router.put('/user/addsize/:itemId', isLoggedIn, async (req, res, next) => {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows1, fields1] = await conn.query('INSERT INTO item_size(item_id, size_remain, size) value(?,?,?)', [req.params.itemId, req.body.newremain, req.body.newsize])
    const [rows2, fields2] = await conn.query('SELECT sum(size_remain) `sumall` FROM item_size WHERE item_id=?', [req.params.itemId])
    const [rows3, fields3] = await conn.query('UPDATE item SET item_remain=? WHERE item_id=?', [rows2[0].sumall, req.params.itemId])
    const [rows4, fields4] = await conn.query('SELECT item_id, item_name, size_remain, size FROM item_size join item using (item_id)WHERE size_id=?', [rows1.insertId])
    res.json({item_id: rows4[0].item_id, item_name: rows4[0].item_name, size_remain: rows4[0].size_remain, size: rows4[0].size})
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
})
router.get('/user/itemdetail', async (req, res, next) => {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const item = await conn.query("SELECT item_id, item_name, item_desc, item_price FROM `item`")
    // console.log(item)
    res.json({item:item[0]}) 
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
})
router.get('/user/itemsize', async (req, res, next) => {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const item = await conn.query("select item_id, item_name, size, size_remain from item join item_size using (item_id) order by cast(size as float)")
    const item2 = await conn.query("select sum(size_remain) as sumall from item left outer join item_size using (item_id) group by item_id")
    res.json({item:item[0], sumall : item2[0]})
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
})
router.post('/user/additem', isLoggedIn ,upload.single('photo'), async (req, res, next) => {
  const conn = await pool.getConnection();
  await conn.beginTransaction();

  const file = req.file;
  if (!file) {
    const error = new Error("Please upload a file");
    error.httpStatusCode = 400;
    return next(error);
  }
  const name = req.body.name;
  const desc = req.body.desc;
  const price = req.body.price;
  const type = req.body.type;
  const brand = req.body.brand;
  console.log(name, desc, price, type, brand)

  try {
    const newitem = await conn.query("INSERT INTO item (item_price, item_name, item_desc, item_remain, item_img, item_type, item_brand) value(?,?,?, ?, ?,?,?)", [price, name, desc, 0, file.path.substr(6), type, brand])
    conn.commit();
    res.status(200)
  } catch (err) {
    conn.rollback();
    console.log(err)
    return res.status(400)
  } finally {
    console.log("finally");
    conn.release();
  }
})
exports.router = router;
