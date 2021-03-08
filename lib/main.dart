import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'data/financial_data_repository.dart';
import 'ui/home_screen.dart';
import 'vm/home_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance Guru',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: {'/': (context) => Provider<HomeViewModel>(
            create: (ctx) => HomeViewModel(financialDataRepository: FinancialDataRepository.instance),
            child: HomeScreen()),
      },
    );
  }
}


