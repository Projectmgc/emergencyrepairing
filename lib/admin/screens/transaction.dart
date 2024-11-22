import 'package:flutter/material.dart';

class TransactionManagementPage extends StatefulWidget {
  @override
  _TransactionManagementPageState createState() =>
      _TransactionManagementPageState();
}

class _TransactionManagementPageState extends State<TransactionManagementPage> {
  List<Map<String, String>> transactions = [
    {
      'id': 'T001',
      'amount': '100',
      'status': 'Completed',
      'station': 'Station 1',
      'date': '2024-11-01'
    },
    {
      'id': 'T002',
      'amount': '200',
      'status': 'Pending',
      'station': 'Station 2',
      'date': '2024-11-02'
    },
    {
      'id': 'T003',
      'amount': '150',
      'status': 'Failed',
      'station': 'Station 3',
      'date': '2024-11-03'
    },
    {
      'id': 'T004',
      'amount': '300',
      'status': 'Completed',
      'station': 'Station 4',
      'date': '2024-11-04'
    },
    {
      'id': 'T005',
      'amount': '250',
      'status': 'Pending',
      'station': 'Station 5',
      'date': '2024-11-05'
    },
  ];

  String searchQuery = '';
  String filterStatus = 'All';
  String sortBy = 'Date';
  bool selectAll = false;
  Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredTransactions = _getFilteredTransactions();

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Transaction Management'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteSelectedTransactions,
            tooltip: 'Delete Selected',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchAndFilter(),
            SizedBox(height: 20),
            _buildSortOptions(),
            SizedBox(height: 20),
            _buildTransactionStats(filteredTransactions),
            SizedBox(height: 20),
            _buildAddTransactionButton(),
            SizedBox(height: 20),
            Expanded(child: _buildTransactionList(filteredTransactions)),
          ],
        ),
      ),
    );
  }

  // Search and Filter Section
  Widget _buildSearchAndFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSearchField(),
        SizedBox(width: 10),
        _buildStatusFilterDropdown(),
      ],
    );
  }

  // Search Field for Transaction ID, Amount, or Station
  Widget _buildSearchField() {
    return Expanded(
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        decoration: InputDecoration(
          labelText: 'Search by ID, Amount, or Station',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  // Dropdown for filtering by status
  Widget _buildStatusFilterDropdown() {
    return DropdownButton<String>(
      value: filterStatus,
      onChanged: (newStatus) {
        setState(() {
          filterStatus = newStatus!;
        });
      },
      items: ['All', 'Completed', 'Pending', 'Failed']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  // Sorting Options
  Widget _buildSortOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Sort By:'),
        DropdownButton<String>(
          value: sortBy,
          onChanged: (newSortOption) {
            setState(() {
              sortBy = newSortOption!;
            });
          },
          items: ['Date', 'Amount', 'ID']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Transaction Stats (Total Amount, Status Breakdown)
  Widget _buildTransactionStats(
      List<Map<String, String>> filteredTransactions) {
    int completedCount =
        filteredTransactions.where((t) => t['status'] == 'Completed').length;
    int pendingCount =
        filteredTransactions.where((t) => t['status'] == 'Pending').length;
    int failedCount =
        filteredTransactions.where((t) => t['status'] == 'Failed').length;
    double totalAmount = filteredTransactions.fold(
        0, (sum, t) => sum + double.parse(t['amount']!));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total Transactions: ${filteredTransactions.length}',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
            'Completed: $completedCount, Pending: $pendingCount, Failed: $failedCount'),
        Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
      ],
    );
  }

  // Add Transaction Button
  Widget _buildAddTransactionButton() {
    return ElevatedButton.icon(
      onPressed: () {
        _showAddTransactionDialog(context);
      },
      icon: Icon(Icons.add, color: Colors.white),
      label: Text('Add Transaction'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
    );
  }

  // List of filtered transactions
  Widget _buildTransactionList(List<Map<String, String>> filteredTransactions) {
    return ListView.builder(
      itemCount: filteredTransactions.length,
      itemBuilder: (context, index) {
        return _transactionCard(filteredTransactions[index], index);
      },
    );
  }

  // Transaction Card UI
  Widget _transactionCard(Map<String, String> transaction, int index) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(Icons.payment, color: Colors.blueGrey),
        title: Text(
            'ID: ${transaction['id']} - Amount: \$${transaction['amount']}'),
        subtitle: Text(
            '${transaction['station']} - ${transaction['status']} - ${transaction['date']}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkbox for selecting multiple transactions
            Checkbox(
              value: selectedIndexes.contains(index),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedIndexes.add(index);
                  } else {
                    selectedIndexes.remove(index);
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                _showEditTransactionDialog(context, index);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _confirmDeleteTransaction(context, index);
              },
            ),
          ],
        ),
        onTap: () {
          _showTransactionDetailsDialog(transaction);
        },
      ),
    );
  }

  // View Full Transaction Details
  void _showTransactionDetailsDialog(Map<String, String> transaction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Transaction Details - ${transaction['id']}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Amount: \$${transaction['amount']}'),
              Text('Status: ${transaction['status']}'),
              Text('Station: ${transaction['station']}'),
              Text('Date: ${transaction['date']}'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Close')),
          ],
        );
      },
    );
  }

  // Add Transaction Dialog
  void _showAddTransactionDialog(BuildContext context) {
    final _idController = TextEditingController();
    final _amountController = TextEditingController();
    final _stationController = TextEditingController();
    String _status = 'Completed';
    String _date = DateTime.now().toString().substring(0, 10);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Transaction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'Transaction ID')),
              TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: _stationController,
                  decoration: InputDecoration(labelText: 'Fuel Station')),
              DropdownButton<String>(
                value: _status,
                onChanged: (newStatus) {
                  setState(() {
                    _status = newStatus!;
                  });
                },
                items: ['Completed', 'Pending', 'Failed']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                  controller: TextEditingController(text: _date),
                  decoration: InputDecoration(labelText: 'Date'),
                  readOnly: true),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  transactions.add({
                    'id': _idController.text,
                    'amount': _amountController.text,
                    'status': _status,
                    'station': _stationController.text,
                    'date': _date,
                  });
                });
                Navigator.pop(context);
              },
              child: Text('Add Transaction'),
            ),
          ],
        );
      },
    );
  }

  // Edit Transaction Dialog
  void _showEditTransactionDialog(BuildContext context, int index) {
    final _idController =
        TextEditingController(text: transactions[index]['id']);
    final _amountController =
        TextEditingController(text: transactions[index]['amount']);
    final _stationController =
        TextEditingController(text: transactions[index]['station']);
    String _status = transactions[index]['status']!;
    String _date = transactions[index]['date']!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Transaction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'Transaction ID')),
              TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number),
              TextField(
                  controller: _stationController,
                  decoration: InputDecoration(labelText: 'Fuel Station')),
              DropdownButton<String>(
                value: _status,
                onChanged: (newStatus) {
                  setState(() {
                    _status = newStatus!;
                  });
                },
                items: ['Completed', 'Pending', 'Failed']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                  controller: TextEditingController(text: _date),
                  decoration: InputDecoration(labelText: 'Date'),
                  readOnly: true),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  transactions[index] = {
                    'id': _idController.text,
                    'amount': _amountController.text,
                    'status': _status,
                    'station': _stationController.text,
                    'date': _date,
                  };
                });
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        );
      },
    );
  }

  // Confirm Delete Transaction
  void _confirmDeleteTransaction(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Transaction'),
          content: Text(
              'Are you sure you want to delete transaction ${transactions[index]['id']}?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  transactions.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Delete Selected Transactions
  void _deleteSelectedTransactions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Selected Transactions'),
          content: Text(
              'Are you sure you want to delete ${selectedIndexes.length} selected transactions?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndexes.toList().sort((a, b) => b.compareTo(
                      a)); // Sort in reverse order to delete from the end
                  for (int index in selectedIndexes) {
                    transactions.removeAt(index);
                  }
                  selectedIndexes.clear();
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Filter transactions based on search query and status filter
  List<Map<String, String>> _getFilteredTransactions() {
    return transactions.where((transaction) {
      return transaction['id']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          transaction['amount']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          transaction['station']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
    }).where((transaction) {
      return filterStatus == 'All' || transaction['status'] == filterStatus;
    }).toList()
      ..sort((a, b) {
        switch (sortBy) {
          case 'Amount':
            return double.parse(a['amount']!)
                .compareTo(double.parse(b['amount']!));
          case 'ID':
            return a['id']!.compareTo(b['id']!);
          case 'Date':
          default:
            return a['date']!.compareTo(b['date']!);
        }
      });
  }
}
