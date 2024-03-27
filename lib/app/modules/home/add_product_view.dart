import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/api_handle_ui_widget.dart';
import 'package:getx_skeleton/app/components/custom_button.dart';
import 'package:getx_skeleton/app/components/custom_text.dart';

import '../../data/models/wilaya.dart';
import 'add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddProductController>(
        builder: (_) {
          return ApiHandleUiWidget(
            successWidget: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 13.w,),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundImage: NetworkImage(
                              'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                            ),
                          ),
                          const SizedBox(width: 16),
                          CustomText(
                            txt: 'اضافة عقار',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monadi',
                          ),
                          Spacer(),
                          CustomText(
                            txt: 'ايجار',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monadi',
                            color: controller.isSwitched.value ?  const Color(0xFF848484):Color(0xFF6EDD53),
                          ),
                          Obx(
                                () => Switch(
                                  activeColor: const Color(0xFF6EDD53),
                                  inactiveTrackColor: const Color(0xFF848484),
                              value: controller.isSwitched.value,
                              onChanged: (value) {
                                controller.isSwitched.value = value;
                                controller.update();
                              },
                            ),
                          ),
                          CustomText(
                            txt: 'بيع',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monadi',
                            color: controller.isSwitched.value ?  const Color(0xFF6EDD53) : const Color(0xFF848484),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 82.w,
                                child: CustomText(
                                  txt: 'ارض',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Monadi',
                                  color: const Color(0xFF828282),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomDropdown(controller: controller, txt: 'Your Text', menuItems: ['ايجار', 'بيع', 'ايجار او بيع']
                              ,dropdownValue: controller.dropdownValue1,

                              )],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 82.w,
                                child: CustomText(
                                  txt:
                                  'طبيعة العقار',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Monadi',
                                  color: const Color(0xFF828282),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomDropdown(dropdownValue: controller.dropdownValue2
                                  ,controller: controller, txt: 'Your Text', menuItems: ['مبنى','غير مبنى']
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 82.w,
                                child: CustomText(
                                  txt: 'الولاية',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Monadi',
                                  color: const Color(0xFF828282),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomDropdown(
                                isWilaya: true,
                                dropdownValue: controller.wilayaDropDown
                                ,controller: controller, txt: 'Your Text',
                                menuItems: //list of arabic names of wilaya from controller
                                controller.arNamesOfWilaya,
                              ),
                                ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 82.w,
                                child: CustomText(
                                  txt: 'البلدية',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Monadi',
                                  color: const Color(0xFF828282),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomDropdown(
                                  dropdownValue: controller.dropdownValue4,
                                  controller: controller, txt: 'Your Text',
                                  menuItems: controller.arCommunes,
                                  )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w,),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          txt: 'الوثائق',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Monadi',
                          color: const Color(0xFF848484),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Container(
                      width: 334.w,
                      height: 53.h,
                      padding: const EdgeInsets.all(16.50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9.90),
                        border: Border.all(width: 1.10, color: Color(0xFFEAECF0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19101828),
                            blurRadius: 2.48,
                            offset: Offset(0, 0.83),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/vectors/pdf.svg',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 16.50.w),
                          Text(
                            'عقد الملكية',
                            style: TextStyle(
                              color: Color(0xFF282828),
                              fontSize: 14.sp,
                              fontFamily: 'Monadi',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 16.50.w),
                          Text(
                            '10 MB',
                            style: TextStyle(
                              color: Color(0xFFD92C20),
                              fontSize: 13.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    //    width: 335,
                    //           height: 304,
                    Stack(
                      children: [
                        Container(
                          width: 335.w,
                          height: 304.h,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.r),
                            image: DecorationImage(
                              image: NetworkImage('https://cdn.houseplansservices.com/product/nqdpimgoer3e4hde655glti1jq/w1024.JPG?v=18'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 11,
                          right: 11,
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/vectors/c.png', // This is the camera PNG image
                                width: 40, // Change this to your desired size
                                height: 40, // Change this to your desired size
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //15
                    SizedBox(height: 15.h,),
                    //4 images in row
                    //Container(
                    //   width: 72,
                    //   height: 71,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: NetworkImage("https://via.placeholder.com/72x71"),
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // )
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 72.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                //house image from network
                                image: NetworkImage('https://cdn.houseplansservices.com/product/nqdpimgoer3e4hde655glti1jq/w1024.JPG?v=18'),
                                fit: BoxFit.fill,
                              ),
                               borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          //5
                          // SizedBox(width: 10.w,),
                          Container(
                            width: 72.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://cdn.houseplansservices.com/product/nqdpimgoer3e4hde655glti1jq/w1024.JPG?v=18"),
                                fit: BoxFit.fill,
                              ),
                                    borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          // SizedBox(width: 10.w,),
                          Container(
                            width: 72.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://cdn.houseplansservices.com/product/nqdpimgoer3e4hde655glti1jq/w1024.JPG?v=18"),
                                fit: BoxFit.fill,
                              ),
                                    borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          // SizedBox(width: 10.w,),
                          Stack(
                            children: [
                              Container(
                                width: 72.w,
                                height: 71.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://cdn.luxatic.com/wp-content/uploads/2016/10/72-Million-Beverly-Hills-Mansion-02.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '+5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontFamily: 'Monadi',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    //Text(
                    //   'الخريطة',
                    //   style: TextStyle(
                    //     color: Color(0xFF848484),
                    //     fontSize: 15,
                    //     fontFamily: 'Monadi',
                    //     fontWeight: FontWeight.w400,
                    //     height: 0,
                    //   ),
                    // )
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w,),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          txt: 'الخريطة',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Monadi',
                          color: const Color(0xFF848484),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    //Container(
                    //   width: 341,
                    //   height: 183,
                    //   decoration: ShapeDecoration(
                    //     image: DecorationImage(
                    //       image: NetworkImage("https://via.placeholder.com/341x183"),
                    //       fit: BoxFit.fill,
                    //     ),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(23),
                    //     ),
                    //   ),
                    // )
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Container(
                        width: 340.w,
                        height: 185.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://th.bing.com/th/id/OIP.ZPKuUY0mrE5VBDOS1oAuAQHaEF?rs=1&pid=ImgDetMain"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(23.r),
                        ),
                      ),
                    ),
                    //10
                    SizedBox(height: 10.h,),
                    //width: 15.643px;
                    // height: 15.643px;
                    // flex-shrink: 0;
                    //svg vector
                    Padding(
                      padding: EdgeInsets.only(
                        left: 80.w,

                      ),
                      child: SvgPicture.asset(
                        'assets/vectors/map.svg',
                        width: 15.643.w,
                        height: 15.643.h,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.w,
                        left: 30.w,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                txt: 'السعر',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Monadi',
                                color: const Color(0xFF848484),
                              ),
                              SizedBox(height: 5.h,),
                              CustomText(
                                txt: 'دج2.500.000.000 ',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Monadi',
                              ),
                            ],
                          ),
                          Spacer(),
                          CustomButton(child:
                          CustomText(
                            txt: 'انشر العقار',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monadi',
                            color: Colors.white,
                          ),
                            width: 117.w,
                            high: 44.h,
                            borderRadius: 10.r,
                            onPressed: (){},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                  ],
                ),
              ),
            ),
            apiCallStatus: controller.apiCallStatus,
          );
        },
      ),
    );
  }
}
class CustomDropdown extends StatelessWidget {
  final AddProductController controller;
  final String txt;
  final List<String> menuItems;
  final double? width;
  final double? fontSize;
  final RxString dropdownValue;
  final bool? isWilaya;

  CustomDropdown({
    required this.controller,
    required this.txt,
    required this.menuItems,
    required this.dropdownValue,
    this.width,
    this.fontSize,
    this.isWilaya = false
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton<String>(
        value: menuItems.contains(dropdownValue.value) ? dropdownValue.value : null,
        icon:  Icon(Icons.keyboard_arrow_down,
          color: Color(0xFF838383),
          size: 24.w, // Use .w for width
        ),
        iconSize: 24.w, // Use .w for width
        elevation: 16,
        style: TextStyle(
          color: Colors.red,
          fontSize: (fontSize??15).sp, // Use .sp for font size
          fontFamily: 'Monadi',
          fontWeight: FontWeight.w400,
        ),
        onChanged: (String? newValue) async {
          dropdownValue.value = newValue!;
          print('newValue:\n\n\n\n $newValue');
          print('index: ${menuItems.indexOf(newValue)}');
          if(isWilaya??false) {
            int selectedWilaya = menuItems.indexOf(newValue) + 1;
            controller.loadCommuneArNames(
              selectedWilaya.toString(),
            ).then((data) {
              controller.arCommunes = data;
            });
          }
        },
        underline: Container(
          height: .1.h, // Use .h for height
          color: Colors.white,
        ),
        items: menuItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: SizedBox(
              width: (width??104).w, // Use .w for width
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: (fontSize??15).sp, // Use .sp for font size
                  fontFamily: 'Monadi',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}