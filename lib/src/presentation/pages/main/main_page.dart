import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'basket/basket_page.dart';
import 'entries/entries_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';
import 'widgets/custom_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<MainBloc, MainState, BottomMenu>(
        selector: (state) => state.bottomMenu,
        builder: (_, bottomMenu) => WillPopScope(
          onWillPop: () async {
            if (bottomMenu.index != 0) {
              context
                  .read<MainBloc>()
                  .add(MainEventChanged(BottomMenu.values[0]));
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: IndexedStack(
              index: bottomMenu.index,
              children: const [
                HomePage(),
                BasketPage(),
                MyOrderPage(),
                ProfilePage()
              ],
            ),
            bottomNavigationBar: CustomBottomBar(
              currentIndex: bottomMenu.index,
              onTap: (index) {
                if (index == bottomMenu.index) {
                  context.read<HomeBloc>().add(
                        const HomeScroll(isScrollingTop: true),
                      );
                  return;
                }
                context
                    .read<MainBloc>()
                    .add(MainEventChanged(BottomMenu.values[index]));
              },
              onScanTap: () {},
            ),
          ),
        ),
      );
}
