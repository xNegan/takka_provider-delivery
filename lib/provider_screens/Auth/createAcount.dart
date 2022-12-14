import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:takkah/provider_screens/Auth/controller/create_account_controller.dart';
import 'package:takkah/provider_screens/Auth/valditeScreen.dart';

import '../../global_widgets/ButtonApp.dart';

import '../../global_widgets/TitleBox.dart';
import '../../global_widgets/text_custom.dart';
import '../../global_widgets/text_field.dart';
import '../../uitls/app_colors.dart';

import 'Login.dart';
import 'createAcount.dart';
import 'createAcount2.dart';

class createAcount extends StatefulWidget {
  @override
  _createAcountState createState() => _createAcountState();
}

class _createAcountState extends State<createAcount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: GetBuilder<CreateAccountController>(
              init: CreateAccountController(),
              builder: (controller) {
                return  SafeArea(
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFFA9C21),
                            Color(0xFFC05501),
                          ],
                        ),
                      ),
                      child: controller.isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,),) : Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "images/splachicon.png",
                                width: 180.w,
                                height: 180.h,
                              ),
                              Container(
                                width: context.width,
                                height: 600.h,
                                margin: EdgeInsets.only(
                                    bottom: 10.h,
                                    left: 10.w,
                                    right: 10.w,
                                    top: 50.h),
                                padding: EdgeInsets.only(
                                    top: 30.h,
                                    left: 30.w,
                                    right: 30.w,
                                    bottom: 30.h),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                child: Form(
                                  key: controller.keyFormStore,
                                  child: ListView(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextCustom(
                                        text: '?????????? ????????',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(Login());
                                            },
                                            child: TextCustom(
                                              text: '?????????? ????????!',
                                              fontSize: 12,
                                              color: AppColors.maincolor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextCustom(
                                            text: '?????? ???????? ??????????',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      TextFieldCustom(
                                        textInputType: TextInputType.text,
                                        textHint: '?????? ???????? ??????????????',
                                        hintColor: AppColors.blackColor,
                                        controller: controller.ownerNameController,

                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "???????? ?????????? ?????????? ??????????????";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.ownerPhoneNumberController,
                                        textInputType: TextInputType.number,
                                        textHint: '?????? ???????? ???????? ??????????????',
                                        hintColor: AppColors.blackColor,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "???????? ?????????? ?????????? ??????????????";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.passwordController,
                                        textInputType: TextInputType.text,
                                        textHint: '???????? ????????????',
                                        hintColor: AppColors.blackColor,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "???????? ?????????? ?????????? ??????????????";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.employerPhoneNumberController,
                                        textInputType: TextInputType.number,
                                        textHint: '?????? ???????? ???????????? (??????????????)',
                                        hintColor: AppColors.blackColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.casherPhoneNumberController,
                                        textInputType: TextInputType.number,
                                        textHint: '???????? ???????? ?????????????? (??????????????)',
                                        hintColor: AppColors.blackColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.mangerPhoneNumberController,
                                        textInputType: TextInputType.number,
                                        textHint: '???????? ???????? ???????? ?????????? (??????????????)',
                                        hintColor: AppColors.blackColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.storeNameController,
                                        textInputType: TextInputType.text,
                                        textHint: '?????? ????????????',
                                        hintColor: AppColors.blackColor,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "???????? ?????????? ?????????? ??????????????";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.storeEmailController,
                                        textInputType: TextInputType.emailAddress,
                                        textHint: '???????????? ???????????????????? ????????????',
                                        hintColor: AppColors.blackColor,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "???????? ?????????? ?????????? ??????????????";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                        controller: controller.pinCodeController,

                                        textInputType: TextInputType.number,
                                        textHint: '?????????? ?????? ??????',
                                        hintColor: AppColors.blackColor,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "???????? ?????????? ?????????? ??????????????";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ////////////////////////////////////////
                                      TextFieldCustom(
                                        controller: controller.logoController,
                                        onTap: () {
                                          print("object");
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "???????? ?????????? ?????????? ??????????????";
                                          }
                                          // return ''; this is causing you the error you must return null
                                          return null; // this is correct
                                        },
                                        readOnly: true,
                                        textInputType: TextInputType.text,
                                        textHint: controller.pathLogo != null ? controller.pathLogo : '????????????',
                                        hintColor: AppColors.blackColor,
                                        suffixWid: IconButton(icon: Icon(Icons.add_a_photo), onPressed: () => controller.pickLogo(),),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                          controller: controller.startDateController,

                                          onTap: () {
                                            print("object");
                                          },
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return "???????? ?????????? ?????????? ??????????????";
                                            }
                                            // return ''; this is causing you the error you must return null
                                            return null; // this is correct
                                          },
                                          readOnly: true,
                                          textInputType: TextInputType.text,
                                          textHint: controller.formattedDateStart != null ? controller.formattedDateStart : '?????????? ?????????? ?????????? ??????????????',
                                          hintColor: AppColors.blackColor,
                                          suffixWid: IconButton(icon: Icon(Icons.date_range) , onPressed: () => controller.selectDateStart(context),)
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                          controller: controller.endDateController,

                                          onTap: () {
                                            print("object");
                                          },
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return "???????? ?????????? ?????????? ??????????????";
                                            }
                                            // return ''; this is causing you the error you must return null
                                            return null; // this is correct
                                          },
                                          readOnly: true,
                                          textInputType: TextInputType.text,
                                          textHint: controller.formattedDateEnd != null ? controller.formattedDateEnd : '?????????? ?????????? ?????????? ??????????????',
                                          hintColor: AppColors.blackColor,
                                          suffixWid: IconButton(icon: Icon(Icons.date_range) , onPressed: () => controller.selectDateEnd(context),)
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldCustom(
                                          controller: controller.imageController,
                                          onTap: () {
                                            print("object");
                                          },
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return "???????? ?????????? ?????????? ??????????????";
                                            }
                                            // return ''; this is causing you the error you must return null
                                            return null; // this is correct
                                          },
                                          readOnly: true,
                                          textInputType: TextInputType.text,
                                          textHint: '???????? ?????????? ??????????????',

                                          suffixWid: IconButton(onPressed: ()=> controller.pickCommercialRegistry(), icon: Icon(Icons.add_a_photo),)
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GridView.builder(
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          itemCount: controller.categories.first.data!.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              childAspectRatio: 23/13
                                          ),
                                          itemBuilder: (context, index){
                                            return  InkWell(
                                              onTap: (){
                                                controller.selectCategory(currentIndex: index, id: controller.categories.first.data![index].id!);
                                              },
                                              child: Container(
                                                child: TextCustom(
                                                  text: controller.categories.first.data![index].name ?? "",
                                                  color:   controller.index ==  index ? Colors.white :AppColors.lGray,
                                                ),
                                                padding: EdgeInsets.only(
                                                  top: 5.h,
                                                  bottom: 5.h,
                                                  // left: 10.w,
                                                  // right: 10.w
                                                ),
                                                alignment: Alignment.center,
                                                margin:
                                                EdgeInsetsDirectional.only(
                                                    start: 10.w, top: 10.h),
                                                decoration: BoxDecoration(
                                                    color: controller.index ==  index ? AppColors.maincolor : Colors.white,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            10.r)),
                                                    border: Border.all(
                                                        color:
                                                        AppColors.maincolor)),
                                              ),
                                            );
                                          }),


                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      ButtonApp(
                                        isblack: true,
                                        onTap: () {
                                          controller.checkFormStoreAccount();
                                        },
                                        title: '??????????',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                );
              }
            )));
  }
}
