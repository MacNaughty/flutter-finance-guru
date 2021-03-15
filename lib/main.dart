import 'package:finance_guru/data/source/financial_dao.dart';
import 'package:finance_guru/data/source/financial_guru_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'data/financial_data_repository.dart';
import 'ui/home_screen.dart';
import 'vm/home_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final FinGuruDatabase finGuruDatabase = FinGuruDatabase();
  final Database database = await finGuruDatabase.initDB();

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  late Database database;

  MyApp({required Database database}) {
    this.database = database;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance Guru',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Provider<HomeViewModel>(
              create: (ctx) => HomeViewModel(
                financialDataRepository: FinancialDataRepository(
                  dao: FinancialDao(database: database),
                ),
              ),
              child: HomeScreen(),
            ),
      },
    );
  }
}
