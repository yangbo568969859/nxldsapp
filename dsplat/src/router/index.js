import Vue from 'vue'
import Router from 'vue-router'
import Shan from '../components/Shan.vue'

import Home from '../components/Home.vue'
//goods组件
import HomePage from '../components/Home/HomePage.vue'
import JiSu from '../components/Home/JiSu.vue'
import MotherBaby from '../components/Home/MotherBaby.vue'
import MingPin from '../components/Home/mingpin.vue'
import Luxury from '../components/Home/luxury.vue'
import GoodsDetail from '../components/Home/GoodsDetail.vue'


import ShopCar from '../components/ShopCar.vue'
import Personal from '../components/Personal.vue'
//登陆组件
import Login from '../components/Login.vue'
import LoginIn from '../components/Login/LoginIn.vue'
import Register from '../components/Login/Register.vue'
//订单组件
import Order from '../components/Order.vue'

//商店组件
import Store from '../components/Store.vue'
//商店一组件
import Storeone from '../components/Storeone.vue'
//结算
import JieSuan from '../components/JieSuan.vue'

//地址
import Address from '../components/Address.vue'
import AddressAdd from '../components/Address/AddressAdd.vue'
import AddressList from '../components/Address/AddressList.vue'
import Addressedit from '../components/Address/Addressedit.vue'





Vue.use(Router)

export default new Router({
  routes: [
      {
          path: '/',
          redirect:'shan'
      },
      {
          path: '/shan',
          name:'shan',
          component:Shan,
      },
      {
          path: '/home',
          name:'home',
          component:Home,
          children:[
              {
                  path:'',
                  name:'homepage',
                  component:HomePage,
              },
              {
                  path: 'jisu',
                  name:'jisu',
                  component:JiSu,
              },
              {
                  path: 'motherbaby',
                  name:'motherbaby',
                  component:MotherBaby,
              },
              {
                  path: 'luxury',
                  name:'luxury',
                  component:Luxury,
              },
              {
                  path: 'mingpin',
                  name:'mingpin',
                  component:MingPin,
              },
              {
                  path: 'goodsdetail',
                  name:'goodsdetail',
                  component:GoodsDetail,
              }
          ]
      },
      {
          path:'/login',
          name:'login',
          component:Login,
          children:[
              {
                  path:'',
                  name:'loginin',
                  component:LoginIn,
              },
              {
                  path:'register',
                  name:'register',
                  component:Register,
              }
          ]
      },

      {
          path: '/shopcar',
          name:'shopcar',
          component:ShopCar,
      },
      {
          path: '/personal',
          name:'personal',
          component:Personal,
      },
      {
          path:'/order',
          name:'order',
          component:Order,
      },
      {
          path:'/store',
          name:'store',
          component:Store,
      },
      {
          path:'/storeone',
          name:'storeone',
          component:Storeone,
      },
      {
          path:'/jiesuan',
          name:'jiesuan',
          component:JieSuan,
      },
      {
          path:'/address',
          name:'address',
          component:Address,
          children:[
              {
                  path:'',
                  name:'addressadd',
                  component:AddressAdd,
              },
              {
                  path:'addresslist',
                  name:'addresslist',
                  component:AddressList,
              },
              {
                  path:'addressedit',
                  name:'addressedit',
                  component:Addressedit,
              },
          ]
      },
  ]
})
