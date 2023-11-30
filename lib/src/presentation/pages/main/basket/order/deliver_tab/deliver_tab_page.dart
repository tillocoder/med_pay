import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/components/text/textfield.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/basket/order/mixin/deliver_tab_mixin.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DeliverTabPage extends StatefulWidget {
  const DeliverTabPage({super.key});

  @override
  State<DeliverTabPage> createState() => _DeliverTabPageState();
}

class _DeliverTabPageState extends State<DeliverTabPage> with DeliverTabMixin{
  @override
  Widget build(BuildContext context) =>   CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [
      SliverToBoxAdapter(
        child: Material(
          borderRadius: AppUtils.kBorderRadius12,
          color: Colors.red,
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Адрес доставки',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16,),
                const Text('Текущий адрес'),
                const SizedBox(height: 8,),
                GlobalTextFiled(text: 'address',controller: addressController,),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlobalTextFiled(text: 'address',controller: addressController,),
                    GlobalTextFiled(text: 'address',controller: addressController,),
                    GlobalTextFiled(text: 'address',controller: addressController,),
                  ],
                ),
                const SizedBox(
                  height: 156,
                  width: double.infinity,
                  child: YandexMap(),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
