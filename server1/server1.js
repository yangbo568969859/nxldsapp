
const express=require('express');
const server=express();
const port=4445;
const path=require('path');
const mysql=require('mysql');
const bodyparser=require('body-parser');
const con=mysql.createConnection({
    host:'localhost',
    user:'root',
    pass:'',
    database:'dianshang',
})

server.use(bodyparser.json());
server.use(express.static('./public'));
server.get('/', (req, res)=> {
    res.sendFile(path.resolve('./index.html'));
});
//登录账号验证
server.post('/api/checkAccount',(req,res)=>{
    let sql='select * from user where account=? and pass=?';
    con.query(sql,[req.body.account,req.body.pass],(err,result)=>{
        if(err){
            res.json({code:4,message:'错误'})
        }else {
            if(result.length===0){
                res.json({code:4,message:'账号或密码错误'});
            }else {
                let sql='select * from store where uid=? ';
                con.query(sql,[result[0].id],(err,r)=>{
                    if(r.length){
                        res.json({code:2,message:'登陆成功',data:result[0],active:true});
                    }else {
                        res.json({code:2,message:'登陆成功',data:result[0],active:false});
                    }
                })
            }
        }
    })
})
//注册账号检测
server.post('/api/register',(req,res)=>{
    let sql='insert into user (account,pass) values (?,?)'
    con.query(sql,[req.body.account,req.body.pass],(err,result)=>{
        if(err){
            if(err.message.startsWith('ER_DUP_ENTRY')){
                res.json({code:4,message:'账号已存在'});
            }
        }else {
            res.json({code:2,message:'ok'});
        }
    })
})

//用户
//用户登录  通过验证码登录（有账号登录，没有账号注册登录）
server.post('/api/get_c_user_login',(req,res)=>{
    if(req.body.check=='111111'){
        let sql='select * from c_user where account=?'
        con.query(sql,[req.body.account],(err,result)=>{
            if(result.length){
                res.json({code:2,data:result[0].id,message:'ok'})
            }else {
                let sql='insert into c_user (account) values (?)'
                con.query(sql,[req.body.account],(err,r)=>{
                    if(!err){
                        res.json({code:2,data:r.insertId,message:'注册成功'})
                    }
                })
            }
        })
    }
})
//个人中心获取电话号码
server.get('/api/get_c_user_account',(req,res)=>{
    let sql='select * from c_user where id=?'
    con.query(sql,[req.query.id],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})

//用户注册
server.post('/api/register_c_user',(req,res)=>{
    if(req.body.check=='111111'){
        let sql='insert into c_user (account,pass) values (?,?)'
        con.query(sql,[req.body.account,req.body.pass],(err,r)=>{
            if(!err){
                if(r.length){
                    res.json({code:4,data:r.affectedRows,message:'已经注册'});
                }else {
                    res.json({code:2,data:r.affectedRows,message:'ok'});
                }
            }else {
                console.log(err.message);
            }
        })
    }
})
//用户地址submit
server.post('/api/submit_address',(req,res)=>{
    let sql='insert into c_user_address (uid,name,phone,address) values (?,?,?,?)'
    con.query(sql,[req.body.uid,req.body.name,req.body.phone,req.body.address],(err,result)=>{
        if(!err){
            res.json({code:2,data:result.affectedRows,message:'ok'});
        }
    })
})
//用户地址列表
server.get('/api/get_address',(req,res)=>{
    let sql='select * from c_user_address where uid=?'
    con.query(sql,[req.query.uid],(err,result)=>{
        if(!err){
            res.json({code:2,data:result,message:'ok'})
        }
    })
})
//用户设置默认地址
server.get('/api/set_default',(req,res)=>{
    let sql='update c_user_address set is_default=0 where uid=?'
    con.query(sql,[req.query.uid],(err,result)=>{
        if(!err){
            let sql='update c_user_address set is_default=1 where id= ?'
            con.query(sql,[req.query.id],(err,r)=>{
                if(!err){
                    res.json({code:2,data:r[0],message:'ok'})
                }
            })
        }
    })
})
//结算页面地址显示
server.get('/api/show_address_jiesuan',(req,res)=>{
    let sql='select * from c_user_address where uid=? and is_default=1'
    con.query(sql,[req.query.uid],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})

//商家
//展示goods表
server.get('/api/get_goods_by_cid',(req,res)=>{
    let sql='select * from goods where cid=?'
    con.query(sql,[req.query.cid],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})
//点击进入goods详情
server.get('/api/get_goods_byid',(req,res)=>{
    let sql='select * from goods where id=?'
    con.query(sql,[req.query.id],(err,result)=>{
        if(!err){
            res.json(result);
            // res.json({code:2,data:result,message:'ok'});
        }
    })
})
//通过goods 的id 来查找商店信息
server.get('/api/get_store_by_goodsid',(req,res)=>{
    let sql="select * from store where id = ?"
    con.query(sql,[req.query.id],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})
//获取商店信息
server.get('/api/get_store',(req,res)=>{
    let sql='select * from store where id=?'
    con.query(sql,[req.query.id],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})
///api/get_store_by_fenlei_id  通过分类id获取商店列表
server.get('/api/get_store_by_fenlei_id',(req,res)=>{
    let sql='select * from store where fenlei_id=?'
    con.query(sql,[req.query.fenlei_id],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})
//获取商家的所有goods
server.get('/api/get_goods_bysid',(req,res)=>{
    let sql='select * from goods where sid=?'
    con.query(sql,[req.query.sid],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})
//通过传过来的sid 来确定id对应的商店信息
server.get('/api/get_storeinfo_by_id',(req,res)=>{
    let sql='select * from store where id=?'
    con.query(sql,[req.query.id],(err,result)=>{
        if(!err){
            res.json(result);
        }
    })
})

server.listen(4445,()=>{
    console.log(`服务器启动在${port}端口`);
})