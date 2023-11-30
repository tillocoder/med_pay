import 'package:flutter/material.dart';

part  'app_keys.dart';

sealed class Constants {
  Constants._();

  /// test
  static const baseUrl = 'https://test.customer.api.delever.uz/';
  static const categoryWithProductUrl='v2/category-with-products';
  static const bannerUrl='v1/banner';
  static const shipperId='d4b1658f-3271-4973-8591-98a82939a664';


  /// id
  static const String projectId = 'a4dc1f1c-d20f-4c1a-abf5-b819076604bc';
  static const String apiKey = 'P-JV2nVIRUtgyPO5xRNeYll2mT4F5QG4bS';
  static const String platformIdAndroid = '6bd7c2e3-d35e-47df-93ce-ed54ed53f95f';
  static const String platformIdIos = 'f6631db7-09d0-4cd9-a03a-b7a590abb8c1';

  static const String clientTypeId = '24fd6d7e-c0e7-4029-88cc-2595e9c643d5';
  static const String companyId = '696c77b5-0ebd-4277-a278-a7343421a32a';
  static const String expiresAt = '2025-06-23T06:00:10.049Z';
  static const String roledId = '425486de-89dc-48a7-9fa8-47f7b4eeffcb';

  static GlobalKey<FormState> bottomNavigatorKey = GlobalKey<FormState>();
}

sealed class Urls {
  Urls._();

  static const String customerResgisterUrl = 'v1/customers/register';
  static const String customerPhone = 'v1/customers/phone';
  static const String loginCustomer='v1/customers/login';
  static const String confirmLogin = 'v1/customers/confirm-login';
  static const String confirmRegister = 'v1/customers/register-confirm';
  static const String allProductUrl = 'v2/product';
  static const String allBranchsUrl = 'v1/branches';
}

// The splash page animation duration.
const Duration splashPageAnimationDuration = Duration(milliseconds: 1500);

// The animation display duration.
const Duration animationDuration = Duration(milliseconds: 300);
