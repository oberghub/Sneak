import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('../views/HomePage.vue') // set home as path '/'
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/aboutaccount/LoginPage.vue') // set home as path '/'
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('../views/aboutaccount/RegisterPage.vue') // set home as path '/'
  },
  {
    path: '/detail/:id',
    name: 'Detail',
    component: () => import('../views/shop/DetailPage.vue') // set home as path '/'
  },
  {
    path: '/shop',
    name: 'Shop',
    component: () => import('../views/shop/ShopPage.vue') // set home as path '/'
  },
  {
    path: '/redeem',
    name: 'Redeem',
    component: () => import('../views/shop/RedeemPage.vue') // set home as path '/'
  },
  {
    path: '/cart',
    name: 'My Cart',
    component: () => import('../views/shop/CartPage.vue') // set home as path '/'
  },
  {
    path: '/feedback',
    name: 'Feedback',
    component: () => import('../views/FeedbackPage.vue') // set home as path '/'
  },
  {
    path: '/changepassword',
    name: 'Changepassword',
    component: () => import('../views/aboutaccount/ChangePasswordPage.vue') // set home as path '/'
  },
  {
    path: '/profile',
    name: 'Profile',
    component: () => import('../views/aboutaccount/ProfilePage.vue') // set home as path '/'
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  document.title = "Sneak! : " + to.name

  //ใส่กันฟ้อง unused var
  next()
  console.log(from)
})

export default router