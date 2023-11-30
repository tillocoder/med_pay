import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';

import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.white.withOpacity(0.1),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title:  Text('Профиль',style: ThemeTextStyles.light.bodyBody,),
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: AppUtils.kPaddingAll16,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    AppUtils.kGap16,
                    const  Material(
                     borderRadius:AppUtils.kBorderRadius12,
                     color: Colors.white,
                     child: ListTile(
                       title:  Text('default'),
                       subtitle:  Text('default'),
                       trailing: Icon(Icons.edit),
                     ),
                   ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                 Material(
                   color: context.color.white,
                   borderRadius: AppUtils.kBorderRadius12,
                   child: Column(
                     children: [
                       AppUtils.kDivider,
                       ProfileItemWidget(
                         iconBackgroundColor: context.color.green,
                         icon: const Icon(
                           Icons.location_on_outlined,
                         ),
                         title: 'Филиалы',
                         onTap: () {
                           context.pushNamed(Routes.branchs);
                         },
                       ),
                       AppUtils.kDivider,
                       ProfileItemWidget(
                         iconBackgroundColor: context.color.yellow,
                         icon: const Icon(
                         Icons.settings,
                         ),
                         title: 'Настройки',
                         onTap: () {},
                       ),
                       AppUtils.kDivider,
                       ProfileItemWidget(
                         iconBackgroundColor: context.color.green,
                         icon: const Icon(
                           Icons.location_off,
                         ),
                         title: 'Мои адресы',
                         onTap: () {},
                       ),
                       AppUtils.kDivider,
                       ProfileItemWidget(
                         iconBackgroundColor: context.color.blueLight,
                         icon: const Icon(
                           Icons.room_service_sharp,
                         ),
                         title: 'О сервисе',
                         onTap: () {},
                       ),
                     ],
                   ),
                 )

                ],
              ),
            ),
          ],
        ),
      );
}
