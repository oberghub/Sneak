const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/detail", async function (req, res, next) {
    // Your code here
    console.log("kuy")
    res.render('cart')
  });
router.post("/cart", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('cart')
  });
exports.router = router;
