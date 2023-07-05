import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/video_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
              child:  Row(
                children: [
                  Text(
                    'Training',
                    style: GoogleFonts.quicksand(
                      fontSize: 25.sp,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20.sp,
                    color: AppColor.homePageIcons,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 20.sp,
                      color: AppColor.homePageIcons,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: AppColor.homePageIcons,
                  ),
                ],
              ),
            ),
             SizedBox(
              height: 15.h,
            ),
           Container(
             margin: EdgeInsets.only(left: 20.w, right: 20.w),
             child:  Row(
               children: [
                 Text(
                   'Your program',
                   style: GoogleFonts.quicksand(
                     fontSize: 20.sp,
                     color: AppColor.homePageSubtitle,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
                 Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/video');
                  },
                  child:  Text(
                    'Details',
                    style: GoogleFonts.quicksand(
                      fontSize: 20.sp,
                      color: AppColor.homePageDetail,
                    ),
                  ),
                ),
                 InkWell(
                   onTap: () {
                    Get.toNamed('/video');
                   },
                   child: Icon(
                     Icons.arrow_forward,
                     color: AppColor.homePageIcons,
                     size: 20.sp,
                   ),
                 ),
               ],
             ),
           ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              padding: EdgeInsets.all(15.sp),
              width: MediaQuery.of(context).size.width,
              height: 160.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.gradientFirst.withOpacity(0.8),
                      AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                    topRight: Radius.circular(80.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 20.sp,
                      color: AppColor.gradientSecond.withOpacity(0.2),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next workout',
                    style: GoogleFonts.quicksand(
                      fontSize: 15.sp,
                      color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Legs Toning \nand Glutes Workout',
                    style: GoogleFonts.quicksand(
                      fontSize: 20.sp,
                      color: AppColor.homePageContainerTextSmall,
                    ),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: AppColor.homePageContainerTextSmall,
                          ),
                          Text(
                            ' 60 min',
                            style: GoogleFonts.quicksand(
                              fontSize: 15.sp,
                              color: AppColor.homePageContainerTextSmall,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.gradientFirst,
                                blurRadius: 15.r,
                                offset: Offset(4, 8),
                              )
                            ]),
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 50.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5.h,
                bottom: 15.h,
                left: 20.w,
                right: 20.w
              ),
              height: 140.h,
              width: MediaQuery.of(context).size.width,
              //color: Colors.blue,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 110.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/card.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40.r,
                            offset: Offset(8, 10),
                            color: AppColor.gradientSecond.withOpacity(0.3),
                          ),
                          BoxShadow(
                            blurRadius: 10.r,
                            offset: const Offset(-1, -5),
                            color: AppColor.gradientSecond.withOpacity(0.3),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20.w,
                      right: 220.w,
                      top: 10.h,
                    ),
                    height: 200.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.r),
                        image: const DecorationImage(
                          image: AssetImage('assets/figure.png'),
                          //fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100.h,
                    margin:EdgeInsets.only(
                      left: 160.w,
                      top: 40.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great ',
                          style: GoogleFonts.quicksand(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.homePageDetail,
                            height:1.2,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Keep it up\nStick to your plan',
                            style: GoogleFonts.quicksand(
                              color: AppColor.homePagePlanColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child:  Row(
                children: [
                  Text(
                    'Area of foucus',
                    style: GoogleFonts.quicksand(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.homePageTitle,
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top:20.h),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0.sp,
                  mainAxisSpacing: 12.0.sp,
                  mainAxisExtent: 140.h,
                ),
                itemCount: info.length,
                itemBuilder:(_,index){
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          15.r,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(5, 5),
                            color: AppColor.gradientSecond.withOpacity(
                              0.1,
                            ),
                          ),
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(-5, -5),
                            color: AppColor.gradientSecond.withOpacity(
                              0.1,
                            ),
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(info[index]['img'],width: 80.w, height:80.h,fit: BoxFit.cover),
                        SizedBox(height:5.h,),
                        Text(
                          info[index]['title'],
                          style: GoogleFonts.quicksand(
                            fontSize: 20.sp,
                            color: AppColor.homePageDetail,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(height: 50.h,)
          ],
        ),
      ),
    );
  }
}
