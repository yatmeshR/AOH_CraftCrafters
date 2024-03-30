import 'dart:convert';

import 'package:cotton_app/constant/error_handling.dart';
import 'package:cotton_app/constant/global_variable.dart';
import 'package:cotton_app/data/model/order/order_modal.dart';
import 'package:cotton_app/provider/user_provider.dart';
import 'package:cotton_app/representation/ui/auth/log_or_reg.dart';
import 'package:cotton_app/representation/widget/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountServices {
  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginOrReg.routeName,
            (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}