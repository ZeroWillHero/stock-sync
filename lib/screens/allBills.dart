import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stock_sync/components/billData.dart';
import 'package:stock_sync/models/billModel.dart';
import 'package:stock_sync/repository/billRepo.dart';

class AllBills extends StatefulWidget {
  const AllBills({super.key});

  @override
  State<AllBills> createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> {
  final BillRepo _billRepo = Get.put(BillRepo());
  Future<List<Bill>>? _billsFuture;
  String _selectedStatus = 'all';

  @override
  void initState() {
    super.initState();
    _billsFuture = _billRepo.getAllBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                "All Bills",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  value: _selectedStatus,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStatus = newValue!;
                    });
                  },
                  items: <String>['all', 'paid', 'unpaid']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("shop", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("date", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("total", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("status", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              FutureBuilder<List<Bill>>(
                future: _billsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No bills found');
                  } else {
                    List<Bill> filteredBills = snapshot.data!;
                    if (_selectedStatus != 'all') {
                      filteredBills = filteredBills
                          .where((bill) => bill.status == _selectedStatus)
                          .toList();
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredBills.length,
                        itemBuilder: (context, index) {
                          final bill = filteredBills[index];
                          final formattedDate = DateFormat('MM/dd').format(bill.date);
                          return BillData(
                            shop: bill.shopName,
                            date: formattedDate,
                            total: bill.totalPrice,
                            status: bill.status,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}