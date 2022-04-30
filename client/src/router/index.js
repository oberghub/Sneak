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
    meta: { guess: true },
    component: () => import('../views/aboutaccount/LoginPage.vue') // set home as path '/'
  },
  {
    path: '/register',
    name: 'Register',
    meta: { guess: true },
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
    meta: { login: true },
    component: () => import('../views/shop/RedeemPage.vue') // set home as path '/'
  },
  {
    path: '/cart',
    name: 'My Cart',
    meta: { login: true },
    component: () => import('../views/shop/CartPage.vue') // set home as path '/'
  },
  {
    path: '/feedback',
    name: 'Feedback',
    meta: { login: true },
    component: () => import('../views/FeedbackPage.vue') // set home as path '/'
  },
  {
    path: '/profile',
    name: 'Profile',
    meta: { login: true },
    component: () => import('../views/aboutaccount/ProfilePage.vue') // set home as path '/'
  },
  {
    path: '/manage',
    name: 'Manage',
    meta: { login: true },
    component: () => import('../views/staff/ManageOrder.vue') // set home as path '/'
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  document.title = "Sneak! : " + to.name
  const isLoggedIn = !!localStorage.getItem('token')

  if (to.meta.login && !isLoggedIn) {
    next({ path: '/login' })
  }

  if (to.meta.guess && isLoggedIn) {
    next({ path: '/'})
  }

  //ใส่กันฟ้อง unused var
  next()
  console.log(from)
})

export default router