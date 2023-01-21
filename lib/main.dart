import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled2/screens/breakfast_body.dart';
import 'package:untitled2/screens/otogaleri.dart';
import 'package:untitled2/screens/restaurant_page.dart';

void main() {
  runApp(const MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State {
  int activeIndex = 0;
  final urlImages = [
    "assets/images/banner1.png",
    "assets/images/banner1.png",
    "assets/images/banner1.png",
    "assets/images/banner1.png",
    "assets/images/banner1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Column(
              children: [
                CarouselSlider.builder(
                  itemCount: urlImages.length,
                  options: CarouselOptions(
                    height: 120,
                    autoPlay: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                buildIndicator(),
              ],
            ),
            ElevatedButton(
              onPressed: (){ Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const RestaurantView()));},
              child: Row(
                children: const [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Restauranta git"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (){ Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const OtoGaleriView()));},
              child: Row(
                children: const [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Oto galeriye git"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (){ Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const BreakFastView()));},
              child: Row(
                children: const [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Kahvaltı Randevu Al git"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.asset(
        urlImage,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
      effect: const ScrollingDotsEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.indigo,
          dotColor: Colors.black12),
    );
  }
}

