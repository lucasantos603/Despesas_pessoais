import 'dart:math';

import 'package:financas_pessoais/components/transaction_components/transaction_form/transaction_form.dart';
import 'package:financas_pessoais/components/transaction_components/transaction_list/transaction_list.dart';
import 'package:financas_pessoais/models/transaction/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: "t1",
        title: "Tenis de Corrida Novo",
        value: 310.76,
        date: DateTime.now())
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TransactionForm(_addTransaction), TransactionList(transactions: _transactions)],
    );
  }
}
