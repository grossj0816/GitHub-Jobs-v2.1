import 'package:flutter/material.dart';
import './pages/job_search.dart';

void main() => runApp(App());


class App extends StatelessWidget
{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        home: JobSearch(),
      );
    }
}
