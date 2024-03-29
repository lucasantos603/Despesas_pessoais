import 'package:financas_pessoais/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
   final void Function(String)? onRemove;

  const TransactionList({Key? key, required this.transactions, this.onRemove,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Nenhuma Transação cadastrada",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    height: 200,
                    // width: 100,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text("R\$${tr.value}")),
                      ),
                    ),
                    title: Text(tr.title, style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    trailing: IconButton(icon: const Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => onRemove!(tr.id)),
                  ),
                );
              },
            ),
    );
  }
}
