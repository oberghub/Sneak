const express = require("express");
const pool = require("../config");
router = express.Router();

router.get("/", async function (req, res, next) {
    return res.render("index")
});
router.get("/recitem", async function (req, res, next) {
    const [rows, fields] = await pool.query("select item_name,item_id,item_remain,item_type,item_img,item_price from item where item_price between 5000 and 10000 order by item_price DESC limit 4")
    // console.log(rows)
    res.json({
      item : rows
    })
});
exports.router = router;
