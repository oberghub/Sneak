const express = require("express");
const pool = require("../config");
router = express.Router();

router.get("/shop", async function (req, res, next) {
    // Your code here
    const [rows, fields] = await pool.query("select * from item")
    const [rows2, fields2] = await pool.query("select item_type, count(item_type) as count_type from item group by item_type")
    const [rows3, fields3] = await pool.query("select item_brand, count(item_brand) as count_brand from item group by item_brand")
    const count = await pool.query("select count(*) as count from item")
    console.log(rows)
    res.json({
      items : rows,
      byHuman : rows2,
      brand: rows3,
      allitem : count[0]
    })
  });

router.post("/shop", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('shop')
  });
exports.router = router;