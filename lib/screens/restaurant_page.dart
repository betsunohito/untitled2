import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/models/menu.dart';
import 'package:untitled2/screens/restourant/components/menu_card.dart';
import 'package:untitled2/screens/restourant/components/restaruant_appbar.dart';
import 'package:untitled2/screens/restourant/components/restaruant_info.dart';
import '../Model/restoran.dart';
import 'restourant/components/restaruant_categories.dart';
class RestaurantView extends StatefulWidget {
  const RestaurantView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _RestaurantViewState();
  }
}

class _RestaurantViewState extends State {
  _RestaurantViewState();
  var f = NumberFormat.currency(locale: 'tr', decimalDigits: 0);
  int selectedCategory = 0;
  List<Products> selectedProducts = [];
  int selectedCategoryIndex = 0;
  final scrollController = ScrollController();
  double restaurantInfoHeight = 300 //AppBar expandedHeight
      +
      170 //Restaurant Height Info
      -
      kToolbarHeight;
  @override
  void initState() {
    createBreakPoints();
    scrollController.addListener(() {
      //print(scrollController.offset);
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (int i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }
      //116=100 menu item height + 16 bottom padding
      //50= 18 title font size + 32(16 vertical padding on title)
      scrollController.animateTo(
          restaurantInfoHeight + (116 * totalItems) + (50 * index),
          duration: Duration(microseconds: 500),
          curve: Curves.ease);
    }
    setState(() {
      selectedCategoryIndex = index;
    });
  }

// scroll to select category
  List<double> breakPoints = [];
  void createBreakPoints() {
    //116=100 menu item height + 16 bottom padding
    //50= 18 title font size + 32(16 vertical padding on title)
    double firstBreakPoint =
        restaurantInfoHeight + 50 + (116 * demoCategoryMenus[0].items.length);
    breakPoints.add(firstBreakPoint);
    for (int i = 1; i < demoCategoryMenus.length; i++) {
      double breakPoint =
          breakPoints.last + 50 + (116 * demoCategoryMenus[i].items.length);
      breakPoints.add(breakPoint);
    }
  }

  void updateCategoryIndexOnScroll(double offset) {
    for (int i = 1; i < demoCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breakPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      } else if ((breakPoints[i - 1] <= offset) & (offset < breakPoints[i])) {
        if (selectedCategoryIndex != i) {
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: CustomScrollView(controller: scrollController, slivers: [
          RestaurantAppBar(),
          SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverPersistentHeader(
            delegate: RestaurantCategories(
                onChanged: scrollToCategory,
                selectedIndex: selectedCategoryIndex),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, categoryIndex) {
                List<Menu> items = demoCategoryMenus[categoryIndex].items;

                return MenuCategoryItem(
                  title: demoCategoryMenus[categoryIndex].category,
                  items: List.generate(
                      items.length,
                      (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: MenuCard(
                              title: items[index].title,
                              image: items[index].image,
                              price: items[index].price))),
                );
              }, childCount: demoCategoryMenus.length),
            ),
          ),
        ]),
      ),

    );
  }
}
