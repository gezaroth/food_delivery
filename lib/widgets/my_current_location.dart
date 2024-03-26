import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/home_controller.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/widgets/my_google_maps_form_field.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatefulWidget {
  MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final textController = TextEditingController();

  final homeController = Get.put(HomeController());

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Your Location',
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFormField(
                controller: homeController.addressSearch,
                onChanged: (String value) {
                  homeController.selectedAddress1.value = value;
                  debugPrint("value - $value");
                },
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              homeController.addressSearch.clear();
            },
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              String newAddress = homeController.addressSearch.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              homeController.addressSearch.clear();
              homeController.update();
              homeController.update();
              setState(() {});
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deliver now',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => openLocationSearchBox(context),
                  child: Row(
                    children: [
                      Consumer<Restaurant>(
                        builder: (context, restaurant, child) => Container(
                          width: 140,
                          height: 20,
                          child: Text(
                            restaurant.deliveryAddress,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 80,
                    child: Obx(() {
                      homeController.isLoading.value;
                      return homeController.isLoading.value
                          ? const Center(
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                                ),
                              ),
                            )
                          : ListView.separated(
                              padding: EdgeInsets.zero,
                              separatorBuilder: ((context, index) =>
                                  const Divider()),
                              itemCount: homeController.googleAutoCompleteModel
                                      ?.predictions?.length ??
                                  0,
                              shrinkWrap: true,
                              //physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    homeController.selectedAddress.value =
                                        homeController.googleAutoCompleteModel!
                                            .predictions[index].description;
                                    context
                                        .read<Restaurant>()
                                        .updateDeliveryAddress(homeController
                                            .selectedAddress.value);

                                    debugPrint(
                                        'Clicked - ${homeController.selectedAddress.value}');
                                  },
                                  title: Text(homeController
                                      .googleAutoCompleteModel!
                                      .predictions![index]
                                      .description),
                                  leading: const Icon(
                                    Icons.location_on_outlined,
                                  ),
                                );
                              },
                            );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
