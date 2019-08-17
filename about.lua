require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

about1={
  DrawerLayout;
  id="drawer";
  {
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    layout_height="fill";
    {
      LinearLayout;
      layout_height="40dp";
      layout_width="-1";
      Elevation="3dp";
      background="#795548";
      orientation="horizontal";
      {
        TextView;
        layout_height="-1";
        gravity="center";
        layout_width="-1";
        textColor="#ffffff";
        layout_weight="1";
        id="c1";
        text="关于";
        layout_gravity="center";
      };
      {
        TextView;
        layout_height="-1";
        gravity="center";
        layout_width="-1";
        textColor="#ffffff";
        layout_weight="1";
        id="c2";
        text="帮助";
        layout_gravity="center";
      };
    };
    {
      AbsoluteLayout;
      layout_height="2dp";
      background="#795548";
      layout_width="-1";
      Elevation="3dp";
      {
        TextView;
        layout_height="-1";
        background="#ffffff";
        layout_width="50%w";
        id="bq";
      };
    };
    {
      PageView;
      layout_height="fill";
      id="pagev";
      -- layout_marginTop="56dp";
      layout_width="fill";
      pages={
        {
          LinearLayout;
          layout_height="fill";
          orientation="vertical";
          layout_width="fill";
          layout_height="fill";
          {
            LinearLayout;
            layout_width="fill";
            layout_height="fill";
            --horizontalSpacing="5dp",
            --verticalSpacing="5dp",
            --FastScrollEnabled=true;
            background="#ffffff";
            {
              FrameLayout;
              layout_width="fill";
              layout_height="fill";
              {
                LinearLayout;
                layout_height="wrap";
                layout_width="wrap";
                layout_gravity="center|top";
                {
                  FrameLayout;
                  layout_height="70dp";
                  layout_width="fill";
                  layout_marginTop="30dp";
                  {
                    TextView;
                    text="简单修改";
                    layout_gravity="center";
                  };
                  {
                    TextView;
                    text="版本:1.0.0";
                    layout_gravity="center|bottom";
                  };
                };
              };
              {
                LinearLayout;
                layout_marginTop="150dp";
                layout_height="wrap";
                layout_width="fill";
                -- layout_gravity="bottom";
                layout_marginLeft="5dp";
                {
                  LinearLayout;
                  layout_height="fill";
                  orientation="vertical";
                  layout_width="fill";
                  {
                    LinearLayout;
                    layout_width="fill";
                    layout_height="70dp";
                    {
                      CardView;
                      layout_gravity="center";
                      layout_width="50dp";
                      CardElevation="3dp";
                      layout_height="50dp";
                      radius="25dp";
                      {
                        ImageView;
                        layout_height="60dp";
                        layout_width="60dp";
                        src="sj.jpg";
                        layout_gravity="center";
                      };
                    };
                    {
                      TextView;
                      text="软件作者";
                      layout_marginLeft="20dp";
                      layout_gravity="center";
                    };
                  };



                  {
                    LinearLayout;
                    layout_marginTop="100dp";
                    layout_gravity="center|bottom";

                    {
                      TextView;
                      text="祝大家生活愉快~！😁";
                      id="gw";
                    };
                  };
                };
              };
            };
          };
        },
        {
          LinearLayout;
          layout_height="fill";
          orientation="vertical";
          layout_width="fill";
          layout_height="fill";
          {
            LinearLayout;
            layout_width="fill";
            layout_height="fill";
            background="#ffffff";
            --horizontalSpacing="5dp",
            --verticalSpacing="5dp",
            --FastScrollEnabled=true;


            {
              TextView;
              text=[==[软件的原理是什么？修改文件]==];
              layout_margin="15dp";
              textSize="16dp";
            };

          };
        };
      };
    };
  };
};

activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)
activity.setContentView(loadlayout(about1))
--ActionBar返回按钮
activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  activity.finish()
end
--状态栏什么的
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
sp = SpannableString("关于与帮助")
sp.setSpan(ForegroundColorSpan(0xffffffff),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
activity.ActionBar.setTitle(sp)
activity.ActionBar.setElevation(0)
--滑动布局切换条
pagev.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    if b==0 then
      return true
    end
    bq.setX(activity.getWidth()/2*b)
  end})
--按钮切换界面
c1.onClick=function()
  pagev.showPage(0)
end
c2.onClick=function()
  pagev.showPage(1)
end
import "android.graphics.Paint"
--设置下划线
gw.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )
--设置加粗
gw.getPaint().setFakeBoldText(true)
import "android.content.Intent"
import "android.net.Uri"
url="mqqwpa://im/chat?chat_type=wpa&uin=1119101855"
viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
function gw.onClick()
  activity.startActivity(viewIntent)

end