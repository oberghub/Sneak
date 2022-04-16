const express = require("express");
const pool = require("../config");
router = express.Router();

// const cookieSession = require('cookie-session')
// const bcrypt = require('bcrypt') //ตัวเข้ารหัสผ่าน
// const {body, validationResult} = require('express-validator')
// app.use(cookieSession({
//   name : 'session',
//   keys : ['key1', 'key2'],
//   // maxAge : 3600*1000, //เวลาของ session 1hr
//   maxAge: 24 * 60 * 60 * 1000 // 24 hours
// }));

// const ifNotLoggedIn = (req, res, next) => {
//   if(!req.session.isLoggedIn){

//   }
// }

router.get("/", async function (req, res, next) {
    return res.render("index")
});
exports.router = router;
