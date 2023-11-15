import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tasker/provider/theme_provider.dart';

class AppStringsDir {
  static const urlbase="http://192.168.1.16:5000";
static MainAxisAlignment mainAxisAlignment(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?MainAxisAlignment.end:MainAxisAlignment.start;
static  TextDirection textDirection(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?TextDirection.ltr:TextDirection.rtl;
static  TextDirection textDirection1(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?TextDirection.rtl:TextDirection.ltr;
static  int rotate(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?2:0;
static  AlignmentGeometry rtl(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?Alignment.centerLeft:Alignment.centerRight;
static  AlignmentGeometry rtl1(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?Alignment.centerRight:Alignment.centerLeft;
static  String entar(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"en":"ar";
static  String date(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Date":"التاريخ";
static String Yourrating(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Your rating":"تقييمك!";
static String sendotp(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Send verification code":"إرســــال رمــــــز الـــتـــحـــقـق";
static String welcome(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"welcome":"ياهــلا وســهلا";
static String happyday(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Happy Day Sara!":"يــوم سعيــد ســارة!";
static String WelcometoTasker(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Welcome to Tasker":"ياهلا بك في تاسكر";
static String begin2(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Tasker is a smart task management app that can be used to organize and track personal and professional tasks and activities":"تاسكر هو تطبيق ادارة المهام الذكي الذي يمكن استخدامه لتنظيم وتتبع المهام والانشطه الشخصيه والمهنيه";
static String login(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"login":"تسجيل دخول";
static String email(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"E-mail":"البريد الالكتروني";
static String name(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"name":"الاسم";
static String pass(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"password":"كلمة المرور";
static String forgetpass(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Forgot your password":"نسيت كلمة المرور؟";
static String goahead(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"You are now ready to use Tasker":"انت الان مستعد لاستخدام تاسكر";
static String enteropt(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Enter code OTP":"ادخل كود OTP";
static String next(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"next":"التالي";
static String textreceive(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Enter the code you received via text message":"أدخل الرمز الذي تلقيته عبر رسالة نصية";
static String changepass(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"change password":"تغيير كلمة المرور";
static String Newpass(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"New password":"كلمة المرورجديدة";
static String confirmpassword(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"confirm password":"تأكيد كلمة المرور";
static String dontworry(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Don't worry . Simply enter your phone number and we will send a verification number":"لا تقلق . ما عليك سوي كتابة رقم هاتفك وسنرسل رقم التحقق";
static String textpass(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Create a new password to log in":"قم بإنشاء كلمة مرور جديدة لتسجيل الدخول";
static String Overview(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Overview":"نظرة عامة";
static String statistics(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"statistics":"احصائيات";
static String Systemsandoperation(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Systems and operation":"الانظمة والتشغيل";
static String Digitaltransformation(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Digital transformation":"التحول الرقمي";
static String Infrastructure(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Infrastructure":"البنية التحتية";
static String task(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"task":"مهمة";
static String Completedtasksforthismonth(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Completed tasks for this month":"المهام المكتمله لهذا الشهر";
static String Assigningnewtasks(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Assigning new tasks":"اسناد مهام جديدة";
static String Approval(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Approval of tasks":"اعتماد المهام";
static String MeetingwiththeFinanceDepartment(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Meeting with the Finance Department":"اجتماع مع قسم المالية";
static String MeetingwiththeCyberSecurityDepartment(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Meeting with the Cyber Security Department":"اجتماع مع ادارة الامن السيبراني";
static String Assessingtasks(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Assessing tasks":"تقييم المهام";
static String Theattachedfile(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"The attached file":"الملف المرفق";
static String cancellation(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"cancellation":"الغاء";
static String Download(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Download":"تحميل";
static String comments(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"comments":"ملاحظات";
static String Profilepersonly(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Profile personly":"الملف الشخصي";
static String Mypersonalinformation(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"My personal information":"معلوماتي الشخصية";
static String loginn(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"login":"تسجيل";
static String Applicationsettings(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Application settings":"اعدادات التطبيق";
static String signout(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"sign out":"تسجيل الخروج";
static String language(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"language":"اللغة";
static String Nightmode(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Night mode":"الوضع الليلي";
static String LogoutofTasker(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Log out of Tasker":"تسجيل الخروج من تاسكر";
static String Tasktitle(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Task title":"عنوان المهمه";
static String SelectManagerEmployee(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Select Manager\\Employee":"اختر المدير \\ الموظف";
static String startingdate(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"starting date":"تاريخ البدء";
static String Expirydate(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Expiry date":"تاريخ الانتهاء";
static String Taskpriority(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Task priority":"اولوية المهمة";
static String Low(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Low":"منخفضة";
static String middle(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"middle":"متوسط";
static String High(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"High":"عالية";
static String Descriptionofthetask(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Description of the task":"وصف المهمه";
static String numofsubtask(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"number Of SubTask":"عدد مراحل المهمه";

static String Submitassignment(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Submit assignment":"ارسال المهمة";
static String Submitassignment1(BuildContext context)=>Provider.of<ThemeProvider>(context,listen: false).lan?"sent delivered handed":"تم التسليم";
static String Submitassignment2(BuildContext context)=>Provider.of<ThemeProvider>(context,listen: false).lan?"has been sent":"تم الارسال";
static String condition(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"condition":"الحالة";
static String search(BuildContext context)=>Provider.of<ThemeProvider>(context,listen: false).lan?"search":"البحث";
static String Complete(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Complete":"مكتملة";
static String notcomplete(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"not complete":"غير مكتملة";
static String Edittasks(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Edit tasks":"تعديل المهام";
static String Tasksinprogress(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Tasks in progress":"مهام قيد التنفيذ";
static String Taskscompleted(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Tasks completed":"المهام المنجزة";
static String Mytasks(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"My tasks":"مهامي";
static String Taskdetails(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Task details":"تفاصيل المهمه";
static String Therestofthework(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"The rest of the work":"المتبقي من العمل";
static String addition(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"addition":"اضافة";
static String delete(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"delete":"الحذف";
static String alltaskes(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"View all tasks":"عـــرض كـــل الـمــهـــام";
static String phone(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"+966 66666 66666":"رقم الهاتف";
static String Delivery(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Delivery":"تسليم";
static String Addtaskdetails(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Add task details":"اضافة تفاصيل المهمه";
static String Addmore(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Add more":"اضافة المزيد";
static String Recordtaskhistory(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Record task history":"سجل تاريخ المهام";
static String finished(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"finished":"تم الانتهاء";
static String inprogress (BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"in progress":"قيد التنفيذ";
static String Unfinished(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Unfinished":"غير منجز";
static String Annualstatistics(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Annual statistics":"الإحصائية السنويه";
static String Historyoftasks(BuildContext context)=>Provider.of<ThemeProvider>(context,listen: false).lan?"History of tasks":"سجل المهام";
static String Completed(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Completed":"منجزة";
static String Assignedtasks(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Assigned tasks":"المهام المسندة";
static String Theremainingtimeforthetask(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"The remaining time for the task":"الوقت المتبقي للمهمة";
static String DeliveryTask(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Delivery Task":"تــسليــم المـهمــة";
static String tasks(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"tasks":"المهام";
static String day(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"today":"اليوم";
static String month(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"month":"الشهر";
static String Congratulations(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Congratulations!":"تهانينا!";
static String hour(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"hour":"الساعه";
static String add(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Add a task":"إضافة مهمة";
static String follow(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Track tasks":"تتبع المهام";
static String edit(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Modify a task":"تعديل مهمة";
static String ManagerEmployee(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Manager/Employee":"المدير / الموظف";
static String suspended(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"suspended":"معلقة";
static String Rememberme(BuildContext context)=>Provider.of<ThemeProvider>(context).lan?"Remember me":"تذكرني";

}