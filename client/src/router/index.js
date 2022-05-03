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
    path: '/aboutus',
    name: 'About Us',
    component: () => import('../views/AboutUs.vue')
  },
  {
    path: '/login',
    name: 'Login',
    meta: { guess: true },
    component: () => import('../views/aboutaccount/LoginPage.vue')
  },
  {
    path: '/register',
    name: 'Register',
    meta: { guess: true },
    component: () => import('../views/aboutaccount/RegisterPage.vue')
  },
  {
    path: '/detail/:id',
    name: 'Detail',
    component: () => import('../views/shop/DetailPage.vue')
  },
  {
    path: '/shop',
    name: 'Shop',
    component: () => import('../views/shop/ShopPage.vue'),
  },
  {
    path: '/redeem',
    name: 'Redeem',
    component: () => import('../views/shop/RedeemPage.vue')
  },
  {
    path: '/cart',
    name: 'My Cart',
    meta: { login: true },
    component: () => import('../views/shop/CartPage.vue')
  },
  {
    path: '/feedback',
    name: 'Feedback',
    meta: { login: true },
    component: () => import('../views/FeedbackPage.vue')
  },
  {
    path: '/profile',
    name: 'Profile',
    meta: { login: true },
    component: () => import('../views/aboutaccount/ProfilePage.vue')
  },
  {
    path: '/manage',
    name: 'Manage',
    meta: { login: true },
    component: () => import('../views/staff/ManageOrder.vue')
  },
  {
    path: '/addedit',
    name: 'AddEdit',
    meta: { login: true },
    component: () => import('../views/staff/AddEditItem.vue')
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
  next()
  //ใส่กันฟ้อง unused var
})

export default router