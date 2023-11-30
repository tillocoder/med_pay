part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeScroll extends HomeEvent {
  const HomeScroll({
    required this.isScrollingTop,
  });

  final bool isScrollingTop;

  @override
  List<Object?> get props => [isScrollingTop];
}


class CategoryEvent extends HomeEvent{
  const CategoryEvent();
  @override
  List<Object?> get props => [];
}


class BannerEvent extends HomeEvent{
  const BannerEvent();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SelectIndexEvent extends HomeEvent{
   SelectIndexEvent({required this.index});
    int index;
  @override
  List<Object?> get props => [];
}


class AllProductsEvent extends HomeEvent{
  const AllProductsEvent({required this.id});
  final String id;
}