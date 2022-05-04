const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require("../middlewares");
router = express.Router();

router.get("/redeem", async function (req, res, next) {
  // Your code here
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows, fields] = await conn.query("select * from redeem")
    // const [rows2, fields2] = await pool.query("select distinct item_type from item")
    // console.log(rows)
    res.json({
      items : rows
    })
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
router.get("/user/redeem/", isLoggedIn, async function (req, res, next) {
    // Your code here
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const user_red = await conn.query("select * from user_redeem join redeem using(red_id) where user_id=?", [req.user.user_id])
    res.json(user_red[0])
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
router.get("/user/redeem/history",  async function (req, res, next) {
  // Your code here
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const user_red = await conn.query("select * from redeem join user_redeem using(red_id) join user using (user_id)")
    res.json({red : user_red[0]})
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
router.put("/redeem/:itemId", async function (req, res, next) {
  // Your code here
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows1, fields1] = await conn.query("select red_remain, red_point from redeem where red_id = ?",[req.params.itemId])
    const remain = rows1[0].red_remain-1
    const [rows, fields] = await conn.query("select user_point from user where user_id = ?",[req.body.user])
    const point = rows[0].user_point-rows1[0].red_point
    const [rows3, fields3] = await conn.query("update redeem set red_remain = ?  where red_id = ?",[remain, req.params.itemId])
    const [rows2, fields2] = await conn.query("update user set user_point = ?  where user_id = ?",[point, req.body.user])
    // const [rows2, fields2] = await conn.query("select distinct item_type from item")
    console.log(point)
    res.json({
      items : rows,
      remain: remain,
      point: point
    })
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
router.post("/redeem/:itemId", async function (req, res, next) {
  // Your code here
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows4, fields4] = await conn.query("insert into user_redeem(user_id,red_id) values(?,?)",[req.body.user,req.params.itemId])
    // const [rows2, fields2] = await pool.query("select distinct item_type from item")
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
