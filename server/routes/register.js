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
    console.log("kuy1")
    res.render('register')
  });
exports.router = router;