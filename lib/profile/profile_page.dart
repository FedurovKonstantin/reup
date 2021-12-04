import 'dart:html';

import 'package:flutter/material.dart';
import 'package:reup/dashboard/dashboard_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return ProfilePageView();
          },
        );
      },
    );
  }
}

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                foregroundImage: NetworkImage(
                    "https://www.belta.by/images/storage/news/with_archive/2021/000029_1630402345_457669_big.jpg"),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                users.first.name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: ElevatedButton(
            onPressed: () {
              launch('https://forms.gle/qH5tpx2zRZkCgmUq7');
            },
            child: Text('Пройти первоначальную диагностику'),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SfCartesianChart(
              title: ChartTitle(text: "Ваше эмоциональное состояние"),
              primaryXAxis: CategoryAxis(),
              series: <LineSeries<SplineAreaData, String>>[
                users.last.data,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
