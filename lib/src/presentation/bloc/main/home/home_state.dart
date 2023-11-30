part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isScrollingTop = false,
    this.categoryWithProductResponse,
    this.errorMessage,
    this.hasError,
    this.bannerResponse,
    required this.selectIndex,
    this.status = Status.initial,
    this.allProducts,
    this.id,
  });

  final bool? hasError;
  final String? errorMessage;
  final bool isScrollingTop;
  final CategoryWithProductResponse? categoryWithProductResponse;
  final BannerResponse? bannerResponse;
  final List<int> selectIndex;
  final Status status;
  final AllProductResponse? allProducts;
  final String? id;

  HomeState copyWith({
    bool? isScrollingTop,
    List<int>? selectIndex,
    BannerResponse? bannerResponse,
    bool? hasError,
    AllProductResponse? allProducts,
    Status? status,
    String? id,
    String? errorMessage,
    CategoryWithProductResponse? categoryWithProductResponse,
  }) =>
      HomeState(
        isScrollingTop: isScrollingTop ?? this.isScrollingTop,
        bannerResponse: bannerResponse ?? this.bannerResponse,
        errorMessage: errorMessage ?? this.errorMessage,
        hasError: hasError ?? this.hasError,
        allProducts: allProducts ?? this.allProducts,
        selectIndex: selectIndex ?? this.selectIndex,
        status: status ?? this.status,
        id: id??this.id,
        categoryWithProductResponse:
            categoryWithProductResponse ?? this.categoryWithProductResponse,
      );

  @override
  List<Object?> get props => [
        isScrollingTop,
        status,
        categoryWithProductResponse,
        selectIndex,
        hasError,
        errorMessage,
        bannerResponse,
        allProducts,
        id,
      ];
}

enum Status { initial, loading, success, error }

extension StatusX on Status {
  bool get initial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
