// import 'dart:html';

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  late final void Function(String, double)? onSubmit;

  TransactionForm(
    this.onSubmit,
  );

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  _submitForm() {
    final String title = _titleController.text;
    final double value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit!(title, value);
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
                children: [
                  Text('Nenhuma data Selecionada'),
                  FlatButton(
                    onPressed: () {},
                    child: const Text(
                      "Selecionar Data",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      

                      final String title = _titleController.text;
                      final double value =
                          double.tryParse(_valueController.text) ?? 0.0;

                      widget.onSubmit!(title, value);
                    },
                    child: Text(
                      "Nova Transação",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
