const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/redeem", async function (req, res, next) {
    // Your code here
    console.log("kuy")
    res.render('redeem')
  });
router.post("/redeem", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('redeem')
  });
exports.router = router;
