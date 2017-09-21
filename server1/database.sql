DROP TABLE IF EXISTS user;
CREATE TABLE user(
  id int (12) PRIMARY KEY AUTO_INCREMENT,
  account VARCHAR (255) UNIQUE
)DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS c_user;
CREATE TABLE c_user(
  id int (12) PRIMARY KEY AUTO_INCREMENT,
  account VARCHAR (255) UNIQUE,
  pass VARCHAR (255)
)DEFAULT CHARSET=utf8;

--商店表
DROP TABLE IF EXISTS store;
CREATE TABLE store(
  id int (12) PRIMARY KEY AUTO_INCREMENT,
  fenlei_id  int(12),
  name VARCHAR (255),
  info VARCHAR (255),
  pic VARCHAR (255),
  logo_pic VARCHAR (255)
)DEFAULT CHARSET=utf8;
INSERT INTO store(id,fenlei_id,name,info,pic,logo_pic)
VALUES
(1,0,'贝德玛聚美官方旗舰店','精华面膜专家','/static/img/yald1.jpg','/static/img/yald1.jpg'),
(2,0,'AHC极速免税店','盈亮秀发之吕始于健康头皮','/static/img/yald1.jpg','/static/img/yald1.jpg'),
(3,0,'Lacoste旗舰店','鳄鱼皮鞋','/static/img/yald1.jpg','/static/img/yald1.jpg'),

(4,4,'天使格格','秋装尚新抢鲜购','/static/img/nvlogo1.jpg','/static/img/smalllogo1.jpg'),
(5,4,'吕小兔品牌团','仲享钜惠 秋尚新','/static/img/lvxiaotu1.jpg','/static/img/lvxiaotulogo.jpg'),
(6,4,'卓语姿','细腻灵动 脱俗有调','/static/img/zhuoyuzi1.jpg','/static/img/zhuoyuzilogo.jpg'),

(7,5,'懒妞女包专场','懒牛女包专场','/static/img/lanniu1.jpg','/static/img/lanniulogo.jpg'),
(8,5,'雅诗罗品牌团','雅诗罗 秋冬新品首发','/static/img/yashiluo1.jpg','/static/img/yashiluologo.jpg'),
(9,5,'柒格格品牌团','柒格格女包品牌专场','/static/img/qigege1.jpg','/static/img/qigegelogo.jpg'),

(10,1,'秋尚新女装品牌团','木果果木品牌团','/static/img/tomorrow1.jpg','/static/img/lanniulogo.jpg'),
(11,1,'贝德玛品牌专场','贝德玛品牌专场','/static/img/tomorrow3.jpg','/static/img/yashiluologo.jpg'),
(12,1,'明星香水精选','明星香水精选大赏','/static/img/tomorrow2.jpg','/static/img/qigegelogo.jpg'),
(13,1,'口碑洁面单品专场','口碑洁面单品专场','/static/img/tomorrow4.jpg','/static/img/lanniulogo.jpg'),

(14,3,'德国爱他美专场','德国爱他美专场','/static/img/aitamei1.jpg','/static/img/aitameilogo.jpg'),
(15,3,'惠氏奶粉专场','惠氏奶粉专场','/static/img/huishi1.jpg','/static/img/huishilogo.jpg'),
(16,3,'宝然宝宝服特卖','宝然宝宝服特卖','/static/img/baoran1.jpg','/static/img/baoranlogo.jpg'),
(17,3,'花王天天特卖','花王天天特卖','/static/img/huawang1.jpg','/static/img/huawanglogo.jpg');


--商店目录表
DROP TABLE IF EXISTS categorys;
CREATE TABLE categorys(
 id int (12) PRIMARY KEY AUTO_INCREMENT,

)DEFAULT CHARSET=utf8;

