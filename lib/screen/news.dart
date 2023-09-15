import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/homePage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/customAppBar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Haberin olsun",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CardButton(
                      onPressed: () {
                        launchURL('https://www.osym.gov.tr/TR,25348/2023.html');
                      },
                      image: 'assets/osym.png',
                      buttonText: 'ÖSYM',
                      buttonTextSize: 80,
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {
                        launchURL('https://yokatlas.yok.gov.tr');
                      },
                      image: 'assets/yok.png',
                      buttonText: 'YÖK',
                      buttonTextSize: 80,
                      containerHeight: 150,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    CardButton(
                      onPressed: () {
                        launchURL('https://ogmmateryal.eba.gov.tr/YKSHazirlik');
                      },
                      image: 'assets/ogm.png',
                      buttonText: 'OGM',
                      buttonTextSize: 80,
                      containerHeight: 130,
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
