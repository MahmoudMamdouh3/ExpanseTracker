import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Expenses(),
    );
  }
}

class ExpenseItem {
  final String name;
  final double cost;

  ExpenseItem({required this.name, required this.cost});
}

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseItem> _items = [];

  void _addItem() {
    // Placeholder for add item logic
    // In a real app, you might show a dialog or another screen to input new item details
    setState(() {
      _items.add(ExpenseItem(name: 'New Item', cost: 99.99));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Flutter Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addItem,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index].name),
            trailing: Text('\$${_items[index].cost.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
