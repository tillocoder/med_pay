import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/branchs/barnchs_detail/branchs_detail_model.dart';

class BranchsDetailPage extends StatelessWidget {
  const BranchsDetailPage({super.key,required this.arguments});
  final BranchArguments arguments;
  @override
  Widget build(BuildContext context) =>  Scaffold(
    appBar: AppBar(),
    body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Material(
                color: context.color.white,
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 150,
                        width: 200,
                        child: Image.asset(arguments.image,fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: AppUtils.kPaddingAll8,
                      child:  Text(arguments.branchName,),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: const Text('Address',),
                      leading: const Icon(Icons.location_off_sharp),
                      trailing:  Text( arguments.address, ),
                    ),
                    const Divider(),
                    const ListTile(
                      title: Text( 'Ориентир', ),
                      leading: Icon(Icons.location_on_outlined),
                      trailing: Text('no data', ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Часы работы', ),
                      leading: const Icon(Icons.access_time),
                      trailing:  Text(
                           '${arguments.workStart}-${arguments.workEnd}'),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text( 'Номер телефона',),
                      leading: const Icon(Icons.phone),
                      trailing:
                       Text( arguments.phoneNumber, ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
