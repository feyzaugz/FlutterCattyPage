import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          d!.uygulamaBaslik,
          style: TextStyle(
            fontSize: screenWidth / 14,
            color: Color.fromARGB(255, 199, 27, 133),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: ClippingClass(
                bottomCurveHeight: 50,
                topCurveHeight: 50,
              ),
              child: SizedBox(
                height: screenHeight / 1.9,
                child: Image.asset(
                  "images/cat.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    d.kediIsim,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    d.kediUcret,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    d.kediMesafe,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cards(
                  title: d.kediYasi,
                  text: d.kediYasiText,
                  color: const Color.fromARGB(255, 250, 216, 116),
                ),
                Cards(
                  title: d.kediCinsiyeti,
                  text: d.kediCinsiyetiText,
                  color: const Color.fromARGB(255, 199, 142, 209),
                ),
                Cards(
                  title: d.kediKilosu,
                  text: d.kediKilosuText,
                  color: const Color.fromARGB(255, 236, 131, 166),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                d.kediHakkindaText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                d.kediHakkinda,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 102, 100, 100),
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  final double bottomCurveHeight;
  final double topCurveHeight;

  ClippingClass({
    required this.bottomCurveHeight,
    required this.topCurveHeight,
  });

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - bottomCurveHeight);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - topCurveHeight);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Cards extends StatelessWidget {
  String title;
  String text;
  Color color;
  Cards({
    super.key,
    required this.title,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 102, 100, 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
