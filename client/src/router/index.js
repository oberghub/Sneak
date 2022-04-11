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
    name: 'register',
    component: () => import('../views/aboutaccount/RegisterPage.vue') // set home as path '/'
  },
  {
    path: '/detail',
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
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router