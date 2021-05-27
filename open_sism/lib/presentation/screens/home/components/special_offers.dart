import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:open_sism/logic/blocs/homeBloc/home_state.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';
import 'package:open_sism/presentation/screens/home/components/special_offer_placeHolder.dart';

class SpecialOffers extends StatelessWidget {
  final int points;
  final String badge;
  const SpecialOffers({Key key, this.points = 0, this.badge = "bronze"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildBlocBuilderPoints(),
              Text(
                "Special for you",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                //press: () {},
              ),
              buildBlocBuilderBadge(),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Container(
          margin: EdgeInsets.all(10.0),
          height: 200,
          child: buildBlocBuilderCard(),
        ),
      ],
    );
  }

  BlocBuilder<HomeBloc, HomeState> buildBlocBuilderBadge() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadedSuccess) {
          return Text(
            state.homeData.currentCustomer.group.name,
            style: TextStyle(
              fontSize: 12,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return Text(
            "",
          );
        }
      },
    );
  }

  BlocBuilder<HomeBloc, HomeState> buildBlocBuilderPoints() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadedSuccess) {
          return Text.rich(
            TextSpan(
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text:
                      state.homeData.currentCustomer.currentPoints.toString() +
                          "\n",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                  ),
                ),
                TextSpan(
                  text: "    points",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(10),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text("");
        }
      },
    );
  }

  BlocBuilder<HomeBloc, HomeState> buildBlocBuilderCard() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadedSuccess) {
        //int i=0;
        List<Widget> widgets = state.homeData.content.slides
            .map(
              (item) => SpecialOfferCard(
                image: state
                    .homeData
                    .content
                    .slides[state.homeData.content.slides.indexOf(item)]
                    .imageUrl,
                press: () => WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    _showImageDialog(
                        context,
                        state
                            .homeData
                            .content
                            .slides[state.homeData.content.slides.indexOf(item)]
                            .imageUrl,
                        state
                            .homeData
                            .content
                            .slides[state.homeData.content.slides.indexOf(item)]
                            .script);
                  },
                ),
                category: state.homeData.content
                    .slides[state.homeData.content.slides.indexOf(item)].title,
                numOfBrands: state.homeData.content.slides.length,
              ),
            )
            .toList();
        return Swiper.children(
          //scrollDirection: Axis.horizontal,
          autoplay: true,
          autoplayDelay: 5000,
          loop: true,
          pagination: SwiperPagination(
            margin: EdgeInsets.only(
              right: 25.0,
            ),
            builder: DotSwiperPaginationBuilder(color: Colors.grey),
          ),
          control: SwiperControl(
            iconNext: Icons.arrow_forward_ios,
            iconPrevious: null,
          ),
          children: widgets,
        );
      } else {
        return SpecialOfferPlaceHolder();
      }
    });
  }

  _test() {}
  _showImageDialog(BuildContext context, String image, String description) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        elevation: 3,
        backgroundColor: Colors.white70,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              //press: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  decoration: BoxDecoration(
                    ////

                    /////
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFB2EBF2).withOpacity(0.7),
                        Color(0xFF0097A7).withOpacity(0.50),
                      ],
                    ),
                  ),
                ),
                // Image.asset(
                //   Image.network(image),
                //   fit: BoxFit.contain,
                // ),
                Image.network(image),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Color(0xFF292432)),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/glap.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/tshirt.png",
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/ps4_console_blue_1.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/ps4_console_white_4.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/Image Popular Product 3.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
 */
