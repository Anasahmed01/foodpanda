import 'package:foodpanda/src/del_custom_model/popular_restaurants.dart';
import 'package:foodpanda/src/models/popular_restaurant.dart';
import 'package:foodpanda/src/views/cart/cart.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../home/home.dart';
import '../resturant_detail/resturant_detail.dart';

class FavouriteViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToHomeView() {
    locator<NavigationService>().navigateWithTransition(
      const HomeView(),
    );
  }

  navigateToCartView() {
    locator<NavigationService>().navigateWithTransition(
      const CartView(),
    );
  }

  navigateToResturantDetailView({
    required String deliveryType,
    required String deliveryPrice,
    required String resturantName,
    required String deliveryTime,
    required String discountText,
    required String resturantImage,
    required String resturantRating,
  }) {
    locator<NavigationService>().navigateWithTransition(
      ResturantDetailView(
        resturantRating: resturantRating,
        resturantImage: resturantImage,
        discountText: discountText,
        deliveryType: deliveryType,
        deliveryPrice: deliveryPrice,
        resturantName: resturantName,
        deliveryTime: deliveryTime,
      ),
    );
  }

  PopularRestDelModel? getResData;
  getRes() async {
    try {
      getResData = PopularRestDelModel.fromJson(PopularRestaurants.dummy);
    } catch (e) {
      print(e);
    }
  }
}
