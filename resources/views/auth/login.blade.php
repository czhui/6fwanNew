<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>后台登录</title>
  <style>
  body {
            color: #fff;
            font-size: 12px;
            font-family: "arial","微软雅黑";
            background: #f0f1f1;
        }
        #loginalert {
            width: 440px;
            background-color: rgba(255,255,255,.2);
            position: fixed;
            top: 15%;
            left: 50%;
            margin-left: -220px;
            z-index: 99;
        }
        .loginpd {
            /*border-bottom: 1px solid #ecf2f5;*/
        }
        .pd20 {
            padding: 0px;
        }
        .closealert {
            width: 20px;
            height: 20px;
        }
        .fr {
            float: right;
        }
        .clear {
            clear: both;
        }
        .loginwrap {
            width: 340px;
            margin: 0 auto;
        }
        .loginh {
            height: 40px;
            margin-top: 20px;
        }
        .loginh img{
            float: left;
            margin-left: 85px;
            margin-bottom: 10px;
            width: 50%;
        }
        .loginh .fl {
            font-size: 30px;
            line-height: 40px;
            margin-left: 77px;
        }
        .fl {
            float: left;
        }
        .loginh .fr {
            font-size: 18px;
            line-height: 50px;

        }
        .loginh .fr a {
            font-size: 18px;
            line-height: 50px;
            color: #FF4200;
            margin-left: 5px;
        }
        .loginwrap h3 {
            font-size: 14px;
            font-weight: 500;
            height: 20px;
            margin-top: 15px;
            color: #292929;
        }
        .loginwrap h3 span {
            font-size: 14px;
            font-weight: 500;
            height: 26px;
            color: #292929;
            display: block;
            float: left;
            line-height: 26px;
        }
        .loginwrap h3 span {
            font-size: 14px;
            font-weight: 500;
            height: 26px;
            color: #292929;
            display: block;
            float: left;
            line-height: 26px;
        }
        .logininput .loginusername {
            margin-top: 15px;
            margin-bottom: 10px;
        }
        .logininput input {
            -webkit-transition: all 0.2s ease-in;
            -moz-transition: all 0.2s ease-in;
            -o-transition: all 0.2s ease-in;
            transition: all 0.2s ease-in;
        }
        .loginsubmit input {
            width: 130px;
            height: 40px;
            line-height: 40px;
            color: #fff;
            background: #18a8bf;
            display: block;
            text-align: center;
            font-size: 20px;
            border: none;
            font-family: '微软雅黑';
            cursor: pointer;
            margin-left: 105px;
        }
        .logininput input {
            display: block;
            line-height: 14px;
            width: 100%;
            border: #DAE2E5 1px solid;
            text-indent: 10px;
            overflow: hidden;
            color: #979696;
            padding-top: 13px;
            padding-bottom: 13px;
        }
        .loginbtn {
            line-height: 70px;
            color: #6B6A6A;
        }
        .loginsubmit {
            width: 130px;
            height: 40px;
            margin: 15px 20px 0 0;
            position: relative;
        }
        .error {
  color: #f7001a;
  font-weight: bold;
}
  </style>
</head>
<body>
<div align="center" style=" position:fixed; left:0; top:0px; width:100%; height:100%;">
    <canvas id="q" height="1300" width="1920"></canvas>
</div>
<div id="loginalert">
    <div class="pd20 loginpd">
        <div class="loginwrap">
            <div class="loginh">
                <img src="{{asset('admin/img/logo-big.png')}}" alt="">
                <div class="fl" style="font-family: STXingkai;">管理后台登录</div>
                
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
            <form role="form" method="POST" action="{{url('/login')}}">
                {{ csrf_field() }}
                <div class="logininput">
                  <input type="text" placeholder="{{trans('validation.attributes.username')}}" name="{{config('admin.global.username')}}" class="loginusername" value="{{old(config('admin.global.username'))}}" placeholder="用户"/>
                    @if ($errors->has(config('admin.global.username')))
                    <p class="error">
                      <em>{{ $errors->first(config('admin.global.username')) }}</em>
                    </p>
                    @endif
                  <input type="password" placeholder="{{trans('validation.attributes.password')}}" name="password" class="loginuserpasswordt" placeholder="密码"/>
                  @if ($errors->has('password'))
                  <p class="error">
                    <em>{{ $errors->first('password') }}</em>
                  </p>
                  @endif
                </div>
                <div class="loginbtn">
                    <div class="loginsubmit fl">
                        <input type="submit" value="登录"  style="pointer-events: auto;">
                        <div class="loginsubmiting">
                            <div class="loginsubmiting_inner"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
         <h3><i class="closealert fr" style=""></i>
            <div class="clear"></div>
        </h3>
    </div>
</div>

  <script src="{{asset('vendors/jquery/jquery-2.1.1.js')}}"></script>
  <script>
    /*
     11     ① 用setInterval(draw, 33)设定刷新间隔
     12
     13     ② 用String.fromCharCode(1e2+Math.random()*33)随机生成字母
     14
     15     ③ 用ctx.fillStyle=’rgba(0,0,0,.05)’; ctx.fillRect(0,0,width,height); ctx.fillStyle=’#0F0′; 反复生成opacity为0.5的半透明黑色背景
     16
     17     ④ 用x = (index * 10)+10;和yPositions[index] = y + 10;顺序确定显示字母的位置
     18
     19     ⑤ 用fillText(text, x, y); 在指定位置显示一个字母 以上步骤循环进行，就会产生《黑客帝国》的片头效果。
     20 */
    $(document).ready(function() {
        //设备宽度
        var s = window.screen;
        var width = q.width = s.width;
        var height = q.height;
        var yPositions = Array(300).join(0).split('');
        var ctx = q.getContext('2d');

        var draw = function() {
            ctx.fillStyle = 'rgba(0,0,0,.05)';
            ctx.fillRect(0, 0, width, height);
            ctx.fillStyle = '#18a8bf';/*代码颜色*/
            ctx.font = '10pt Georgia';
            yPositions.map(function(y, index) {
                text = String.fromCharCode(1e2 + Math.random() * 330);
                x = (index * 10) + 10;
                q.getContext('2d').fillText(text, x, y);
                if (y > Math.random() * 1e4) {
                    yPositions[index] = 0;
                } else {
                    yPositions[index] = y + 10;
                }
            });
        };
        RunMatrix();
        function RunMatrix() {
            Game_Interval = setInterval(draw,30);
        }
    });
</script>
</body>
</html>