import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_sism/presentation/configurations/constants.dart';
import 'package:open_sism/presentation/screens/task/components/taskBundel.dart';
import 'package:open_sism/presentation/configurations/size_config.dart';

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
          Text(
            widget.product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Points\n",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      TextSpan(
                        text: "${widget.product.points}",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: "${widget.product.id}",
                    child: Image.asset(
                      widget.product.imageSrc,
                      fit: BoxFit.scaleDown,
                    ),
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
