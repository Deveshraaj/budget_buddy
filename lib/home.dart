import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart package

void main() {
  runApp(homepage());
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget Buddy',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Icon(Icons.account_balance_wallet, size: 30),
              SizedBox(width: 10),
              Text(
                'Budget Buddy',
                style: TextStyle(fontSize: 24, fontFamily: 'Raleway'),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings page
              },
            ),
          ],
        ),
        backgroundColor:
        Colors.green.shade50, // Setting background color to a light shade of green
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Balance Summary',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.shade400,
                          Colors.green.shade900
                        ], // Gradient colors matching theme color
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Total Balance:',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          '₹10,000',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Savings: ₹5,000',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          'Checking: ₹3,000',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        Text(
                          'Investments: ₹2,000',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildQuickActionButton(
                      Icons.add_circle_outline, 'Add Transaction', () {
                    // Handle add transaction action
                  }),
                  _buildQuickActionButton(Icons.swap_horiz, 'Transfer Money', () {
                    // Handle transfer money action
                  }),
                  _buildQuickActionButton(Icons.attach_money, 'Set Budget', () {
                    // Handle set budget action
                  }),
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Transaction History',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              // Add transaction history list here
              buildTransactionHistory(),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Expenses Overview',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              // Add expenses overview widgets here
              buildExpensesOverview(),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tips and Reminders',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              // Add tips and reminders widgets here
              buildTips(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
      IconData icon, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Icon(icon, size: 40.0, color: Colors.green),
          SizedBox(height: 8.0),
          Text(label, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }

  Widget buildTransactionHistory() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Shopping'),
          subtitle: Text('₹100 - Grocery'),
          trailing: Text('May 10'),
        ),
        ListTile(
          leading: Icon(Icons.fastfood),
          title: Text('Dining'),
          subtitle: Text('₹50 - Restaurant'),
          trailing: Text('May 9'),
        ),
        ListTile(
          leading: Icon(Icons.local_gas_station),
          title: Text('Fuel'),
          subtitle: Text('₹200 - Gas station'),
          trailing: Text('May 8'),
        ),
      ],
    );
  }

  Widget buildExpensesOverview() {
    return Container(
      height: 200.0,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 25,
              color: Colors.blue,
              title: '25%',
            ),
            PieChartSectionData(
              value: 35,
              color: Colors.green,
              title: '35%',
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.orange,
              title: '20%',
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.red,
              title: '20%',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTips() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.lightbulb_outline),
          title: Text('Tip 1'),
          subtitle: Text('Remember to track your expenses daily.'),
        ),
        ListTile(
          leading: Icon(Icons.lightbulb_outline),
          title: Text('Tip 2'),
          subtitle: Text('Set a budget for each category to manage spending.'),
        ),
        ListTile(
          leading: Icon(Icons.lightbulb_outline),
          title: Text('Tip 3'),
          subtitle: Text('Avoid unnecessary impulse purchases.'),
        ),
      ],
    );
  }
}
