const express = require("express");
const pool = require("../config");

router = express.Router();

router.get("/feedback", async function (req, res, next) {
    // Your code here
    console.log("kuy")
    res.render('feedback')
  });
router.post("/feedback", async function (req, res, next) {
    // Your code here
    console.log("kuy1")
    res.render('feedback')
  });
exports.router = router;
