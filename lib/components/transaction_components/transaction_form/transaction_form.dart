// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  late final void Function(String, double, DateTime) ? onSubmit;

  TransactionForm(
    this.onSubmit,
  );

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final String title = _titleController.text;
    final double value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit!(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return ;
      }else{
        setState(() {
          _selectedDate = pickedDate;
        });
      }

    });
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
                  decoration: const InputDecoration(labelText: "Valor"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                  controller: _valueController),
              Row(
                children: [
                  Expanded(child: Text(_selectedDate == DateTime.now() ? 'Dia Atual' : "Dia Selecionado: ${DateFormat('dd/MM/y').format(_selectedDate)}")),
                  // ignore: deprecated_member_use
                  FlatButton( //Trocar por ElevatedButton
                    onPressed: _showDatePicker,
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

                      widget.onSubmit!(title, value, _selectedDate);
                    },
                    child: Text(
                      "Nova Transação",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
