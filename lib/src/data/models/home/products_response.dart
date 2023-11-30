class AllProductResponse {

  AllProductResponse({this.products, this.count});

  AllProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    count = json['count'];
  }
  List<Products>? products;
  String? count;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Products {

  Products(
      {this.active,
        this.isDivisible,
        this.hasModifier,
        this.order,
        this.inPrice,
        this.outPrice,
        this.currency,
        this.count,
        this.id,
        this.slug,
        this.image,
        this.code,
        this.iikoId,
        this.jowiId,
        this.description,
        this.title,
        this.brand,
        this.rate,
        this.activeInMenu,
        this.fromTime,
        this.toTime,
        this.offAlways,
        this.categories,
        this.properties,
        this.variantProducts,
        this.type,
        this.addToOrder,
        this.defaultQuantity});

  Products.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    isDivisible = json['is_divisible'];
    hasModifier = json['has_modifier'];
    order = json['order'];
    inPrice = json['in_price'];
    outPrice = json['out_price'];
    currency = json['currency'];
    count = json['count'];
    id = json['id'];
    slug = json['slug'];
    image = json['image'];
    code = json['code'];
    iikoId = json['iiko_id'];
    jowiId = json['jowi_id'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    rate = json['rate'] != null ? Rate.fromJson(json['rate']) : null;
    activeInMenu = json['active_in_menu'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    offAlways = json['off_always'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    if (json['variant_products'] != null) {
      variantProducts = <VariantProducts>[];
      json['variant_products'].forEach((v) {
        variantProducts!.add(VariantProducts.fromJson(v));
      });
    }
    type = json['type'];
    addToOrder = json['add_to_order'];
    defaultQuantity = json['default_quantity'];
  }
  bool? active;
  bool? isDivisible;
  bool? hasModifier;
  String? order;
  int? inPrice;
  int? outPrice;
  String? currency;
  String? count;
  String? id;
  String? slug;
  String? image;
  String? code;
  String? iikoId;
  String? jowiId;
  Description? description;
  Description? title;
  Brand? brand;
  Rate? rate;
  bool? activeInMenu;
  String? fromTime;
  String? toTime;
  bool? offAlways;
  List<Categories>? categories;
  List<Properties>? properties;
  List<VariantProducts>? variantProducts;
  String? type;
  bool? addToOrder;
  int? defaultQuantity;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active'] = active;
    data['is_divisible'] = isDivisible;
    data['has_modifier'] = hasModifier;
    data['order'] = order;
    data['in_price'] = inPrice;
    data['out_price'] = outPrice;
    data['currency'] = currency;
    data['count'] = count;
    data['id'] = id;
    data['slug'] = slug;
    data['image'] = image;
    data['code'] = code;
    data['iiko_id'] = iikoId;
    data['jowi_id'] = jowiId;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (rate != null) {
      data['rate'] = rate!.toJson();
    }
    data['active_in_menu'] = activeInMenu;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['off_always'] = offAlways;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }

    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    if (variantProducts != null) {
      data['variant_products'] =
          variantProducts!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['add_to_order'] = addToOrder;
    data['default_quantity'] = defaultQuantity;
    return data;
  }
}

class Description {

  Description({this.uz, this.ru, this.en});

  Description.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
    en = json['en'];
  }
  String? uz;
  String? ru;
  String? en;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uz'] = uz;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}

class Brand {

  Brand(
      {this.id,
        this.slug,
        this.parentId,
        this.image,
        this.description,
        this.title,
        this.orderNo,
        this.isActive});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    parentId = json['parent_id'];
    image = json['image'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    orderNo = json['order_no'];
    isActive = json['is_active'];
  }
  String? id;
  String? slug;
  String? parentId;
  String? image;
  Description? description;
  Description? title;
  String? orderNo;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['image'] = image;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['order_no'] = orderNo;
    data['is_active'] = isActive;
    return data;
  }
}

class Rate {

  Rate({this.id, this.slug, this.code, this.rateAmount, this.title});

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    code = json['code'];
    rateAmount = json['rate_amount'];
    title = json['title'];
  }
  String? id;
  String? slug;
  String? code;
  String? rateAmount;
  String? title;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['code'] = code;
    data['rate_amount'] = rateAmount;
    data['title'] = title;
    return data;
  }
}

