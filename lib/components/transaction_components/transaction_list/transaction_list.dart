import 'package:financas_pessoais/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2)),
                  padding: EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "R\$ ${tr.value.toStringAsFixed(2)}",
                    style: 
                  const TextStyle(
                        // fontFamily:,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.title,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      DateFormat('d MMM y').format(tr.date),
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
