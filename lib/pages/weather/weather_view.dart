//getx weather view page
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_test_app/const/strings.dart';
import 'package:weather_test_app/pages/weather/weather_controller.dart';

// ignore: use_key_in_widget_constructors
class WeatherView extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appName)),
      body: SafeArea(
        child: controller.obx(
          (state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                //key: PageStorageKey(0),
                itemCount: controller.weatherModel.value.content.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.weatherModel.value.content[index].regionName,
                    ),
                    subtitle: Text(
                      controller.weatherModel.value.content[index].pollen.birke
                          .tomorrow,
                    ),
                  );
                },
              ),
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) =>
              const Center(child: Text(AppStrings.unknownError)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.callRefresh,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