class Categories {

  Categories(
      {this.id,
        this.slug,
        this.parentId,
        this.image,
        this.description,
        this.title,
        this.orderNo,
        this.active,
});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    parentId = json['parent_id'];
    image = json['image'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    orderNo = json['order_no'];
    active = json['active'];
  }
  String? id;
  String? slug;
  String? parentId;
  String? image;
  Description? description;
  Description? title;
  String? orderNo;
  bool? active;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['image'] = image;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['order_no'] = orderNo;
    data['active'] = active;
    return data;
  }
}

class Properties {

  Properties(
      {this.id,
        this.slug,
        this.title,
        this.description,
        this.createdAt,
        this.shipperId,
        this.active,
        this.orderNo,
        });

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    createdAt = json['created_at'];
    shipperId = json['shipper_id'];
    active = json['active'];
    orderNo = json['order_no'];
  }
  String? id;
  String? slug;
  Description? title;
  Description? description;
  String? createdAt;
  String? shipperId;
  bool? active;
  String? orderNo;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['created_at'] = createdAt;
    data['shipper_id'] = shipperId;
    data['active'] = active;
    data['order_no'] = orderNo;
    return data;
  }
}

class VariantProducts {

  VariantProducts(
      {this.id,
        this.isDivisible,
        this.inPrice,
        this.outPrice,
        this.currency,
        this.string,
        this.order,
        this.count,
        this.type,
        this.brandId,
        this.measurement,
        this.rateId,
        this.image,
        this.categories,
        this.productProperty,
        this.title,
        this.description,
        this.active,
        this.iikoId,
        this.jowiId,
        this.parentId,
        this.relationType,
        this.propertyIds,
        this.hasModifier,
        });

  VariantProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDivisible = json['is_divisible'];
    inPrice = json['in_price'];
    outPrice = json['out_price'];
    currency = json['currency'];
    string = json['string'];
    order = json['order'];
    count = json['count'];
    type = json['type'];
    brandId = json['brand_id'];
    measurement = json['measurement'];
    rateId = json['rate_id'];
    image = json['image'];
    categories = json['categories'].cast<String>();
    if (json['product_property'] != null) {
      productProperty = <ProductProperty>[];
      json['product_property'].forEach((v) {
        productProperty!.add(ProductProperty.fromJson(v));
      });
    }
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    active = json['active'];
    iikoId = json['iiko_id'];
    jowiId = json['jowi_id'];
    parentId = json['parent_id'];
    relationType = json['relation_type'];
    propertyIds = json['property_ids'].cast<String>();
    hasModifier = json['has_modifier'];
  }
  String? id;
  bool? isDivisible;
  int? inPrice;
  int? outPrice;
  String? currency;
  String? string;
  String? order;
  String? count;
  String? type;
  String? brandId;
  String? measurement;
  String? rateId;
  String? image;
  List<String>? categories;
  List<ProductProperty>? productProperty;
  Description? title;
  Description? description;
  bool? active;
  String? iikoId;
  String? jowiId;
  String? parentId;
  String? relationType;
  List<String>? propertyIds;
  bool? hasModifier;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_divisible'] = isDivisible;
    data['in_price'] = inPrice;
    data['out_price'] = outPrice;
    data['currency'] = currency;
    data['string'] = string;
    data['order'] = order;
    data['count'] = count;
    data['type'] = type;
    data['brand_id'] = brandId;
    data['measurement'] = measurement;
    data['rate_id'] = rateId;
    data['image'] = image;
    data['categories'] = categories;
    if (productProperty != null) {
      data['product_property'] =
          productProperty!.map((v) => v.toJson()).toList();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['active'] = active;
    data['iiko_id'] = iikoId;
    data['jowi_id'] = jowiId;
    data['parent_id'] = parentId;
    data['relation_type'] = relationType;
    data['property_ids'] = propertyIds;
    data['has_modifier'] = hasModifier;
    return data;
  }
}

class ProductProperty {

  ProductProperty({this.propertyId, this.optionId, this.title});

  ProductProperty.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    optionId = json['option_id'];
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
  }
  String? propertyId;
  String? optionId;
  Description? title;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_id'] = propertyId;
    data['option_id'] = optionId;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    return data;
  }
}
