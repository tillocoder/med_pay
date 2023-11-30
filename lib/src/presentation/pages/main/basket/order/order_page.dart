import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/bottom_navigation_button.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/basket/order/deliver_tab/deliver_tab_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/basket/order/pick_up_tab/pick_up_tab_page.dart';

class OrderCreatePage extends StatefulWidget {
  const OrderCreatePage({super.key});

  @override
  State<OrderCreatePage> createState() => _OrderCreatePageState();
}

class _OrderCreatePageState extends State<OrderCreatePage>{
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
            ),
            title: const Text('Оформить заказ'),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white60,
              tabs: [
                Tab(
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: const Center(
                      child: Text('Доставка'),
                    ),
                  ),
                ),
                Tab(
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: const Center(
                      child: Text('Самовывоз'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              DeliverTabPage(),
              PickUpPageTab(),
            ],
          ),
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: BottomNavigationButton(
                child: ElevatedButton(
              onPressed: () {},
              child: const Text('Заказать'),
            ),
            ),
          ),
          ),
        ),
      );
}

