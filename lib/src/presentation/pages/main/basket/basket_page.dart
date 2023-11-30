import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/bottom_navigation_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(

    ),
      body: const YandexMap(),
    bottomNavigationBar: SafeArea(
      child: BottomNavigationButton(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.color.yellow
          ),
          child: const Text('Оформить заказ'),
          onPressed: (){context.pushNamed(Routes.orderPage);},
        ),
      ),
    ),
    );
}
