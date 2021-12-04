import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                "Добавить сотрудника",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Имя',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Фамилия',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Сотрудник успешно добавлен'),
                      actions: [
                        TextButton(
                          onPressed: Navigator.of(_).pop,
                          child: Text('Ок'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
