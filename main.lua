require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "com.androlua.*"
import "java.io.File"--文件操作
import"http"--网络
import "layout"--布局
import "shell"--shell命令
import "java.io.*"--io文件
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)
activity.setContentView(loadlayout(layout))
--状态栏什么的
--exec("rm -r /data/data/com.zimperium.zanti/files/www/sharelisting.html")
--删除文件
--http.download("http://p4xzn4h3l.bkt.clouddn.com/sharelisting.zip","/storage/emulated/0/sharelisting.html")
--下载文件
--exec("chmod 777 /data/data/com.zimperium.zanti/files/www/sharelisting.html")
--修改权限
--下载anti.zip
--ZipUtil.unzip("/storage/emulated/0/anti.zip","/storage/emulated/0/")
--解压文件
--cp -r inpath outpath






--exec("路径或者命令",true,0)
--传入第一个变量是sh脚本路径或者shell命令
--如果第一个变量是sh脚本路径，那么第二个传入true，如果不是，则传入false
--第三个变量代表是否以root权限执行，传入0，代表不以root权限执行

--返回信息=exec("ps",false)  --以root权限执行ps命令
--返回信息=exec(activity.getLuaDir("shell.sh"),true,) --不以root权限执行工作目录下的shell.sh文件





if Build.VERSION.SDK_INT>=21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0XFF795548);
end
--设置ActionBar背景颜色
import "android.graphics.drawable.ColorDrawable"
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0XFF795548))
--自定义ActionBar标题颜色
import "android.text.SpannableString"
import "android.text.style.ForegroundColorSpan"
import "android.text.Spannable"
sp = SpannableString("特工使命简单修改")
sp.setSpan(ForegroundColorSpan(0xffffffff),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
activity.ActionBar.setTitle(sp)
import "android.content.Intent"--弹出QQ
import "android.net.Uri"--弹出QQ
function onCreateOptionsMenu(menu)
  menu.add("反馈")
  menu.add("关于与帮助")
end
function onOptionsItemSelected(item)
  if item.Title=="反馈" then
    url="mqqwpa://im/chat?chat_type=wpa&uin=1119101855"
    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
   elseif item.Title=="关于与帮助" then
    activity.newActivity("about")
  end
end
--跳转界面
t=Ticker()
t.Period=1000
t.start()
t.onTick=function()
  t.stop()
  if os.execute("su") then
    roottext.text="成功"
    roottext.textColor=0xff228B22
   else
    roottext.text="授权失败"
    roottext.textColor=0xffFF0000
  end
end

function getroot.onClick()
  if os.execute("su") then
    print"成功授予root权限"
    roottext.text="成功"
    roottext.textColor=0xff228B22
   else
    roottext.text="授权失败"
    print"root权限再次获取失败"
    roottext.textColor=0xffFF0000
  end
end
--命令

function exec(cmd,sh,su)
  cmd=tostring(cmd)
  if sh==true then
    cmd=io.open(cmd):read("*a")
  end
  if su==0 then
    p=io.popen(string.format('%s',cmd))
   else
    p=io.popen(string.format('%s',"su -c "..cmd))
  end
  local s=p:read("*a")
  p:close()
  return s
end

--进度条
function showProcessBar(text)
  jindu = ProgressDialog
  .show(activity, nil, text)
  jindu.setCancelable(true)
end
function GetFileSize(path)
  import "java.io.File"
  import "android.text.format.Formatter"
  size=File(tostring(path)).length()
  Sizes=Formatter.formatFileSize(activity, size)
  return Sizes
end




--是否有下载的文件

function hqjc()
  task(70,function()
    file=io.open(wj)
    io.input(file)
    jctext=io.read("*a")
    io.input(file)
    print(jctext)
  end)
end

--获取
--ZipUtil.unzip(activity.getLuaDir().."/savedata.zip","/sdcard/测试文件夹/")
--ZipUtil.unzip(activity.getLuaDir().."/savedata.zip","/data/user/0/com.esharo.Gun/")

hqjc()
function decompression.onClick()
  --hqjc()
  --LuaUtil.copyDir(wj,"/data/user/0/com.esharo.Gun/files/savedata.ini")
  --复制文件或文件夹，from 源路径，to 目标路径。
  exec("cp -r /storage/emulated/0/测试文件夹/savedata.ini /data/data/com.esharo.Gun/files/savedata.ini",false)

  --exec("cp -r /sdcard/测试文件夹/savedata.ini /sdcard/测试文件夹/saveda额ta.ini")

  --  exec("rm -r /data/data/com.esharo.Gun/files/sharelisting.html")
  --  exec("rm -r /data/data/com.esharo.Gun/files/",false)


  --  exec("rm-r /storage/emulated/0/AndLua/project/ZantiRS扩展安装/11/savedata.ini")
  --exec("rm-r /storage/emulated/0/AndLua/project/www.txt")
  -- File("/sdcard/测试文件夹/savedata.ini").renameTo(File("/data/user/0/com.esharo.Gun/files/savedata.ini"))
  -- File(activity.getLuaDir().."/savedata.ini").renameTo(File("/data/user/0/com.esharo.Gun/files/savedata.ini"))

  --exec("mv -r /storage/emulated/0/savedata.ini data/user/0/com.esharo.Gun/files/savedata.ini")
  --删除文件
  --LuaUtil.copyDir("/sdcard/测试文件夹/savedata.ini","/data/user/0/com.esharo.Gun/files/")
  --Shell
  --os.execute("mv ".."/sdcard/测试文件夹/savedata.ini".." ".."/data/user/0/com.esharo.Gun/files/savedata.ini")


  --ZipUtil.unzip(activity.getLuaDir().."/savedata.zip","/storage/emulated/0/")
  print"替换成功"

end
--卸载软件
import "android.net.Uri"
import "android.content.Intent"
包名="com.gun.modify"
uri = Uri.parse("package:"..包名)
intent = Intent(Intent.ACTION_DELETE,uri)
function xz.onClick()
  activity.startActivity(intent)
end

--[[
  if os.execute("su") then
    roottext.text="成功"
    roottext.textColor=0xff228B22
   else
    roottext.text="授权失败"
    roottext.textColor=0xffFF0000
  end
]]


function 监测()

  if GetFileSize("/data/data/com.esharo.Gun/files/savedata.ini")=="4.14 kB" then
    sharelistingtext.text="已安装"
    sharelistingtext.textColor=0xff228B22
   else
    print(GetFileSize("/data/data/com.esharo.Gun/files/savedata.ini"))
    sharelistingtext.text="未安装"
    sharelistingtext.textColor=0xffFF0000
  end
end
function jc.onClick()

  监测()
end


function bak.onClick()

  -- File("/storage/emulated/0/存档").mkdir()
  -- print("已经备份到/storage/emulated/0/存档/savedata.ini")
  --  exec("cp -r /data/data/com.esharo.Gun/files/savedata.ini /storage/emulated/0/存档/savedata.ini",false)

end


