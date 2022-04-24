const express = require("express");
const pool = require("../config");
// const { isLoggedIn } = require('../middlewares')
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
router.post("/redeem", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('redeem')
  });
exports.router = router;
