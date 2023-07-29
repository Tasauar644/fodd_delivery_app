import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/BigText.dart';
import 'package:food_delivery_app/widgets/SmallText.dart';
import 'package:food_delivery_app/widgets/icon_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double scaleFactor = 0.8;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slide section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: Appcolors.maincolor,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: BigText(text: ".",color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: SmallText(text: "Food pairing",),
              )
            ],
          ),
        ),
        //ListView builder
       Container(
         height: 700,
         child:  ListView.builder(
           physics:NeverScrollableScrollPhysics(),
           //shrinkWrap: true,
             itemCount: 5,
             itemBuilder:
                 (context,index){
               return Container(
                 margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height15),
                 child: Row(
                   children: [
                     //image container
                     Container(
                       width:120,
                       height: 120,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(Dimensions.radius20),
                           color: Colors.white38,
                           image: DecorationImage(
                             fit: BoxFit.cover,
                               image: AssetImage(
                                   "assets/images/food.jpg"
                               )
                           )

                       ),

                     ),
                     Expanded(
                       child: Container(
                         height: 115,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(Dimensions.radius20),
                             bottomRight: Radius.circular(Dimensions.radius20)
                           ),
                           color: Colors.white ,
                         ),
                         padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             BigText(text: "One of the best food in Bangladesh"),
                             SizedBox(height: Dimensions.height12),
                             SmallText(text: "Some kind of description"),
                             SizedBox(height: Dimensions.height12),
                             Row(
                               children: [
                                 IconAndWidget(
                                   icon: Icons.circle_sharp,
                                   text: "normal",
                                   iconColor: Appcolors.iconcolor1,
                                 ),
                                 SizedBox(width: Dimensions.width5),
                                 IconAndWidget(
                                   icon: Icons.location_on,
                                   text: "3km",
                                   iconColor: Appcolors.maincolor,
                                 ),
                                 SizedBox(width:Dimensions.width5),
                                 IconAndWidget(
                                   icon: Icons.access_time_rounded,
                                   text: "32min",
                                   iconColor: Appcolors.iconcolor2,
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),

                     )

                   ],
                 ),
               );
             }),
       )

      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPage) {
      var curScale = 1 - (_currentPage - index) * (1 - scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, curScale, 1);
    } else if (index == _currentPage + 1) {
      var curScale = scaleFactor + (_currentPage - index + 1) * (1 - scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, curScale, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          //slide section
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFFccc7c5) : Color(0xFF89dad0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.rightMargin30, right: Dimensions.rightMargin30, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.rightPadding15, left: Dimensions.rightPadding15, right: Dimensions.rightPadding15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Biriyani Side"),
                    SizedBox(height: Dimensions.height12),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: Appcolors.maincolor, size: 15)),
                        ),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "4"),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "1258"),
                        SizedBox(width: Dimensions.width10),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: Dimensions.height15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndWidget(
                          icon: Icons.circle_sharp,
                          text: "normal",
                          iconColor: Appcolors.iconcolor1,
                        ),
                        SizedBox(width: Dimensions.width5),
                        IconAndWidget(
                          icon: Icons.location_on,
                          text: "3km",
                          iconColor: Appcolors.maincolor,
                        ),
                        SizedBox(width:Dimensions.width5),
                        IconAndWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: Appcolors.iconcolor2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
