import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';
import 'package:open_sism/logic/blocs/singleTaskBloc/singleTask.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTitleWithImage extends StatefulWidget {
  final TaskBundle product;
  ProductTitleWithImage({@required this.product});
  @override
  _ProductTitleWithImageState createState() => _ProductTitleWithImageState();
}

class _ProductTitleWithImageState extends State<ProductTitleWithImage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: kDefaultPaddin,
          ),
          BlocBuilder<SingleTaskBloc, SingleTaskState>(
            builder: (context, state) {
              if (state is SingleTaskLoadedSuccess) {
                return Text(
                  state.recipeBundles != null ? state.recipeBundles.title : " ",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                );
              } else
                return Text(" ");
            },
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(1)),
                alignment: Alignment.center,
                height: getProportionateScreenWidth(80),
                width: getProportionateScreenWidth(80),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow.withOpacity(0.4),

                  //borderRadius: BorderRadius.circular(10),
                ),
                child: BlocBuilder<SingleTaskBloc, SingleTaskState>(
                    builder: (context, state) {
                  if (state is SingleTaskLoadedSuccess) {
                    return RichText(
                      text: TextSpan(
                        //style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: "Points\n",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                          ),
                          TextSpan(
                            text: state.recipeBundles.points.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                          )
                        ],
                      ),
                    );
                  } else
                    return RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: "Points\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF512DA8),
                                    ),
                          )
                        ],
                      ),
                    );
                }),
              ),
              SizedBox(width: kDefaultPaddin),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocBuilder<SingleTaskBloc, SingleTaskState>(
                    builder: (context, state) {
                      if (state is SingleTaskLoadedSuccess) {
                        return Hero(
                          tag: '${state.recipeBundles.id}',
                          child: Image.asset(
                            state.recipeBundles.imageSrc,
                            fit: BoxFit.scaleDown,
                          ),
                        );
                      } else
                        return Hero(
                          tag: " ",
                          child: Image.asset(
                            " ",
                            fit: BoxFit.scaleDown,
                          ),
                        );
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
