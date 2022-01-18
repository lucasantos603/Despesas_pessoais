import 'dart:math';

import 'package:financas_pessoais/components/chart_widget/chart.dart';
import 'package:financas_pessoais/components/transaction_components/transaction_form/transaction_form.dart';
import 'package:financas_pessoais/components/transaction_components/transaction_list/transaction_list.dart';
import 'package:financas_pessoais/components/transaction_components/transaction_user/transaction_user.dart';
import 'package:flutter/material.dart';

import 'package:financas_pessoais/models/transaction/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "t0",
        title: "Conta Antiga",
        value: 400.00,
        date: DateTime.now().subtract(Duration(days: 33))),
        Transaction(
        id: "t2",
        title: "Novo Tênis de Corrida",
        value: 310.76,
         date: DateTime.now().subtract(Duration(days: 2))),
        Transaction(
        id: "t3",
        title: "Conta de Luz",
        value: 211.30,
         date: DateTime.now().subtract(Duration(days: 1))),
  ];

  List<Transaction> get _recentTransaction{
    return _transactions.where((tr){
      return tr.date.isAfter(DateTime.now().subtract(Duration(days:7)));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop;
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
    // Navigator.of(context).pop;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Despesas Pessoais",
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Chart(_recentTransaction),
            TransactionList(transactions: _transactions),
            // TransactionForm(_addTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
