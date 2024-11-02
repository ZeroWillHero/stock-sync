import 'package:flutter/cupertino.dart';
import 'package:stock_sync/constants/Constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class IncomeGraph extends StatefulWidget {
  const IncomeGraph({super.key});

  @override
  State<IncomeGraph> createState() => _IncomeGraphState();
}

class _IncomeGraphState extends State<IncomeGraph> {
  // List<SalesData> data = [
  //   SalesData('Jan', 35),
  //   SalesData('Feb', 28),
  //   SalesData('Mar', 34),
  //   SalesData('Apr', 32),
  //   SalesData('May', 40)
  // ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <LineSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
              // Bind data source
              dataSource: <SalesData>[
                SalesData('Jan', 30),
                SalesData('Feb', 40),
                SalesData('Mar', 40),
                SalesData('Apr', 2),
                SalesData('june', 10),
                SalesData('july', 10),
                SalesData('August', 10),
                SalesData('sep', 10),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              color: secondaryColor,
            )
          ]),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
