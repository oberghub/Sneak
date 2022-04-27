const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')
router = express.Router();

router.get("/detail/:id", async function (req, res, next) {
    const [rows, fields] = await pool.query("select * from item join item_size using(item_id) where item_id = ? order by cast(size as float)",[req.params.id])
    res.json({
      items:rows,
    })
  });
router.post("/detail/addFav/:id", async function (req, res, next) {
    // Your code here
    console.log(req.params.id)
    // const addfav = pool.query("insert into fav_item (fav_item_like, user_id, item_id) values(?, ?, ?)", [1, req.body.user_id, req.params.id])
  }); 
exports.router = router;
