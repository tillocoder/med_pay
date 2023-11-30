import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/home/home_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.innerBoxIsScrolled,
  });

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: AppUtils.kBorderRadius10,
        ),
      ),
      backgroundColor: MaterialStatePropertyAll(
        Colors.white.withOpacity(0.24),
      ),
    );
    final color = innerBoxIsScrolled
        ? context.color.secondaryText
        : context.colorScheme.surface;
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      floating: true,
      toolbarHeight: 80,
      forceElevated: true,
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      // iconTheme: const IconThemeData(
      //   color: Colors.white,
      // ),
      // titleTextStyle: const TextStyle(
      //   fontSize: 18,
      //   color: Colors.white,
      //   fontWeight: FontWeight.w900,
      // ),
      systemOverlayStyle: innerBoxIsScrolled
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      backgroundColor: innerBoxIsScrolled
          ? context.theme.appBarTheme.backgroundColor
          : context.colorScheme.primary,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.location_on_outlined),),
          TextField(
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: AppUtils.kPaddingAll8,
              hintText: 'Поиск медицинских услуг',
              hintStyle: TextStyle(color: color),
              border: const OutlineInputBorder(
                borderRadius: AppUtils.kBorderRadius10,
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                AppIcons.search,
                color: color,
              ),
              filled: true,
              fillColor: innerBoxIsScrolled
                  ? context.colorScheme.surfaceVariant
                  : Colors.white.withOpacity(0.24),
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: Padding(
          padding: AppUtils.kPaddingBottom16,
          child: SizedBox(
            height: 50,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    state.categoryWithProductResponse?.categories?.length ?? 0,
                itemBuilder: (context, index) {
                  final category =
                      state.categoryWithProductResponse?.categories?[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: ()=>context.read<HomeBloc>()..add(SelectIndexEvent(index: index),),
                      child: SizedBox(
                        height:45,
                        width: 120,
                        child: Material(
                            color: context.color.yellow,
                            borderRadius:AppUtils.kBorderRadius8,
                            child: Text(
                              category?.title?.uz.toString() ?? '',
                              style: context.textStyle.regularSubheadline,
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
