import 'package:cotton_app/data/model/admin_sales/sales_modal.dart';
import 'package:cotton_app/data/services/admin/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:cotton_app/representation/widget/loader.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null // earnings == null ||
        ? const Loader()
        : Column(
      children: [
        Text(
          'Rs$totalSales',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // SizedBox(
        //   height: 250,
        //   child: CategoryProductsChart(seriesList: [
        //     charts.Series(
        //       id: 'Sales',
        //       data: earnings!,
        //       domainFn: (Sales sales, _) => sales.label,
        //       measureFn: (Sales sales, _) => sales.earning,
        //     ),
        //   ]),
        // )
      ],
    );
  }
}
