import random
import string,os,hashlib,time
from io import BytesIO
from flask import make_response,session
# Image：一个画布
# ImageDraw：一个画笔
# ImageFont:画笔的字体
from PIL import Image,ImageDraw,ImageFont

# Captcha验证码

class Captcha(object):
        __config = {
            'seKey'  : 'www.echo500.com',
            # # 验证码加密密钥
            'codeSet'  : '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY',
            # 验证码字符集合
            'expire' : 1800,
            # 验证码过期时间（s）
            'useZh'    : False,
            # 使用中文验证码
            'zhSet'    : '们以我到他会作时要动国产的一是工就年阶义发成部民可出能方进在了不和有大这长之物然猜'
                         '主中人上为来分生对于学下级地个用同行面说种过命度革而多子后自社加小机也经力线本电高量'
                         '党得实家定深法表着水理化争现所二起政三好十战无农使性前等反体合斗路图把结第里正新开论'
                         '从当两些还天资事队批点育重其思与间内去因件日利相由压员气业代全组数果期导平各基或月毛'
                         '如应形想制心样干都向变关问比展那它最及外没看治提五解系林者米群头意只明四道马认次文通'
                         '但条较克又公孔领军流入接席位情运器并飞原油放立题质指建区验活众很教决特此常石强极土少'
                         '已根共直团统式转别造切九你取西持总料连任志观调七么山程百报更见必真保热委手改管处己将'
                         '修支识病象几先老光专什六型具示复安带每东增则完风回南广劳轮科北打积车计给节做务被整联'
                         '步类集号列温装即毫知轴研单色坚据速防史拉世设达尔场织历花受求传口断况采精金界品判参层'
                         '止边清至万确究书术状厂须离再目海交权且儿青才证低越际八试规斯近注办布门铁需走议县兵固'
                         '除般引齿千胜细影济白格效置推空配刀叶率述今选养德话查差半敌始片施响收华觉备名红续均药'
                         '标记难存测士身紧液派准斤角降维板许破述技消底床田势端感往神便贺村构照容非搞亚磨族火段'
                         '算适讲按值美态黄易彪服早班麦削信排台声该击素张密害侯草何树肥继右属市严径螺检左页抗苏'
                         '显苦英快称坏移约巴材省黑武培著河帝仅针怎植京助升王眼她抓含苗副杂普谈围食射源例致酸旧'
                         '却充足短划剂宣环落首尺波承粉践府鱼随考刻靠够满夫失包住促枝局菌杆周护岩师举曲春元超负'
                         '砂封换太模贫减阳扬江析亩木言球朝医校古呢稻宋听唯输滑站另卫字鼓刚写刘微略范供阿块某功'
                         '套友限项余倒卷创律雨让骨远帮初皮播优占死毒圈伟季训控激找叫云互跟裂粮粒母练塞钢顶策双'
                         '留误础吸阻故寸盾晚丝女散焊功株亲院冷彻弹错散商视艺灭版烈零室轻血倍缺厘泵察绝富城冲喷'
                         '壤简否柱李望盘磁雄似困巩益洲脱投送奴侧润盖挥距触星松送获兴独官混纪依未突架宽冬章湿偏'
                         '纹吃执阀矿寨责熟稳夺硬价努翻奇甲预职评读背协损棉侵灰虽矛厚罗泥辟告卵箱掌氧恩爱停曾溶'
                         '营终纲孟钱待尽俄缩沙退陈讨奋械载胞幼哪剥迫旋征槽倒握担仍呀鲜吧卡粗介钻逐弱脚怕盐末阴'
                         '丰雾冠丙街莱贝辐肠付吉渗瑞惊顿挤秒悬姆烂森糖圣凹陶词迟蚕亿矩康遵牧遭幅园腔订香肉弟屋'
                         '敏恢忘编印蜂急拿扩伤飞露核缘游振操央伍域甚迅辉异序免纸夜乡久隶缸夹念兰映沟乙吗儒杀汽'
                         '磷艰晶插埃燃欢铁补咱芽永瓦倾阵碳演威附牙芽永瓦斜灌欧献顺猪洋腐请透司危括脉宜笑若尾束'
                         '壮暴企菜穗楚汉愈绿拖牛份染既秋遍锻玉夏疗尖殖井费州访吹荣铜沿替滚客召旱悟刺脑措贯藏敢'
                         '令隙炉壳硫煤迎铸粘探临薄旬善福纵择礼愿伏残雷延烟句纯渐耕跑泽慢栽鲁赤繁境潮横掉锥希池'
                         '败船假亮谓托伙哲怀割摆贡呈劲财仪沉炼麻罪祖息车穿货销齐鼠抽画饲龙库守筑房歌寒喜哥洗蚀'
                         '废纳腹乎录镜妇恶脂庄擦险赞钟摇典柄辩竹谷卖乱虚桥奥伯赶垂途额壁网截野遗静谋弄挂课镇妄'
                         '盛耐援扎虑键归符庆聚绕摩忙舞遇索顾胶羊湖钉仁音迹碎伸灯避泛亡答勇频皇柳哈揭甘诺概宪浓'
                         '岛袭谁洪谢炮浇斑讯懂灵蛋闭孩释乳巨徒私银伊景坦累匀霉杜乐勒隔弯绩招绍胡呼痛峰零柴簧午'
                         '跳居尚丁秦稍追梁折耗碱殊岗挖氏刃剧堆赫荷胸衡勤膜篇登驻案刊秧缓凸役剪川雪链渔啦脸户洛'
                         '孢勃盟买杨宗焦赛旗滤硅炭股坐蒸凝竟陷枪黎救冒暗洞犯筒您宋弧爆谬涂味津臂障褐陆啊健尊豆'
                         '拔莫抵桑坡缝警挑污冰柬嘴啥饭塑寄赵喊垫丹渡耳刨虎笔稀昆浪萨茶滴浅拥穴覆伦娘吨浸袖珠雌'
                         '妈紫戏塔锤震岁貌洁剖牢锋疑霸闪埔猛诉刷狠忽灾闹乔唐漏闻沈熔氯荒茎男凡抢像浆旁玻亦忠唱'
                         '蒙予纷捕锁尤乘乌智淡允叛畜俘摸锈扫毕璃宝芯爷鉴秘净蒋钙肩腾枯抛轨堂拌爸循诱祝励肯酒绳'
                         '穷塘燥泡袋朗喂铝软渠颗惯贸粪综墙趋彼届墨碍启逆卸航衣孙龄岭骗休借',
            # 中文验证码字符串
            'useImgBg' : False,
            # 使用背景图片
            'fontSize' : 22,
            # 验证码字体大小(px)
            'useCurve' : 0,
            # 是否画混淆曲线
            'useNoise' : False,
            # 是否添加杂点
            'imageH'   : 0,
            # 验证码图片高度
            'imageW'   : 0,
            # 验证码图片宽度
            'length'   : 4,
            # 验证码位数
            'fontttf'  : None,
            # 验证码字体，不设置随机获取
            'reset'    : True,
            # 验证成功后是否重置
            'codeSave'  :'session'
        }

        def __init__(self, config={}):
            self.__config.update(config)
            super(Captcha,self).__init__()

        def __getattr__(self, item):
            return self.by_confkey_get(item)

        def __setattr__(self, key, value):
            self.by_confkey_set(key,value)

        # 获取验证码配置
        def by_confkey_get(self,key):
            return self.__config.get(key)

        # 设置验证码配置
        def by_confkey_set(self,key,value):
            if key in self.__config:
                self.__config[key] = value

        # 生成随机的颜色
        def __gene_random_color(cls, start=0, end=255):
            random.seed()
            return (random.randint(start, end), random.randint(start, end), random.randint(start, end))

        # 生存随机字体
        def __gene_random_font(self):
            ttfPath = os.path.realpath(__file__ + '/../')
            ttfPath += '/zhttfs/' if self.useZh else '/ttfs/'
            if self.fontttf is None:
                if os.path.exists(ttfPath):
                    fontttf = random.choice(os.listdir(ttfPath))
                else:
                    raise ValueError(ttfPath + '：这个路径不存在！')
            else:
                fontttf = self.fontttf
            path = ttfPath + fontttf
            return path
        # 生存随机字符串
        def gene_text(self):
            if (self.useZh):
                # 中文列表
                SOURCE = list(self.zhSet)
            else:
                # a-b A-B 列表
                SOURCE = list(string.ascii_letters)
                # 数字加入进去
                for index in range(0, 10):
                    SOURCE.append(str(index))
            return ''.join(random.sample(SOURCE, self.length))

        # 混淆曲线
        def __gene_line(self,draw, width, height):
            begin = (random.randint(0, width), random.randint(0, height))
            end = (random.randint(0, width), random.randint(0, height))
            draw.line([begin, end], fill=self.__gene_random_color(), width=2)
            # 用来绘制干扰点

        # 杂点
        def __gene_points(self, draw, point_chance, width, height):
            chance = min(100, max(0, int(point_chance)))  # 大小限制在[0, 100]
            for w in range(width):
                for h in range(height):
                    tmp = random.randint(0, 100)
                    if tmp > 100 - chance:
                        draw.point((w, h), fill=self.__gene_random_color())
        # 加密验证码
        def __authcode(self,str):
            key = self.md5(self.seKey)[5:8]
            str = self.md5(str)[8:10]
            return self.md5(key+str)
        # md5加密
        def md5(self,str):
            hl = hashlib.md5()
            hl.update(str.encode(encoding='utf-8'))
            str = hl.hexdigest()
            return str

        '''
         * 验证验证码是否正确
         * @access public
         * @param string $code 用户验证码
         * @return bool 用户验证码是否正确
       '''
        def check(self,code):
            key   =  self.__authcode(self.seKey)
            secode  = session.get(key)
            code = code.lower()
            # 验证码不能为空
            if code is None or secode is None:
                return False
            # session过期
            if int(time.time() - secode['verify_time']) > self.expire:
                session.pop(key)
                return False
            if self.__authcode(code) == secode['verify_code']:
                # 验证成功重置
                if self.reset:
                    session.pop(key)
                return True
            return False
        def entry(self):
            # 验证码图片的宽和高
            self.imageW = self.imageW if self.imageW else self.length*self.fontSize*1.0+self.length*self.fontSize/2
            self.imageH = self.imageH if self.imageH else self.fontSize * 1.5
            image = Image.new('RGBA', (int(self.imageW), int(self.imageH)), self.__gene_random_color(0, 100))
            # # 验证码的字体
            font = ImageFont.truetype(self.__gene_random_font(),self.fontSize)
            # 创建画笔
            draw = ImageDraw.Draw(image)
            # # 生成字符串
            text = self.gene_text()
            # # 获取字体的尺寸
            font_width, font_height = font.getsize(text)

            # # 填充字符串
            draw.text(((self.imageW - font_width) / 2, (self.imageH - font_height) / 2), text, font=font,
                      fill=self.__gene_random_color(150, 255))
            # # 绘制混淆曲线
            if self.useCurve:
                for x in range(0, self.useCurve):
                    self.__gene_line(draw, int(self.imageW), int(self.imageH))
            # # 绘制杂点
            if self.useNoise:
                self.__gene_points(draw, 10, int(self.imageW), int(self.imageH))
            # 保存验证码
            key         = self.__authcode(self.seKey)
            code        = self.__authcode(text.lower())
            secode      = {}
            secode['verify_code']  = code
            secode['verify_time'] = time.time()
            session[key] = secode
            out = BytesIO()
            image.save(out, 'png')
            out.seek(0)
            resp = make_response(out.read())
            resp.content_type = 'image/png'
            return resp






