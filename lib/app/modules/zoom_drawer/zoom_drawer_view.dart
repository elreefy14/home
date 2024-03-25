import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:getx_skeleton/config/theme/my_fonts.dart';
import '../../../config/theme/light_theme_colors.dart';
import '../../components/custom_text.dart';
import '../../data/models/house_model.dart';
import '../../data/models/wilaya.dart';
import '../home/home_controller.dart';
import '../home/home_view.dart';
import './zoom_drawer_controller.dart';

class ZoomDrawerView extends GetView<ZoomDrawerController> {
  const ZoomDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController()); // Register and get the instance of HomeController
    final items = ['بيع', 'ايجار', 'مبنى', 'غير مبنية'];
    List<HouseModel> houseList = List.generate(
      5,
          (index) => HouseModel(
            distance: '${index + 1000}',
            name: 'منزل ${
                index + 1
            } طوابق',
            location: 'Location $index',
            price: 100000.0 + index,
            numberOfRooms: 3, // Specify the number of rooms
            numberOfBathrooms: 2, // Specify the number of bathrooms
            description: 'Description for House $index',
            ownerName: 'Owner $index',
            ownerNumber: '123456789$index',
            images: [
              'https://picsum.photos/200/300?random=$index',
              'https://picsum.photos/200/300?random=${index + 1}',
              'https://picsum.photos/200/300?random=${index + 2}',
            ],
          ),
    );
    return AdvancedDrawer(
      backdropColor: LightThemeColors.blueOcean,
      controller: this.controller.drawerController,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/vectors/IC_Notification.svg',
                  width: 24, height: 24,color:
                  Colors.black),
            ),
          ],
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
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

                WilayaDropdown(controller: this.controller),
              ],
            ),
          ),
          leading: IconButton(
            onPressed: this.controller.toggle,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: this.controller.drawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    color: Colors.black,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
         //   physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SearchBar(),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  height: 39,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: items.length,
             itemBuilder: (context, index) {
  return Row(
    children: [
      buildContainer(items[index], index),
      if (index != items.length - 1) SizedBox(width: 31.w), // Add SizedBox if it's not the last item
    ],
  );
},
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      txt: 'بقربك',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Monadi',
                      color: Colors.black,
                    ),
                    CustomText(
                      txt: 'عرض المزيد',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Monadi',
                      color: const Color(0xFF848484),
                    ),
                  ],
                ),
                //horizontal list of images in containers like that
                //   width: 226.70,
                //   height: 286.44,
                //15
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: double.infinity,
                  height: 286.44,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: houseList.length,
                    itemBuilder: (context, index) {
                      return  Container(
  width: 226.70,
  height: 286.44,
  margin: EdgeInsets.only(right: 10.w),
  clipBehavior: Clip.antiAlias,
  decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Stack(
    children: [
      Image.network(
        houseList[index].images![0], // Use the first image from the images list
        width: 226.70,
        height: 286.44,
        fit: BoxFit.cover,
      ),
      Positioned(
  top: 11,
  right: 11,
  child: Container(
    width: 100.91,
    height: 25.13,
    padding: const EdgeInsets.only(
      top: 4.28,
      left: 8.55,
      right: 10.69,
      bottom: 4.28,
    ),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.24),
      borderRadius: BorderRadius.circular(21.38),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
            Icons.location_on, // Use the location_on icon
            color: Colors.white,
            size: 17.10,
        ),
        const SizedBox(width: 4.28),
        Text(
            '${houseList[index].distance} km', // Replace with the actual distance
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.83,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
            ),
        ),
      ],
    ),
  ),
),
      Positioned(
  bottom: 40,
  left: 20,
  child: SizedBox(
    child: Text(
      houseList[index].name!, // Use the name from the HouseModel
      style: TextStyle(
        color: Colors.white,
        fontSize: 17.10,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
),
    ],
  ),
);
                    },
                  ),
                ),
                //25
                SizedBox(
                  height: 25.h,
                ),
                //row اخترنا لك
                //عرض المزيد//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      txt: 'اخترنا لك',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Monadi',
                      color: Colors.black,
                    ),
                    CustomText(
                      txt: 'عرض المزيد',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Monadi',
                      color: const Color(0xFF848484),
                    ),
                  ],
                ),
