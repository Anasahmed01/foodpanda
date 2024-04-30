import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/product_detail_model.dart';
import 'package:foodpanda/src/views/home/home.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class CartViewModel extends BaseViewModel {
  init() {
    for (int j = 0; j < cart.length; j++) {
      double pp = cart[j].productPrice;
      sumPrice(pp);
    }
  }

  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToHomeView() {
    locator<NavigationService>().navigateWithTransition(
      const HomeView(),
      opaque: true,
      duration: const Duration(milliseconds: 500),
      transitionStyle: Transition.downToUp,
      curve: Curves.slowMiddle,
    );
  }

  bool customIcon = false;

  double totalPrice = 0;
  sumPrice(double pp) {
    totalPrice += pp;
  }
}