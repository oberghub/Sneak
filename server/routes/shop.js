const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/shop", async function (req, res, next) {
    // Your code here
    const [rows, fields] = await pool.query("select * from item")
    const [rows2, fields2] = await pool.query("select distinct item_type from item")
    const [rows3, fields3] = await pool.query("select distinct item_brand from item")
    console.log(rows)
    res.json({
      items : rows,
      byHuman : rows2,
      brand: rows3
    })
  });

router.post("/shop", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('shop')
  });
exports.router = router;