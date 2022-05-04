const express = require("express");
const { isLoggedIn } = require("../middlewares");
const pool = require("../config");

router = express.Router();

router.get("/feedback", async function (req, res, next) {
    // Your code here
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    
    try{
      const feed = await conn.query("select * from requirement join user using(user_id)")
      res.json({feedback: feed[0]})
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
router.post("/feedback/sendpost", isLoggedIn, async function (req, res, next) {
    // Your code here
    const conn = await pool.getConnection()
    await conn.beginTransaction()

    try{
      const addfeed = await conn.query("insert into requirement (user_id, req_title, req_date, req_detail) values(?,?, CURRENT_TIMESTAMP, ?)",[req.body.id, req.body.title, req.body.feedback])
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
