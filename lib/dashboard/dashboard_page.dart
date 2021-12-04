import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedUser = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                "Сотрудники",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Divider(),
            SizedBox(
              width: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedUser = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: index == selectedUser
                            ? Colors.lightBlue.withOpacity(0.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            foregroundImage: NetworkImage(
                                "https://www.belta.by/images/storage/news/with_archive/2021/000029_1630402345_457669_big.jpg"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            users[index].name,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: SfCartesianChart(
            title: ChartTitle(text: "Эмоциональное состояние"),
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<SplineAreaData, String>>[
              users[selectedUser].data,
            ],
          ),
        ),
      ],
    );
  }
}

final users = <User>[
  User(
    name: 'Птушкин И.А.',
    data: LineSeries<SplineAreaData, String>(
      dataSource: <SplineAreaData>[
        SplineAreaData('Январь', 35),
        SplineAreaData('Февраль', 28),
        SplineAreaData('Март', 34),
        SplineAreaData('Апрель', 32),
        SplineAreaData('Май', 40)
      ],
      xValueMapper: (SplineAreaData sales, _) => sales.year,
      yValueMapper: (SplineAreaData sales, _) => sales.y1,
    ),
  ),
  User(
    name: 'Иванов А.И.',
    data: LineSeries<SplineAreaData, String>(
      dataSource: <SplineAreaData>[
        SplineAreaData('Январь', 22),
        SplineAreaData('Февраль', 40),
        SplineAreaData('Март', 30),
        SplineAreaData('Апрель', 33),
        SplineAreaData('Май', 25)
      ],
      xValueMapper: (SplineAreaData sales, _) => sales.year,
      yValueMapper: (SplineAreaData sales, _) => sales.y1,
    ),
  ),
  User(
    name: 'Дождливый К.К.',
    data: LineSeries<SplineAreaData, String>(
      dataSource: <SplineAreaData>[
        SplineAreaData('Январь', 25),
        SplineAreaData('Февраль', 20),
        SplineAreaData('Март', 36),
        SplineAreaData('Апрель', 30),
        SplineAreaData('Май', 30)
      ],
      xValueMapper: (SplineAreaData sales, _) => sales.year,
      yValueMapper: (SplineAreaData sales, _) => sales.y1,
    ),
  ),
];

class SplineAreaData {
  SplineAreaData(this.year, this.y1);
  final String year;
  final double y1;
}

class User {
  String name;
  LineSeries<SplineAreaData, String> data;
  User({
    required this.name,
    required this.data,
  });
}
