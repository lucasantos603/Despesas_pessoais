import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm(
    this.onSubmit,
  );

  _submitForm() {
    final String title = _titleController.text;
    final double value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextField(
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: "Titulo",
                ),
                controller: _titleController,
              ),
              TextField(
                  decoration: InputDecoration(labelText: "Valor"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                  controller: _valueController),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      final String title = _titleController.text;
                      final double value =
                          double.tryParse(_valueController.text) ?? 0.0;

                      onSubmit(title, value);
                    },
                    child: Text(
                      "Nova Transação",
                      style: TextStyle(color: Colors.purple[300]),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
