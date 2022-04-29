const express = require("express");
const pool = require("../config");
//const { isLoggedIn } = require('../middlewares')
router = express.Router();

router.get("/detail/:id", async function (req, res, next) {
    const [rows, fields] = await pool.query("select * from item join item_size using(item_id) where item_id = ? order by cast(size as float)",[req.params.id])
    const fav = await pool.query("select * from fav_item where item_id=?", [req.params.id])
    res.json({
      items:rows,
      favItem : fav
    })
  });

router.post("/detail/addFav/:id", async function (req, res, next) {
    console.log(req.body.userId)
    const addfav = await pool.query("insert into fav_item (fav_item_like, user_id, item_id) values(?, ?, ?)", [1, req.body.userId, req.params.id])
    res.json("add success")
}); 

router.delete("/detail/delFav/:id", async function (req, res, next) {
    console.log(req.body.userId)
    const delfav = await pool.query("DELETE FROM fav_item WHERE item_id=? AND user_id=?", 
    [req.params.id, req.body.userId])
    res.json("delete success")
  });
exports.router = router;
