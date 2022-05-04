const express = require("express");
const pool = require("../config");
const { isLoggedIn } = require('../middlewares')
router = express.Router();

router.get("/detail/user/:id", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows, fields] = await pool.query("select * from item left outer join item_size using(item_id) where item_id = ? order by cast(size as float)",[req.params.id])
    const fav_user = await pool.query("select * from fav_item where item_id=? and user_id=?", [req.params.id, req.user.user_id])
    res.json({
      items:rows,
      favUser : fav_user
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
router.get("/detail/notuser/:id", async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  try{
    const [rows, fields] = await pool.query("select * from item left outer join item_size using(item_id) where item_id = ? order by cast(size as float)",[req.params.id])
    const fav_nouser = await pool.query("select * from fav_item where item_id=?", [req.params.id])
    res.json({
      items:rows,
      favNoUser: fav_nouser,
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

router.post("/detail/addFav/:id", async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()
  
  try{
    console.log("add fav")
    const addfav = await conn.query("insert into fav_item (fav_item_like, user_id, item_id) values(?, ?, ?)", [1, req.body.userId, req.params.id])
    res.json("add success")
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

router.delete("/detail/delFav/:id", async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()
  
  try{
    console.log("del fav")
    const delfav = await conn.query("DELETE FROM fav_item WHERE item_id=? AND user_id=?", [req.params.id, req.body.userId])
    res.json("delete success")
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
