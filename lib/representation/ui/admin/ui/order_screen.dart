import 'package:cotton_app/data/model/order/order_modal.dart';
import 'package:cotton_app/data/services/admin/admin_services.dart';
import 'package:cotton_app/representation/ui/account/widget/account.dart';
import 'package:cotton_app/representation/ui/detail/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:cotton_app/representation/widget/loader.dart';



class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
      itemCount: orders!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        final orderData = orders![index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              OrderDetailPage.routeName,
              arguments: orderData,
            );
          },
          child: SizedBox(
            height: 140,
            child: SingleProduct(
              image: orderData.products[0].images[0],
            ),
          ),
        );
      },
    );
  }
}