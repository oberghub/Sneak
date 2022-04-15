const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/detail/:id", async function (req, res, next) {
    const [rows, fields] = await pool.query("select * from item where item_id = ?",[req.params.id])
    // const [rows1, fields1] = await pool.query("select * item_size where item_id = ?",[req.params.id])
    res.json({
      items:rows[0],
      // size:rows1
    })
    console.log(rows)
  });
router.post("/cart", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('cart')
  });
exports.router = router;
