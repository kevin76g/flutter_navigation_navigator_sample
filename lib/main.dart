import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String title = 'Navigator Example';
  static const textStyle = TextStyle(fontSize: 26.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      initialRoute: '/',
      routes: {
        '/': (context) => const Page1Screen(),
        '/page2': (context) => const Page2Screen(),
      },
    );
  }
}

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(MyApp.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Page1',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Page2Screen.routeName,
                    arguments: Page2ScreenArguments(
                      'grape',
                    ),
                  );
                },
                child: const Text('id:100 ぶどう', style: MyApp.textStyle),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Page2Screen.routeName,
                    arguments: Page2ScreenArguments(
                      'banana',
                    ),
                  );
                },
                child: const Text('id:200 バナナ', style: MyApp.textStyle),
              ),
            ],
          ),
        ),
      );
}

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);
  static const routeName = '/page2';

  static const List<Map> fruits = [
    {
      'id': 'grape',
      'title': 'ぶどう',
    },
    {
      'id': 'banana',
      'title': 'バナナ',
    },
  ];

  String getFruitTitle(String id) {
    for (var fruit in fruits) {
      if (fruit['id'] == id) {
        return fruit['title'];
      }
    }
    return 'none';
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Page2ScreenArguments;
    final title = getFruitTitle(args.id);

    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Page2',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              '$titleです！',
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2ScreenArguments {
  final String id;

  Page2ScreenArguments(this.id);
}