//add vertcal list contaain row which contain
              //image and  column of house name and house price row of
             //20
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
//  width: double.infinity,
//  height: 1000,
  children: [
    ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: houseList.length,
      separatorBuilder: (context, index) => SizedBox(height: 10), // Add this
      itemBuilder: (context, index) {
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                houseList[index].images![0],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  houseList[index].name!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Monadi',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${houseList[index].price}دج',
                  style: TextStyle(
                    color: Color(0xFF0A8ED9),
                    fontSize: 12,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                        'assets/vectors/IC_Bed.svg',
                        width: 24, height: 24),
                    SizedBox(width: 5),
                    Text(
                      '${houseList[index].numberOfRooms} غرف',
                      style: TextStyle(
                        color: Color(0xFF848484),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 50),
                    SvgPicture.asset('assets/vectors/IC_Bath.svg',
                        width: 24, height: 24),
                    SizedBox(width: 5),
                    Text(
                      '${houseList[index].numberOfBathrooms} حمامات',
                      style: TextStyle(
                        color: Color(0xFF848484),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  ],
),


              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(controller: this.controller.drawerController),
    );
  }
}
class WilayaDropdown extends StatelessWidget {
  final ZoomDrawerController controller;

  WilayaDropdown({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton<String>(
        value: controller.dropdownValue.value,
        icon: const Icon(Icons.keyboard_arrow_down,
          color: Color(0xFF838383),
          size: 24,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          color: Colors.red,
          fontSize: 15.sp,
          fontFamily: 'Monadi',
          fontWeight: FontWeight.w400,
        ),
        onChanged: (String? newValue) {
          controller.dropdownValue.value = newValue!;
        },
        underline: Container(
          height: .1,
          color: Colors.white,
        ),
        items: controller.wilayaList.map<DropdownMenuItem<String>>((Wilaya wilaya) {
          return DropdownMenuItem<String>(
            value: wilaya.name,
            child: Text(
              wilaya.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'Monadi',
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}

class CustomDrawer extends StatelessWidget {
  final AdvancedDrawerController controller;

  CustomDrawer({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: LightThemeColors.blueOcean,
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            //center
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //200
              SizedBox(
                height: 50.h,
              ),


              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Home.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('الرئيسية'),
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Profile.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('الملف الشخصي'),
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Location.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('بقربي'),
              ),
              //white line divider Colors.white.withOpacity(0.5)
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 0.5,
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Bookmark.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('محفوظة'),
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Notification.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('الإشعارات'),
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Message.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('الرسائل'),
              ),
//white line divider Colors.white.withOpacity(0.5)
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 0.5,
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Setting.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('الإعدادات'),
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Help.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('اتصل بنا'),
              ),
              ListTile(
                onTap: () {},

                leading:   SvgPicture.asset('assets/vectors/IC_Logout.svg',
                    width: 24, height: 24,color:
                    Colors.white),

                title: MyFonts.font15Weight400ColorWhite('تسجيل الخروج'),
              ),



            ],
          ),
        ),
      ),
    );
  }
}



class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //20
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Container(
              width: 269,
              height: 48,
              padding: const EdgeInsets.only(
                top: 12,
                left: 16.47,
                right: 163,
                bottom: 12,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/vectors/IC_Search.svg',
                    width: 24.71,
                    height: 24,
                  ),
                  const SizedBox(width: 10.82),
                  Text(
                    'خانة البحث',
                    style: TextStyle(
                      color: Color(0xFF848484),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10), // Add this
            //add png image
            Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFF42A7DE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/IC_Filter.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget buildContainer(String text, int index) {
  ZoomDrawerController controller = Get.find<ZoomDrawerController>();
  return Obx(() {
    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: controller.selectedIndex.value == index ? Colors.blue : Color(0xFFF6F6F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              //if selected change color to white
              color: controller.selectedIndex.value == index ? Colors.white : Color(0xFF848484),
              fontSize: 12,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
    );
  });
}
