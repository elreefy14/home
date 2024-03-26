import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/theme/light_theme_colors.dart';
import '../../components/api_handle_ui_widget.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text.dart';
import '../../data/models/house_model.dart';
import './details_controller.dart';

class DetailsView extends GetView<DetailsController> {
//final HouseModel house;
final HouseModel house;
  const DetailsView(this.house, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailsController>(
        builder: (_) {
          return ApiHandleUiWidget(
            successWidget: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Stack(
                      children: [

                        Container(
                          width: 335.w,
                          height: 304.h,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.r),
                            image: DecorationImage(
  image: NetworkImage(house.images[0]),
  fit: BoxFit.cover,
),
                          ),
                        ),
                        Positioned(
                          bottom: 20.h, // Adjust this value to add padding from the bottom
                          left: 20.w, // Adjust this value to add padding from the left
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                house.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Monadi',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                '${house.location} ',
                                 style: TextStyle(
                                  color: Color(0xFFD4D4D4),
                          fontSize: 12,
                          fontFamily: 'Monadi',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [

                                  Container(
                                    //Container(
                                    //   width: 28,
                                    //   height: 28,
                                    //   decoration: ShapeDecoration(
                                    //     color: Colors.white.withOpacity(0.20000000298023224),
                                    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    //   ),
                                    // )
                                    width: 28.w,
                                    height: 28.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.20000000298023224),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/vectors/IC_Bed.svg',
                                          width: 24.w,
                                          height: 24.h,
                                          //white
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '${house.numberOfRooms} غرف',
                                    style: TextStyle(
                                      color: Colors.white, // Changed from Color(0xFF848484) to white
                                      fontSize: 12.sp,
                                      fontFamily: 'Monadi',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 50.w),
                                  Container(
                                    width: 28.w,
                                    height: 28.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.20000000298023224),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/vectors/IC_Bath.svg',
                                          width: 28.w,
                                          height: 28.h,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '${house.numberOfBathrooms} حمامات',
                                    style: TextStyle(
                                      color: Colors.white, // Changed from Color(0xFF848484) to white
                                      fontSize: 12.sp,
                                      fontFamily: 'Monadi',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20.h, // Adjusted from 11 to 20
                          right: 20.w, // Adjusted from 11 to 20
                          child: Container(
                            width: 34.w,
                            height: 34.h,
                            decoration: ShapeDecoration(
                              color: Colors.black.withOpacity(0.23999999463558197),
                              shape: OvalBorder(),
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/vectors/IC_Bookmark.svg'),
                                // Replace with your SVG icon
                            ),
                          ),
                        ),
                          Positioned(
                            top: 20.h, // Adjusted from 11 to 20
                            left: 20.w, // Adjusted from 11 to 20
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 34.w,
                                height: 34.h,
                                decoration: ShapeDecoration(
                                  color: Colors.black.withOpacity(0.23999999463558197),
                                  shape: OvalBorder(),
                                ),
                                child: Center(
                                  child: SvgPicture.asset('assets/vectors/IC_Back.svg'),
                                    // Replace with your SVG icon
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    //Text(
                    //   'تفاصيل',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 16,
                    //     fontFamily: 'Monadi',
                    //     fontWeight: FontWeight.w400,
                    //     height: 0,
                    //   ),
                    // )
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txt: 'تفاصيل',
                            textAlign: TextAlign.left,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monadi',
                          ),
                        ],
                      ),
                    ),
                 //   SizedBox(height: .h,),
                    Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: DescriptionTextWidget(
                        text: house.description,
                      ),
                    ),
                    //text صور  in left side



                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Row(
                        children: [
                          // Circle containing the owner's image
                          CircleAvatar(
                            backgroundImage: NetworkImage(house.ownerImageUrl),
                          ),
                          SizedBox(width: 10.w),
                          // Column containing two text widgets for the owner's name and number
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                house.ownerName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Monadi',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'المالك',
                                style: TextStyle(
                                  color: Color(0xFF848484),
                                  fontSize: 12,
                                  fontFamily: 'Monadi',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          // Ocean blue container containing two SVG icons
                          Container(

                            height: 28.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: LightThemeColors.blueOcean.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset('assets/vectors/Frame.svg'),

                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            // Container(
                            //         width: 28,
                            //         height: 28,
                            //         decoration: BoxDecoration(
                            //           color: const Color(0x7f0a8ed9),
                            //           borderRadius: BorderRadius.circular(5),
                            //         ),
                            //       ),
                            //     );
                            height: 28.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: LightThemeColors.blueOcean.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset('assets/vectors/Frame (1).svg'),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txt: 'صور',
                            textAlign: TextAlign.left,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monadi',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h,),
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
                                image: NetworkImage("https://cdn.houseplansservices.com/product/nqdpimgoer3e4hde655glti1jq/w1024.JPG?v=18"),
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
                    SizedBox(height: 30.h,),

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
                        height: 140.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://th.bing.com/th/id/OIP.ZPKuUY0mrE5VBDOS1oAuAQHaEF?rs=1&pid=ImgDetMain"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(23.r),
                        ),
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
                            //'اطلب الان',
                            txt: 'اطلب الان',
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

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 75) {
      firstHalf = widget.text.substring(0, 75);
      secondHalf = widget.text.substring(75, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
          new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  flag ? "عرض المزيد" : "عرض أقل",
                  style: new TextStyle(color: Colors.blue),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}