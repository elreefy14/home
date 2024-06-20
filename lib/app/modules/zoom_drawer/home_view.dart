import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:getx_skeleton/app/components/api_handle_ui_widget.dart';
import 'package:getx_skeleton/app/modules/home/add_product_view.dart';
import 'package:getx_skeleton/app/routes/routes.dart';
import 'package:getx_skeleton/config/theme/my_fonts.dart';
import '../../../config/theme/light_theme_colors.dart';
import '../../../utils/constants.dart';
import '../../components/custom_text.dart';
import '../../data/models/house_model.dart';
import '../../data/models/wilaya.dart';
import '../home/add_product_controller.dart';
import './home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final AddProductController homeController = Get.put(
      AddProductController()); // Register and get the instance of HomeController
  final items = ['بيع', 'ايجار', 'مبنى', 'غير مبنية'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return   ApiHandleUiWidget(
          apiCallStatus: controller.apiCallStatus,
          successWidget: AdvancedDrawer(
            backdropColor: LightThemeColors.blueOcean,
            controller: this.controller.drawerController,
            drawer: CustomDrawer(controller: this.controller.drawerController),
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Get.to(const AddProductView());
                  }),
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/vectors/IC_Notification.svg',
                        width: 24.w, height: 24.h, color: Colors.black),
                  ),
                ],
                backgroundColor: Colors.white,
                title: Padding(
                  padding: EdgeInsets.only(top: 20.h),
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
                        duration: const Duration(milliseconds: 250),
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
              body: GetBuilder<HomeController>(builder: (_) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchBar(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 39.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  buildContainer(items[index], index),
                                  if (index != items.length - 1)
                                    SizedBox(width: 31.w),
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
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 286.44.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: houseList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  homeController.goToDetails(houseList[index]);
                                },
                                child: Container(
                                  width: 226.70.w,
                                  height: 286.44.h,
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
                                      Image.asset(
                                        houseList[index].images![0],
                                        width: 226.70.w,
                                        height: 286.44.h,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        top: 11.h,
                                        right: 11.w,
                                        child: Container(
                                          width: 100.91.w,
                                          height: 25.13.h,
                                          padding: EdgeInsets.only(
                                            top: 4.28.h,
                                            left: 8.55.w,
                                            right: 10.69.w,
                                            bottom: 4.28.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.24),
                                            borderRadius:
                                                BorderRadius.circular(21.38),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                                size: 17.10.sp,
                                              ),
                                              SizedBox(width: 4.28.w),
                                              Text(
                                                '${houseList[index].distance} km',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.83.sp,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 40.h,
                                        left: 20.w,
                                        child: SizedBox(
                                          child: Text(
                                            houseList[index].name!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.10.sp,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: houseList.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.h),
                              itemBuilder: (context, index) {
                                return houseList[index].wilaya !=
                                        controller.dropdownValue.id
                                    ? Container()
                                    : InkWell(
                                        onTap: () {
                                          homeController
                                              .goToDetails(houseList[index]);
                                        },
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                houseList[index].images![0],
                                                width: 100.w,
                                                height: 100.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      houseList[index].name,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontFamily: 'Monadi',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    //  Spacer(),
                                                    SizedBox(width: 10.w),
                                                    Text(
                                                      houseList[index].isRenting
                                                          ? 'ايجار'
                                                          : 'بيع',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontFamily: 'Monadi',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Text(
                                                  '${houseList[index].price}دج',
                                                  style: TextStyle(
                                                    color: const Color(0xFF0A8ED9),
                                                    fontSize: 12.sp,
                                                    fontFamily: 'Monadi',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Text(
                                                  controller.wilayaList
                                                      .where((p0) =>
                                                          p0.id ==
                                                          houseList[index].wilaya)
                                                      .first
                                                      .arName,
                                                  style: TextStyle(
                                                    color: const Color(0xFF0A8ED9),
                                                    fontSize: 12.sp,
                                                    fontFamily: 'Monadi',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/vectors/IC_Bed.svg',
                                                      width: 24.w,
                                                      height: 24.h,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      '${houseList[index].numberOfRooms} غرف',
                                                      style: TextStyle(
                                                        color:
                                                            const Color(0xFF848484),
                                                        fontSize: 12.sp,
                                                        fontFamily: 'Monadi',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(width: 50.w),
                                                    SvgPicture.asset(
                                                      'assets/vectors/IC_Bath.svg',
                                                      width: 24.w,
                                                      height: 24.h,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      '${houseList[index].numberOfBathrooms} حمامات',
                                                      style: TextStyle(
                                                        color:
                                                            const Color(0xFF848484),
                                                        fontSize: 12.sp,
                                                        fontFamily: 'Monadi',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      }
    );
  }
}

// The rest of your classes remain the same.
class WilayaDropdown extends StatelessWidget {
  final HomeController controller;

  WilayaDropdown({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return DropdownButton<Wilaya>(
        value: controller.dropdownValue,
        icon: const Icon(
          Icons.keyboard_arrow_down,
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
        onChanged: (Wilaya? newValue) {
          controller.changeWilaya(newValue!);
        },
        underline: Container(
          height: .1,
          color: Colors.white,
        ),
        items: controller.wilayaList
            .map<DropdownMenuItem<Wilaya>>((Wilaya wilaya) {
          return DropdownMenuItem<Wilaya>(
            value: wilaya,
            child: Text(
              wilaya.arName,
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
                leading: SvgPicture.asset('assets/vectors/IC_Home.svg',
                    width: 24, height: 24, color: Colors.white),
                title: MyFonts.font15Weight400ColorWhite('الرئيسية'),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset('assets/vectors/IC_Profile.svg',
                    width: 24, height: 24, color: Colors.white),
                title: MyFonts.font15Weight400ColorWhite('الملف الشخصي'),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset('assets/vectors/IC_Location.svg',
                    width: 24, height: 24, color: Colors.white),
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
                leading: SvgPicture.asset('assets/vectors/IC_Bookmark.svg',
                    width: 24, height: 24, color: Colors.white),
                title: MyFonts.font15Weight400ColorWhite('محفوظة'),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset('assets/vectors/IC_Notification.svg',
                    width: 24, height: 24, color: Colors.white),
                title: MyFonts.font15Weight400ColorWhite('الإشعارات'),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset('assets/vectors/IC_Message.svg',
                    width: 24, height: 24, color: Colors.white),
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
                leading: SvgPicture.asset('assets/vectors/IC_Setting.svg',
                    width: 24, height: 24, color: Colors.white),
                title: MyFonts.font15Weight400ColorWhite('الإعدادات'),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset('assets/vectors/IC_Help.svg',
                    width: 24, height: 24, color: Colors.white),
                title: MyFonts.font15Weight400ColorWhite('اتصل بنا'),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset('assets/vectors/IC_Logout.svg',
                    width: 24, height: 24, color: Colors.white),
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
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Container(
              width: 269,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/vectors/IC_Search.svg',
                    width: 24.71,
                    height: 24,
                  ),
                  const SizedBox(width: 10.82),
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'خانة البحث',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Color(0xFF848484),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF42A7DE),
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
  HomeController controller = Get.find<HomeController>();
  return Obx(() {
    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: controller.selectedIndex.value == index
              ? Colors.blue
              : const Color(0xFFF6F6F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              //if selected change color to white
              color: controller.selectedIndex.value == index
                  ? Colors.white
                  : const Color(0xFF848484),
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
