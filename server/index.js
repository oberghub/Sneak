const express = require("express")
const path = require("path")
const bodyParser = require('body-parser')
const cors = require('cors');
const app = express();
app.use(cors())
// set the view engine to ejs
app.set('view engine', 'ejs')
// set root folder for views
app.set('views', path.join(__dirname, 'views'))

// Statics
app.use(express.static(path.join(__dirname, 'static')))

// Encode body
app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());


// app.use(express.json()) // for parsing application/json
// app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

// routers
// const indexRouter = require('./routes/index')
const shopRouter = require('./routes/shop')
const usersRouter = require('./routes/users')
const cartRouter = require('./routes/cart')
const feedbackRouter = require('./routes/feedback')
const redeemRouter = require('./routes/redeem')
const detailRouter = require('./routes/detail')
const homeRouter = require('./routes/index')

// app.use(indexRouter.router)
app.use(shopRouter.router)
app.use(usersRouter.router)
app.use(cartRouter.router)
app.use(feedbackRouter.router)
app.use(redeemRouter.router)
app.use(detailRouter.router)
app.use(homeRouter.router)


app.listen(3000, () => {
  console.log(`Example app listening at http://localhost:3000`)
})