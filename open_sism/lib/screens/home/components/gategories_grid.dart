import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_sism/configurations/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Category> categories = [
    Category(9, "General Knowledge", icon: FontAwesomeIcons.globeAsia),
    Category(10, "Books", icon: FontAwesomeIcons.bookOpen),
    Category(11, "Film", icon: FontAwesomeIcons.video),
    Category(12, "Music", icon: FontAwesomeIcons.music),
    Category(13, "Musicals & Theatres", icon: FontAwesomeIcons.theaterMasks),
    Category(14, "Television", icon: FontAwesomeIcons.tv),
    Category(15, "Video Games", icon: FontAwesomeIcons.gamepad),
    Category(16, "Board Games", icon: FontAwesomeIcons.chessBoard),
    Category(17, "Science & Nature", icon: FontAwesomeIcons.microscope),
    Category(18, "Computer", icon: FontAwesomeIcons.laptopCode),
    Category(19, "Maths", icon: FontAwesomeIcons.sortNumericDown),
    Category(20, "Mythology"),
    Category(21, "Sports", icon: FontAwesomeIcons.footballBall),
    Category(22, "Geography", icon: FontAwesomeIcons.mountain),
    Category(23, "History", icon: FontAwesomeIcons.monument),
    Category(24, "Politics"),
    Category(25, "Art", icon: FontAwesomeIcons.paintBrush),
    Category(26, "Celebrities"),
    Category(27, "Animals", icon: FontAwesomeIcons.dog),
    Category(28, "Vehicles", icon: FontAwesomeIcons.carAlt),
    Category(29, "Comics"),
    Category(30, "Gadgets", icon: FontAwesomeIcons.mobileAlt),
    Category(31, "Japanese Anime & Manga"),
    Category(32, "Cartoon & Animation"),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // to get the screen size
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 400,
            width: 400,
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                mainAxisSpacing: 20,
                crossAxisSpacing:
                    SizeConfig.orientation == Orientation.landscape
                        ? SizeConfig.defaultSize * 2
                        : 0,
                childAspectRatio: 1.65,
              ),
              itemBuilder: (context, index) =>
                  _buildCategoryItem(context, index),
            ),
          ),
        ],
      ),
    );
  }
/*
  /////
  physics: BouncingScrollPhysics(),
  slivers: <Widget>[
  SliverPadding(
  padding: const EdgeInsets.all(16.0),
  sliver: SliverGrid(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  childAspectRatio: 1.2,
  crossAxisSpacing: 10.0,
  mainAxisSpacing: 10.0),
  delegate: SliverChildBuilderDelegate(
  _buildCategoryItem,
  childCount: categories.length,
  )),
  ),
  ],
  /////
  */

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      //onPressed: () => _categoryPressed(context,category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  // _categoryPressed(BuildContext context,Category category) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (sheetContext) => BottomSheet(
  //       builder: (_) => QuizOptionsDialog(category: category,),
  //       onClosing: (){},
  //
  //     ),
  //
  //   );
  //
  // }

}

class Category {
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});
}
