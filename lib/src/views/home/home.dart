import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/text/custom_text.dart';
import 'package:foodpanda/src/reuseable_widget/textfield/app_textfield.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/home/widget/found.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getRes();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          drawerEnableOpenDragGesture: false,
          drawer: const Drawer(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: AppColors.white),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.customSizedText(
                  text: 'MoneyGram',
                  size: 18,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
                CustomText.customSizedText(
                  text: 'Karachi',
                  size: 14,
                  color: AppColors.white,
                ),
              ],
            ),
            actions: const [
              SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.favorite_border_rounded),
                    Icon(Icons.shopping_bag_outlined),
                  ],
                ),
              )
            ],
          ),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, right: 10, left: 15),
                    child: CustomTextFields.appTextField(
                      hintText: 'Search for shops & restaurants',
                      height: 45,
                      prefixIcon: Icons.search_rounded,
                    ),
                  ),
                )
              ];
            },
            body: homeFound(context, viewModel, viewModel.getData!),
          ),
        );
      },
    );
  }
}