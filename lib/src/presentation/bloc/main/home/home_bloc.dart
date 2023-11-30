import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/data/models/home/banner_response.dart';
import 'package:sample_bloc_mobile/src/data/models/home/category_response.dart';
import 'package:sample_bloc_mobile/src/data/models/home/products_response.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/home/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(const HomeState(selectIndex: [])) {
    on<HomeScroll>(_onHomeScroll);
    on<CategoryEvent>(_getCategory);
    on<BannerEvent>(_getBanner);
    on<SelectIndexEvent>(_selectCategory);
    on<AllProductsEvent>(_getAllProduct);
  }

  final HomeRepository homeRepository;
  List<int> selectIndex = [];

  void _onHomeScroll(HomeScroll event, Emitter<HomeState> emit) {
    emit(state.copyWith(isScrollingTop: event.isScrollingTop));
  }

  void _selectCategory(SelectIndexEvent event, Emitter<HomeState> emit) {
    final int a = selectIndex.indexOf(event.index);
    if (a == -1) {
      selectIndex.add(event.index);
    } else {
      selectIndex.removeAt(a);
    }
    emit(state.copyWith(
      selectIndex: selectIndex,
      status: Status.loading,
    ));

    emit(state.copyWith(
      selectIndex: selectIndex,
      status: Status.success,
    ));
  }

  Future<void> _getCategory(
    CategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(status: Status.loading),
    );
    final result = await homeRepository.getCategory();
    result.fold((left) {
      emit(state.copyWith(hasError: true, errorMessage: 'error'));
    }, (right) {
      emit(state.copyWith(
          categoryWithProductResponse: right,status: Status.success, selectIndex: selectIndex));
    });

    // final res = await homeRepository.getCategory();
    // res.fold((left) {
    //   emit(state.copyWith(hasError: true, errorMessage: 'error '));
    // }, (right) {
    //   //emit(state.copyWith(productModifier: right.productModifiers));
    //   if (right.categories != null) {
    //     emit(
    //       state.copyWith(status: Status.success),
    //     );
    //   }
    // });
  }

  Future<void> _getBanner(BannerEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(status: Status.loading),
    );
    final result = await homeRepository.getBanner();
    result.fold((left) {
      emit(state.copyWith(hasError: true, errorMessage: 'error'));
    }, (right) {
      emit(
        state.copyWith(bannerResponse: right,status: Status.success),
      );
    });

    // final res = await homeRepository.getCategory();
    // res.fold(
    //   (left) {
    //     emit(state.copyWith(hasError: true, errorMessage: 'error '));
    //   },
    //   (right) {
    //     if (right.categories != null) {
    //       emit(
    //         state.copyWith(status: Status.success),
    //       );
    //     }
    //   },
    // );
  }

  Future<void> _getAllProduct(
      AllProductsEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(status: Status.loading),
    );
    final result = await homeRepository.getAllProducts();
    result.fold(
      (left) => emit(
        state.copyWith(hasError: true, errorMessage: 'error '),
      ),
      (right) {
        if (right.products != null) {
          emit(
            state.copyWith(allProducts:right,status: Status.success),
          );
        }
      },
    );
  }
}
