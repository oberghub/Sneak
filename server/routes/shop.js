const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/shop", async function (req, res, next) {
    // Your code here
    console.log("kuy")
    res.render('shop')
  });
router.post("/shop", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('shop')
  });
exports.router = router;
