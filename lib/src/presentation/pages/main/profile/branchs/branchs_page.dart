import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/profile/profile_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/branchs/barnchs_detail/branchs_detail_model.dart';

class BranchsPage extends StatelessWidget {
  const BranchsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state is ProfileSuccess) {
                            return Material(
                              borderRadius: AppUtils.kBorderRadius12,
                              color: context.color.white,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.allBranchs.branches
                                      ?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    final branchItem = state.allBranchs
                                        .branches?[index];
                                   return Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            context.pushNamed(
                                              Routes.branchsDetail,
                                              extra: BranchArguments(
                                                  branchName: branchItem
                                                      ?.name ?? '',
                                                  image: 'assets/fonts/ploff_image.jpg',
                                                  phoneNumber: branchItem
                                                      ?.phone ?? '',
                                                  address: branchItem
                                                      ?.address ?? '',
                                                  workEnd: branchItem
                                                      ?.workHourEnd ?? '',
                                                  workStart: branchItem
                                                      ?.workHourStart ?? ''),);
                                          },
                                          title: Text(
                                            state.allBranchs.branches?[index]
                                                .name ?? 'No data',
                                          ),
                                          subtitle: Text(
                                            state.allBranchs.branches?[index]
                                                .address ?? 'No data',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                          leading: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/fonts/ploff_image.jpg'),
                                          ),
                                          trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded),
                                        ),
                                        Divider(
                                          color: Colors.grey.withOpacity(0.3),
                                          thickness: 1,
                                          height: 0.5,
                                        ),
                                      ],
                                    );
                                  }
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
      );
}