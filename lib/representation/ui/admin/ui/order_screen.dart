import 'package:flutter/material.dart';
import 'package:cotton_app/representation/widget/loader.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});
//
//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   List<Order>? orders;
  // final AdminServices adminServices = AdminServices();

  // @override
  // void initState() {
  //   super.initState();
  //   fetchOrders();
  // }

  // void fetchOrders() async {
  //   orders = await adminServices.fetchAllOrders(context);
  //   setState(() {});
  // }


//   @override
//   Widget build(BuildContext context) {
//     return orders == null
//         ? const Loader()
//         : GridView.builder(
//       itemCount: orders!.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2),
//       itemBuilder: (context, index) {
//         final orderData = orders![index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(
//               context,
//               OrderDetailPage.routeName,
//               arguments: orderData,
//             );
//           },
//           child: SizedBox(
//             height: 140,
//             child: SingleProduct(
//               image: orderData.products[0].images[0],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