--商品表
DROP TABLE IF EXISTS goods;
CREATE TABLE goods(
  id int(12) PRIMARY KEY AUTO_INCREMENT,
  sid int(12),
  cid int(12),
  name VARCHAR (255),
  pic VARCHAR (255),
  info VARCHAR (255),
  detail_info VARCHAR (255),
  original_price VARCHAR (255),
  now_price VARCHAR (255)
)DEFAULT CHARSET=utf8;
INSERT INTO goods(id,sid,cid,name,pic,info,detail_info,original_price,now_price)
VALUES
(1,1,1,'雅诗兰黛专卖店','/static/img/yald1.jpg','美国•雅诗兰黛(Estee Lauder)紧实抗皱竹粹水 30ml','美国•雅诗兰黛（Estee Lauder）肌透修护眼部精华霜15ml，深透眼部肌底，一瓶修护，日常所引起的干燥、暗沉、细纹、松弛、黑眼圈、等眼周问题，抵御并防护光污染对眼周肌底的损伤，修护累积损；更精准校对眼周代谢节律，同步放大自身修护力。',453,332),
(2,2,1,'贝德玛官方旗舰店','/static/img/yald1.jpg','法国•【敏感肌必备】贝德玛舒妍卸妆水,卸除彩妆残留,卸妆+护肤一起搞定!','贝德玛舒妍多效洁肤液250ml，卸妆、舒缓、洁肤、补水四效合一，亲近皮肤，可用来卸脸部和眼部彩妆，水般清爽质地，不含色素、香料、酒精、皂剂和防腐剂，轻轻一抹，去除面部彩妆及污垢，无需水洗。天然青瓜植物精华舒缓肌肤，保湿洁肤。',225,157),
(3,3,1,'Lacoste旗舰店','/static/img/yald1.jpg','美国•【百搭经典款】Lacoste鳄鱼小白鞋,舒适耐穿有质感,穿出法式优雅风!','法国•Lacoste 经典男士休闲鞋  Keston Lms Lem Lt 休闲鞋  褐色/绿色',1225,890),
(4,4,1,'Lacoste旗舰店','/static/img/yald1.jpg','天使格格韩版新款弹力小脚牛仔裤','天使格格蓝色详情实拍韩版新款弹力修身毛边小脚牛仔裤女长裤秋装',321,231),

(5,1,2,'贝德玛官方旗舰店','/static/img/beidema1.jpg','法国•【敏感肌必备】贝德玛舒妍卸妆水,卸除彩妆残留,卸妆+护肤一起搞定!','无需洪荒之力即可卸掉彩妆——贝德玛深层舒妍卸妆水500ml，生物胶束科技，卸除彩妆+清洁污垢，轻松一抹，肌肤清爽洁净！深层修护肌肤，黄瓜精华补水。卸妆、洁面、舒缓、保湿四效合一，开创卸妆新“净”界！（多款包装随机发货）',453,332),
(6,2,2,'BeautyBuffet','/static/img/beauty1.jpg','【拯救黄皮妹】BeautyBuffet牛奶洗面奶, 给肌肤喝牛奶,洗走污垢白透亮!','泰国人气护肤品牌——BeautyBuffet浓密牛奶洗面奶，洗出嫩滑“牛奶肌”！洁面也能如此“温柔”，氨基酸配方温和无刺激；牛奶蛋白&辅酶Q10双重滋养，肌肤洁净不紧绷！甜甜牛奶味~~不要贪杯，留给肌肤“喝”哟！弹、润、嫩、滑，肌肤尽享牛奶浴！',225,157),
(7,3,2,'露华浓(Revlon)','/static/img/luhua1.jpg','【24H持久】露华浓不脱色粉底液，持妆一整天，不脱色，才出色！','露华浓(Revlon)不脱色粉底液30ml，露华浓明星产品！粉底界开山鼻祖。轻轻一抹，轻松打造不脱色瞬间。质地细腻，提亮肤色，遮瑕痘印，隔离防晒。多色号可选。​控油、遮瑕、提亮、保湿 ，匀净无瑕，妆容精致一整天！',1225,890),
(8,4,2,'Lacoste旗舰店','/static/img/jingtian1.jpg','日本•【日系国民蜜粉】井田棉花糖控油蜜粉饼，打造雾面无妆感的自然美肌！','日本•为啥你的底妆总是不自然，涂个隔离都变大白脸？！你少了蜜粉定妆！CANMAKE棉花糖蜜粉饼，赢过其他产品的细腻糯粉，妆后轻轻一拍立刻呈现无妆感效果，雾面哑光控油告别暗沉脱妆；提亮肤色，遮盖肤色不均和毛孔，打造让他忍不住轻抚的棉花糖般明亮美肌！',321,231);
--推荐位cid1是大图  推荐位cid2是小图
--顾客地址信息表
DROP TABLE  IF EXISTS  c_user_address;
CREATE TABLE c_user_address(
  id int(12) PRIMARY KEY AUTO_INCREMENT,
  uid int(12),
  name VARCHAR (255),
  address VARCHAR (255),
  phone VARCHAR (255),
  is_default int(12) DEFAULT 0
)DEFAULT CHARSET=utf8;
INSERT INTO  c_user_address(id,uid,name,address,phone)
VALUES
(1,1,'杨博','太原市',18404905852);

--顾客地址

--订单表
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
id int(12) PRIMARY KEY AUTO_INCREMENT,
uid int (12),
sid int (12),
ctime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
state int(12) DEFAULT 0,
address_id int(12)
)DEFAULT CHARSET=utf8;
INSERT INTO orders(id,uid,state,address_id)
VALUES
(1,1,1,1);

--
DROP TABLE IF EXISTS order_goods;
CREATE TABLE order_goods(
  id int(12) PRIMARY KEY AUTO_INCREMENT,
  oid int(12),
  gid int(12),
  num int(12)
)DEFAULT CHARSET=utf8;