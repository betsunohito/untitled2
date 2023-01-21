import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Restoran Adı",
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF868686),
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      //child:CircleAvatar(radius: 2, backgroundColor: Color(0xFF868686),),
                    ),
                    SizedBox(
                      width: 330,
                      child: Text(
                        "Restoran Adres Restoran Adres Restoran Adres Restoran Adres",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: const [
                InfoCard(
                  svgSrc: "assets/icons/clock.svg",
                  title: "",
                  subtitle: "Telefon Numarsı",
                ),
                SizedBox(width: 16),
                InfoCard(
                  svgSrc: "assets/icons/clock.svg",
                  title: "8:30 - 17:30",
                  subtitle: "Çalışma Saatleri",
                ),
                SizedBox(width: 24),
                Spacer(),
              ],
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String svgSrc, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(svgSrc),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}
