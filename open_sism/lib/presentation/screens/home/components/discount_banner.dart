import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_state.dart';
import 'package:open_sism/logic/blocs/homeBloc/home_bloc.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'dart:async';

Timer timer;

class DiscountBanner extends StatelessWidget {
  final bool isShown;

  const DiscountBanner({Key key, this.isShown = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isShown ? 1.0 : 0.0,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(1)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(5),
        ),
        decoration: kBoxDecoration.copyWith(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.star,
              size: 40,
              color: Colors.amber,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadedSuccess) {
                  return Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:
                              state.homeData.content.banner.first.title + '\n',
                        ),
                        TextSpan(
                          text: state.homeData.content.banner.first.script,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(20),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                // else if (state is HomeLoadFailure) {
                //   String title =
                //       state.homeStoredData.content.banner.first.title;
                //   String script =
                //       state.homeStoredData.content.banner.first.script;
                //   print("title" + title);
                //   if (title.isNotEmpty && script != null) {
                //     return Text.rich(
                //       TextSpan(
                //         style: TextStyle(
                //           color: Color(0xFF212121),
                //           fontWeight: FontWeight.bold,
                //         ),
                //         children: [
                //           TextSpan(
                //             text: state
                //                     .homeStoredData.content.banner.first.title +
                //                 '\n',
                //           ),
                //           TextSpan(
                //             text: state
                //                 .homeStoredData.content.banner.first.script,
                //             style: TextStyle(
                //               fontSize: getProportionateScreenWidth(20),
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   }
                //   else
                //     return Text("");
                // }
                else
                  return Text(""
                      // width: 30,
                      //  height: 30,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
