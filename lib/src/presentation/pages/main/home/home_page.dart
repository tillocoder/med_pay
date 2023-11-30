import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';
import 'widgets/banners_widget.dart';
import 'widgets/home_appbar.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.isScrollingTop != current.isScrollingTop,
        listener: listener,
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.1),
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              HomeAppBar(
                innerBoxIsScrolled: innerBoxIsScrolled,
              ),
            ],
            body: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                BannersWidget(
                  controller: _pageController,
                  bannerListener: _bannerListener,
                ),
                ...List.generate(
                  state.categoryWithProductResponse?.categories?.length ?? 0,
                  (index) {
                    final category =
                        state.categoryWithProductResponse?.categories?[index];
                    if (state.selectIndex.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Material(
                          borderRadius: AppUtils.kBorderRadius12,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: AppUtils.kPaddingLeftAndTop12,
                                child: Text(
                                  category?.title?.uz ?? '',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(height: 15),
                              ...List.generate(
                                category?.products?.length ?? 0,
                                (productIndex) {
                                  final product =
                                      category?.products?[productIndex];
                                  return SizedBox(
                                    height: 100,
                                    child: ListTile(
                                      onTap: () {
                                        context.read<HomeBloc>().add(
                                              AllProductsEvent(
                                                  id: state.id ?? ''),
                                            );
                                      },
                                      title:
                                          Text(product?.title?.uz ?? 'no data'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product?.description?.uz ?? 'no data',
                                          ),
                                          Text(
                                            '${product?.outPrice.toString()} ${product?.currency}',
                                          ),
                                        ],
                                      ),
                                      trailing: CachedNetworkImage(
                                        imageUrl: product?.image ?? '',
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/fonts/ploff_image.jpg'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      final categoryProducts = category?.products;
                      if (categoryProducts != null &&
                          categoryProducts.isNotEmpty) {
                        final categoryProduct =
                            categoryProducts[0]; // Accessing the first product
                        return SliverToBoxAdapter(
                          child: ListTile(
                            title: Text(categoryProduct.title?.uz ?? ''),
                            subtitle:
                                Text(categoryProduct.description?.uz ?? ''),
                            trailing: CachedNetworkImage(
                              imageUrl: categoryProduct.image ?? '',
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Image.asset('assets/fonts/ploff_image.jpg'),
                            ),
                          ),
                        );
                      } else {
                        return const SliverToBoxAdapter(
                            child:
                                SizedBox()); // Placeholder widget when there are no products
                      }
                    }
                  },
                ),
                // SliverToBoxAdapter(
                //   child: ColoredBox(
                //     color: Colors.red,
                //     child: ListView.builder(
                //       physics: const NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemCount: state.categoryWithProductResponse?.categories
                //               ?.length ??
                //           0,
                //       itemBuilder: (context, index) {
                //         final category = state
                //             .categoryWithProductResponse?.categories?[index];
                //         if (state.selectIndex.isEmpty) {
                //           return Material(
                //             borderRadius: AppUtils.kBorderRadius12,
                //             color: Colors.white,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Padding(
                //                   padding: AppUtils.kPaddingLeftAndTop12,
                //                   child: Text(
                //                     category?.title?.uz ?? '',
                //                     style: const TextStyle(color: Colors.black),
                //                   ),
                //                 ),
                //                 const SizedBox(
                //                   height: 15,
                //                 ),
                //                 ...List.generate(
                //                   category?.products?.length ?? 0,
                //                   (productIndex) {
                //                     final product =
                //                         category?.products?[productIndex];
                //                     return ListTile(
                //                       onTap: () {
                //                         context.read<HomeBloc>().add(
                //                               AllProductsEvent(
                //                                   id: state.id ?? ''),
                //                             );
                //                       },
                //                       title:
                //                           Text(product?.title?.uz ?? 'no data'),
                //                       subtitle: Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             product?.description?.uz ??
                //                                 'no data',
                //                           ),
                //                           Text(
                //                             '${product?.outPrice.toString()} ${product?.currency}',
                //                           ),
                //                         ],
                //                       ),
                //                       trailing: CachedNetworkImage(
                //                         imageUrl: product?.image ?? '',
                //                         placeholder: (context, url) =>
                //                             const Center(
                //                                 child:
                //                                     CircularProgressIndicator()),
                //                         errorWidget: (context, url, error) =>
                //                             Image.asset(
                //                                 'assets/fonts/ploff_image.jpg'),
                //                       ),
                //                     );
                //                   },
                //                 ),
                //               ],
                //             ),
                //           );
                //         } else {
                //           final categoryProducts = category?.products;
                //           if (categoryProducts != null &&
                //               categoryProducts.isNotEmpty) {
                //             final categoryProduct = categoryProducts[
                //                 0]; // Accessing the first product
                //             return ListTile(
                //               title: Text(categoryProduct.title?.uz ?? ''),
                //               subtitle:
                //                   Text(categoryProduct.description?.uz ?? ''),
                //               trailing: CachedNetworkImage(
                //                 imageUrl: categoryProduct.image ?? '',
                //                 placeholder: (context, url) => const Center(
                //                     child: CircularProgressIndicator()),
                //                 errorWidget: (context, url, error) =>
                //                     Image.asset('assets/fonts/ploff_image.jpg'),
                //               ),
                //             );
                //           } else {
                //             return const SizedBox(); // Placeholder widget when there are no products
                //           }
                //         }
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
