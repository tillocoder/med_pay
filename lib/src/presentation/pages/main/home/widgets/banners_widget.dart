import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({
    super.key,
    required this.controller,
    required this.bannerListener,
  });

  final PageController controller;
  final ValueNotifier<int> bannerListener;

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding:AppUtils.kPaddingAll6,
              child: SizedBox(
                height: 175,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) => bannerListener.value = index,
                  itemCount: state.bannerResponse?.banners?.length ?? 0,
                  itemBuilder: (_, index) => Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: ClipRRect(
                      borderRadius: AppUtils.kBorderRadius10,
                      child: CachedNetworkImage(
                        imageUrl: state.bannerResponse?.banners?[index].image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
              width: double.infinity,
              child: Center(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => ValueListenableBuilder(
                    valueListenable: bannerListener,
                    builder: (_, i, __) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        color: i % 3 == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => AppUtils.kGap4,
                  itemCount: state.bannerResponse?.banners?.length ?? 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
}