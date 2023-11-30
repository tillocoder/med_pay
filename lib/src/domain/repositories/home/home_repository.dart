import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/home/banner_response.dart';
import 'package:sample_bloc_mobile/src/data/models/home/category_response.dart';
import 'package:sample_bloc_mobile/src/data/models/home/products_response.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';

part 'home_repository_impl.dart';

abstract class HomeRepository {
  const HomeRepository();

  Future<Either<Failure, CategoryWithProductResponse>> getCategory();

  Future<Either<Failure, BannerResponse>> getBanner();

  Future<Either<Failure,AllProductResponse>> getAllProducts();
}
