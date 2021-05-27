import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'special_offers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_event.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';

class Body extends StatelessWidget {
  bool discountBannerShow;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // _bloc.add(LoadHomeAds());
    // _categoriesBloc.add(LoadCategories());
    // _featuredBloc.add(LoadFeaturedAds());
    await Future.delayed(Duration(milliseconds: 1000));
    context.read<HomeBloc>().add(HomePageRequested());
    print("refresh");
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    discountBannerShow = true;
    SizeConfig().init(context);
    return SafeArea(
      child: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: () => _onRefresh(context),
        child: Container(
          decoration: kBoxDecoration,
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(40)),
                SpecialOffers(),
                SizedBox(height: getProportionateScreenHeight(15)),
                DiscountBanner(isShown: true),
                Categories(),
                SizedBox(height: getProportionateScreenHeight(30)),
                // CategoriesGrid(),
                // SizedBox(height: getProportionateScreenWidth(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
