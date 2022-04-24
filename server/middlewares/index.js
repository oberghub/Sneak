async function logger (req, res, next) {
    const timestamp = new Date().toISOString().substring(0, 19)
    console.log(`${timestamp} | ${req.method}: ${req.originalUrl}`)
    next()
}
const pool = require("../config")
async function isLoggedIn (req, res, next){

    if (getToken.length == 0){
        res.status(401).send("You are not logged in!")
    }
    // Set user
    const [users] = await pool.query(
        'SELECT user_id, user_username, user_fname, user_lname, user_email, user_tel, user_role ' + 
        'FROM user WHERE user_id = ?', [token.user_id]
    )
    req.user = users[0]

    next()

}
module.exports = {
    logger,
    isLoggedIn
 }
 //ยังไม่เสร็จ