const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require("../middlewares");
router = express.Router();

router.get("/redeem", async function (req, res, next) {
  // Your code here
  const [rows, fields] = await pool.query("select * from redeem")
  // const [rows2, fields2] = await pool.query("select distinct item_type from item")
  console.log(rows)
  res.json({
    items : rows
  })
});
router.get("/user/redeem/", isLoggedIn, async function (req, res, next) {
    // Your code here
    const user_red = await pool.query("select * from user_redeem join redeem using(red_id) where user_id=?", [req.user.user_id])
    res.json(user_red[0])
  });
router.put("/redeem/:itemId", async function (req, res, next) {
  // Your code here
  const [rows1, fields1] = await pool.query("select red_remain, red_point from redeem where red_id = ?",[req.params.itemId])
  const remain = rows1[0].red_remain-1
  const [rows, fields] = await pool.query("select user_point from user where user_id = ?",[req.body.user])
  const point = rows[0].user_point-rows1[0].red_point
  const [rows3, fields3] = await pool.query("update redeem set red_remain = ?  where red_id = ?",[remain, req.params.itemId])
  const [rows2, fields2] = await pool.query("update user set user_point = ?  where user_id = ?",[point, req.body.user])
  // const [rows2, fields2] = await pool.query("select distinct item_type from item")
  console.log(point)
  res.json({
    items : rows,
    remain: remain,
    point: point
  })
});
router.post("/redeem/:itemId", async function (req, res, next) {
  // Your code here
  const [rows4, fields4] = await pool.query("insert into user_redeem(user_id,red_id) values(?,?)",[req.body.user,req.params.itemId])
  // const [rows2, fields2] = await pool.query("select distinct item_type from item")
  res.json({
  })
});
exports.router = router;
