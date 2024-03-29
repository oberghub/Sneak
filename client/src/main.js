import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import 'bulma/css/bulma.css'
import '@/assets/css/styles.css'
import '@/assets/css/icon.css'
import Vuelidate from 'vuelidate'
Vue.use(Vuelidate)

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
