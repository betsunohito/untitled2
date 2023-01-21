import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled2/screens/restourant/components/restaruant_cart.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      backgroundColor: Colors.white,
      elevation: 0,
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/header-image.png",
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: SvgPicture.asset("assets/icons/back.svg"),
            )),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartScreen()));

            },
            icon: SvgPicture.asset("assets/icons/cart.svg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
        ),
      ],
    );
  }
}
