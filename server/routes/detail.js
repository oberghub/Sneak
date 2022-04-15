const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/detail/:id", async function (req, res, next) {
    const [rows, fields] = await pool.query("select * from item join item_size using(item_id) where item_id = ?",[req.params.id])
    res.json({
      items:rows,
    })
  });
router.post("/cart", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('cart')
  });
exports.router = router;
