const express = require("express");
const pool = require("../config");
const bcrypt = require('bcrypt');
const saltRounds = 10
const jwt = require("jsonwebtoken");
const secret = 'secret'
const { isLoggedIn } = require('../middlewares')
router = express.Router();


router.get('/user/me', isLoggedIn, async (req, res, next) => {
  res.json(req.user)
})
router.post("/users/register", async function (req, res, next) {
    // Your code here
    const conn = await pool.getConnection()
    await conn.beginTransaction()
    
    const username = req.body.username
    const password = req.body.pwd

    try{
      //check input
      if(!(username && password)){
        res.status(400).send("Please Insert data all input")
      }
      //check dulpicate username
      const valuser = await conn.query("select user_username from user where user_username=?", [username])
      if(valuser[0].length > 0){
        res.status(409).send("This username has already exist!")
      }
      //add data in database
      const hashpwd = bcrypt.hashSync(password, saltRounds)
      console.log(hashpwd)

      //create token
      const token = jwt.sign(
        {username : username},
        secret,
      )
      const user = await conn.query("insert into user(user_username, user_password, user_role) value(?, ?, 'normal')", [username, hashpwd])
      const getlastusid = await conn.query("select user_id from user order by user_id desc limit 1;")
      console.log(getlastusid[0])
      const addtoken = await conn.query("insert into token(user_id, token) value(?, ?)", [getlastusid[0][0].user_id, token])
      
      conn.commit()
      res.status(200).json({msg : "you have register completed.",
                            token : token})
    }
    catch(err){
      conn.rollback()
      console.log(err)
    }
    finally{
      conn.release()
    }
  });
router.post("/users/login", async function(req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction()

  const username = req.body.username
  const password = req.body.password
  try{
    //check correct username 
    const checkuser = await conn.query("select * from user join token using(user_id) where user_username=?", [username])
    if(checkuser[0].length == 0){
      res.status(400).send("invalid username!")
    }
    //check password
    if( !(await bcrypt.compare(password, checkuser[0][0].user_password)) ){
      res.status(400).send("invalid password!")
    }
    

    //create token
    const token = jwt.sign(
      {username : username},
      secret,
    )
    
    conn.commit()
    res.status(200).json(checkuser[0][0])
  }
  catch(err){
    conn.rollback()
    console.log(err)
  }
  finally{
    conn.release()
  }
})
exports.router = router;