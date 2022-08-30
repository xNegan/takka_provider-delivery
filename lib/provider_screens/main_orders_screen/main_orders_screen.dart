
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../global_widgets/text_custom.dart';
import '../../uitls/app_colors.dart';
import '../order_details/order_details_screen.dart';
import '../problem/problem.dart';

class MainOrdersScreen extends StatefulWidget {
  MainOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MainOrdersScreen> createState() => _MainOrdersScreenState();
}

enum PopupMenu { Details, Problem }

class _MainOrdersScreenState extends State<MainOrdersScreen> {
  List<String> items = [
    'المندوب تاخر',
    'المندوب لا يرد على رسائلي',
    'استلمت الطلب الغلط',
    'الطلب ناقص',
    'سبب اخر',
  ];
  String? selectedItem = 'المندوب تاخر';
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            const Divider(
              color: Color(0xffC1C1C1),
              thickness: 1,
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                _currentOrdersView(),
                _previousOrdersView(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  ListView _previousOrdersView() {
    return ListView.separated(
      separatorBuilder: ((context, index) => SizedBox(height: 10.h)),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: ((context, index) => InkWell(
            onTap: () {
              setState(() {
                //  selectedValue = items[index];
              });
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                    // border: Border.all(width: 1, color: AppColors.tkborder),
                    // borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xffF6F6F6)),
                child: Row(
                  children: [
                    Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            image: AssetImage(
                              'images/beak.png',
                            )),
                      ),
                      // child: Image.asset('images/person.png')
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustom(
                            text: 'طلب وجبه كومبو من البيك',
                            fontSize: 15.sp,
                            color: Color(0xffAFAFAF),
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              Container(child: Image.asset('images/clock.png')),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextCustom(
                                text: 'منذ 4 آيام',
                                fontSize: 12.sp,
                                color: AppColors.hintText,
                              ),
                              SizedBox(
                                width: 25.w,
                              ),
                              Container(
                                  child:
                                      Image.asset('images/money-recive.png')),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextCustom(
                                text: '135 ريال',
                                fontSize: 12.sp,
                                color: AppColors.hintText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    // InkWell(
                    //   onTap: (){
                    //
                    //   },
                    //     child: Icon(Icons.more_vert,color: AppColors.drInActiveBnbIcon,))
                    _PopOutMenu()
                  ],
                )),
          )),
    );
  }

  ListView _currentOrdersView() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        itemBuilder: (context, index) => _currentOrderWidet(),
        separatorBuilder: (context, index) => SizedBox(height: 5.h),
        itemCount: 1);
  }

  Container _currentOrderWidet() {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  'https://d34u8crftukxnk.cloudfront.net/slackpress/prod/sites/6/E12KS1G65-W0168RE00G7-133faf432639-512.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  TextCustom(
                    text: 'محمد علي',
                    fontSize: 16,
                    color: Color(0xffABABAB),
                  ),
                  RatingBar.builder(
                    itemSize: 15.sp,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 5.h),
                  TextCustom(
                    text: 'رقم الطلب 1654',
                    fontSize: 10,
                    color: Color(0xffABABAB),
                  ),
                ],
              ),
              //Spacer(),
              // Column(
              //   children: [
              //     Icon(
              //       Icons.check_circle,
              //       color: Color(0xff0BD42C),
              //     ),
              //     TextCustom(
              //       textDecoration: TextDecoration.underline,
              //       text: 'تم اصدار الفاتورة',
              //       fontSize: 10,
              //       color: Color(0xffABABAB),
              //     ),
              //   ],
              // )
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
               onTap: () => Get.to(OrderDetailsScreen()),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.my_library_books_outlined,
                      color: AppColors.maincolor,
                    ),
                    SizedBox(height: 6.h),
                    TextCustom(
                      text: 'تفاصيل الطلب',
                      fontSize: 12,
                      color: Color(0xffABABAB),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.phone_in_talk_outlined,
                    color: AppColors.maincolor,
                  ),
                  SizedBox(height: 6.h),
                  TextCustom(
                    text: 'اتصال',
                    fontSize: 12,
                    color: Color(0xffABABAB),
                  ),
                ],
              ),
              InkWell(
             //   onTap: () => Get.to(ChatScreen()),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: AppColors.maincolor,
                    ),
                    SizedBox(height: 6.h),
                    TextCustom(
                      text: 'دردشة',
                      fontSize: 12,
                      color: Color(0xffABABAB),
                    ),
                  ],
                ),
              ),
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Icon(
              //       Icons.location_on_outlined,
              //       color: AppColors.drAddLocation,
              //     ),
              //     SizedBox(height: 6.h),
              //     TextCustom(
              //       text: 'تتبع',
              //       fontSize: 12,
              //       color: Color(0xffABABAB),
              //     ),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      bottom: _tabBar(),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: TextCustom(
        text: 'الطلبات',
        fontSize: 18,
        color: AppColors.maincolor,
      ),
      // leading: InkWell(
      //   onTap: () {},
      //   child: Icon(
      //     Icons.arrow_back_ios,
      //     color: AppColors.drInActiveBnbIcon,
      //   ),
      // )
    );
  }

  TabBar _tabBar() {
    return TabBar(
        onTap: ((value) {
          setState(() {
            index = value;
          });
        }),
        labelPadding: EdgeInsets.zero,
        indicatorColor: Colors.transparent,
        labelColor: AppColors.maincolor,
        unselectedLabelColor: Color(0xFFAFAFAF),
        tabs: [
          _customTab(
              text: 'الطلبات الحالية',
              isSelected: index == 0,
              hideSideBorder: false),
          _customTab(
              text: 'الطلبات السابقة',
              isSelected: index == 1,
              hideSideBorder: false),
        ]);
  }

  Widget _customTab(
      {required String text, isSelected, bool hideSideBorder = true}) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
          border: hideSideBorder
              ? null
              : Border(
                  right: BorderSide(
                      color: hideSideBorder ? Colors.red : Color(0xffC1C1C1),
                      width: 1,
                      style: BorderStyle.solid))),
      child: Tab(
          icon: TextCustom(
        text: text,
        fontSize: 16,
        color:
            isSelected ? AppColors.maincolor : Color(0xFFAFAFAF),
      )),
    );
  }

  Widget _PopOutMenu() {
    return PopupMenuButton<PopupMenu>(
      icon: Icon(
        Icons.more_vert,
        color: Color(0xFFAFAFAF),
      ),
      offset: Offset(20.w, 40.h),
      elevation: 0,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0.r))),
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopupMenu>(
            value: PopupMenu.Details,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: 'تفاصيل الطلب',
                  color: AppColors.lightBlack,
                  fontSize: 14,
                ),
                Divider()
              ],
            ),
          ),
          PopupMenuItem<PopupMenu>(
            value: PopupMenu.Problem,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: 'رفع شكوي',
                  color: AppColors.lightBlack,
                  fontSize: 14,
                ),
                Divider()
              ],
            ),
          ),
        ];
      },
      onSelected: (PopupMenu menu) {
        switch (menu) {
          case PopupMenu.Details:
            Get.to(OrderDetailsScreen());
            break;
          case PopupMenu.Problem:
            Get.to(Problem());
            break;
        }
      },
    );
  }
}