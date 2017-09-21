<template>
    <div id="warper">
        <div class="register">
            <form>
                <div class="login">
                    <div class="other-login">
                        <span>使用手机注册</span>
                    </div>
                </div>
                <div class="telephone tel">
                    <input type="text" v-model="form.account" maxlength="11" placeholder="请输入11位手机号码">
                </div>
                <div class="telephone che">
                    <input type="text" v-model="form.check" maxlength="8" placeholder="请输入验证码">
                    <div class="check">
                        <a href="">验证</a>
                    </div>
                </div>
                <div class="telephone pass">
                    <input type="password" @keyup="checkma" v-model="form.pass" maxlength="16" placeholder="使用6-16位密码登录">
                </div>
                <div class="but">
                    <button
                            @click.prevent="submit"
                            :class="{hover:active}"
                    >注册</button>
                </div>
            </form>
            <div class="copy">
                点击注册，表示同意
                <a href="">《用户协议》</a>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                active:false,
                form:{
                    account:'',
                    check:'',
                    pass:'',
                }
            }
        },
        methods:{
            submit:function () {
                fetch('/api/register_c_user',{
                    method:'POST',
                    headers:{'Content-Type':'application/json'},
                    body:JSON.stringify(this.form)
                }).then(res=>res.json())
                    .then(r=>{
                        if(r.code==2){
                            alert('注册成功')
                            location.href='#/login'
                        }

                    })
            },
            checkma:function () {
                if(this.form.account.length==11&&this.form.check.length==6&&this.form.pass.length>=6){
                    this.active=true;
                }else {
                    this.active=false;
                }
            },
        }
    }
</script>

<style scoped>
    #warper{
        position: relative;
        top: 0px;
        left: 0px;
        width: 100%;
        z-index: 1;
        background: #fff;
        padding-bottom: 80px;
    }
    form{
        margin:0 12%;
    }
    .login{
        padding:0 10%;
    }
    .other-login{
        position: relative;
        height: .58rem;
        line-height: .58rem;
        text-align: center;
    }
    .other-login span{
        padding:0 5px;
        background: #fff;
        color: #999;
    }
    .other-login span:before{
        content: '';
        font-size: 0px;
        border-bottom: solid 1px #f5f5f5;
        position: absolute;
        top: 29px;
        left: 0px;
        width: 100%;
        z-index: -1;
    }
    .telephone{
        width:100%;
        display: flex;
        justify-content: space-between;
    }
    .telephone input{
        background: #f5f5f5;
        border-radius: .20rem;
        width: 100%;
        height: .36rem;
        font-size: .14rem;
        color: #999999;
        text-align: left;
        text-indent: .21rem;
    }
    .che{
        margin-top:.2rem;
        display: flex;
        justify-content:space-between;
    }
    .che input{
        width:66%;
    }
    .pass input{
        margin-top:.2rem;
        width:100%;
    }
    .check {
        width:30%;
    }
    .check a{
        background: #ffffff;
        border: 1px solid #feb2c5;
        border-radius: 20px;
        width: 97%;
        height: 35px;
        font-size: 14px;
        color: #feb2c5;
        line-height: 35px;
        text-align: center;
        display: block;
    }
    .mian{
        margin-top:.2rem;
        color: #999;
    }
    .mian a{
        padding-left:.05rem;
        color: #fe4070;
    }
    .but button{
        background: #feb2c5!important;
        border-radius: 20px;
        width: 100%;
        height: 36px;
        font-size: 14px;
        color: #ffffff;
        line-height: 14px;
        text-align: center;
        margin: 18px auto 0 auto;
        display: block;
    }
    .copy{
        font-size: 12px;
        color: #999999;
        height: 36px;
        line-height: 36px;
        text-align: center;
    }
    .copy a{
        color: #808080;
    }
    .but .hover{
        background: #fe4070!important;
    }
</style>