const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/register", async function (req, res, next) {
    // Your code here
    console.log("kuy")
    res.render('register')
  });
router.post("/register", async function (req, res, next) {
    // Your code here
    // let [rows, fields] = await pool.query("select cust_id from customer order by cust_id desc limit 1")
    let insdata = await pool.query("insert into customer (cust_email, cust_password) value(?, ?)", [req.body.email, req.body.pwd])
  });
exports.router = router;