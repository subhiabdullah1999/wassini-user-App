import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/auth_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_in_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_up_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/login_one.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  final int initialPage;
  AuthScreen({this.initialPage = 0});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false)
        .initAddressTypeList(context);
    Provider.of<AuthProvider>(context, listen: false).isRemember;
    PageController _pageController = PageController(initialPage: initialPage);

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // background
          Provider.of<ThemeProvider>(context).darkTheme
              ? Image.asset("assets/images/login_one.png",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width)
              : Image.asset("assets/images/login_one.png",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),

          //   Consumer<AuthProvider>(
          //     builder: (context, auth, child) => SafeArea(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           SizedBox(height: 30),

          //           // for logo with text
          //           // Image.asset(Images.splash_logo, height: 150, width: 200),

          //           // for decision making section like signin or register section
          //           Padding(
          //             padding: EdgeInsets.all(Dimensions.MARGIN_SIZE_LARGE),
          //             child: Stack(
          //               clipBehavior: Clip.none,
          //               children: [
          //                 // Positioned(
          //                 //   bottom: 0,
          //                 //   right: Dimensions.MARGIN_SIZE_EXTRA_SMALL,
          //                 //   left: 0,
          //                 //   child: Container(
          //                 //     width: MediaQuery.of(context).size.width,
          //                 //     //margin: EdgeInsets.only(right: Dimensions.FONT_SIZE_LARGE),
          //                 //     height: 1,
          //                 //     color: ColorResources.getGainsBoro(context),
          //                 //   ),
          //                 // ),
          //                 // Consumer<AuthProvider>(
          //                 //   builder: (context, authProvider, child) => Row(
          //                 //     children: [
          //                 //       InkWell(
          //                 //         onTap: () => _pageController.animateToPage(0,
          //                 //             duration: Duration(seconds: 1),
          //                 //             curve: Curves.easeInOut),
          //                 //         child: Column(
          //                 //           children: [
          //                 //             Text(getTranslated('SIGN_IN', context),
          //                 //                 style: authProvider.selectedIndex == 0
          //                 //                     ? titilliumSemiBold
          //                 //                     : titilliumRegular),
          //                 //             Container(
          //                 //               height: 1,
          //                 //               width: 40,
          //                 //               margin: EdgeInsets.only(top: 8),
          //                 //               color: authProvider.selectedIndex == 0
          //                 //                   ? Theme.of(context).primaryColor
          //                 //                   : Colors.transparent,
          //                 //             ),
          //                 //           ],
          //                 //         ),
          //                 //       ),
          //                 //       SizedBox(width: 25),
          //                 //       InkWell(
          //                 //         onTap: () => _pageController.animateToPage(1,
          //                 //             duration: Duration(seconds: 1),
          //                 //             curve: Curves.easeInOut),
          //                 //         child: Column(
          //                 //           children: [
          //                 //             Text(getTranslated('SIGN_UP', context),
          //                 //                 style: authProvider.selectedIndex == 1
          //                 //                     ? titilliumSemiBold
          //                 //                     : titilliumRegular),
          //                 //             Container(
          //                 //                 height: 1,
          //                 //                 width: 50,
          //                 //                 margin: EdgeInsets.only(top: 8),
          //                 //                 color: authProvider.selectedIndex == 1
          //                 //                     ? Theme.of(context).primaryColor
          //                 //                     : Colors.transparent),
          //                 //           ],
          //                 //         ),
          //                 //       ),
          //                 //     ],
          //                 //   ),
          //                 // ),
          //               ],
          //             ),
          //           ),

          //           // show login or register widget
          //           // Expanded(
          //           //   child: Consumer<AuthProvider>(
          //           //     builder: (context, authProvider, child) =>
          //           //         PageView.builder(
          //           //       itemCount: 2,
          //           //       controller: _pageController,
          //           //       itemBuilder: (context, index) {
          //           //         if (authProvider.selectedIndex == 0) {
          //           //           return SignInWidget();
          //           //         } else {
          //           //           return SignUpWidget();
          //           //         }
          //           //       },
          //           //       onPageChanged: (index) {
          //           //         authProvider.updateSelectedIndex(index);
          //           //       },
          //           //     ),
          //           //   ),
          //           // ),
          //         ],
          //       ),
          //     ),
          //   ),
          //

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.10,
            left: MediaQuery.of(context).size.width * 0.16,
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 35),
                  child: Provider.of<AuthProvider>(context).isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      : CustomButton(
                          onTap: () {
                            Navigator.push((context),
                                MaterialPageRoute(builder: (context) {
                              return LoginOne();
                            }));
                          },
                          buttonText: getTranslated('LOGIN', context)),
                ),
                GestureDetector(
                  onTap: () {
                    if (!Provider.of<AuthProvider>(context, listen: false)
                        .isLoading) {
                      Provider.of<CartProvider>(context, listen: false)
                          .getCartData();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => DashBoardScreen()),
                          (route) => false);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 50, right: 50, top: 0),
                    height: 40,
                    width: 170,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: ColorResources.getHint(context), width: 1.0),
                    ),
                    child: Text(getTranslated('CONTINUE_AS_GUEST', context),
                        style:
                            titilliumSemiBold.copyWith(color: Colors.black45)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
