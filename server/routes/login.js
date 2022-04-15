const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/login", async function (req, res, next) {
    // Your code here
    console.log("kuy")
    res.render('login')
  });
router.post("/login", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('login')
  });
exports.router = router;
