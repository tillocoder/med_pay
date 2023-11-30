class CategoryWithProductResponse {

  CategoryWithProductResponse({this.categories, this.count});

  CategoryWithProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    count = json['count'];
  }
  List<Categories>? categories;
  String? count;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
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
        this.products,
        this.childCategories});

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
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(ChildCategories.fromJson(v));
      });
    }
  }
  String? id;
  String? slug;
  String? parentId;
  String? image;
  Description? description;
  Description? title;
  String? orderNo;
  bool? active;
  List<Products>? products;
  List<ChildCategories>? childCategories;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (childCategories != null) {
      data['child_categories'] =
          childCategories!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uz'] = uz;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}

class Products {

  Products(
      {this.id,
        this.outPrice,
        this.currency,
        this.string,
        this.type,
        this.categories,
        this.brandId,
        this.rateId,
        this.image,
        this.activeInMenu,
        this.hasModifier,
        this.fromTime,
        this.toTime,
        this.offAlways,
        this.gallery,
        this.title,
        this.description,
        this.active,
        this.iikoId,
        this.jowiId,
       });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outPrice = json['out_price'];
    currency = json['currency'];
    string = json['string'];
    type = json['type'];
    categories = json['categories'].cast<String>();
    brandId = json['brand_id'];
    rateId = json['rate_id'];
    image = json['image'];
    activeInMenu = json['active_in_menu'];
    hasModifier = json['has_modifier'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    offAlways = json['off_always'];
    title =
    json['title'] != null ? Description.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    active = json['active'];
    iikoId = json['iiko_id'];
    jowiId = json['jowi_id'];

  }
  String? id;
  int? outPrice;
  String? currency;
  String? string;
  String? type;
  List<String>? categories;
  String? brandId;
  String? rateId;
  String? image;
  bool? activeInMenu;
  bool? hasModifier;
  String? fromTime;
  String? toTime;
  bool? offAlways;
  List<String>? gallery;
  Description? title;
  Description? description;
  bool? active;
  String? iikoId;
  String? jowiId;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['out_price'] = outPrice;
    data['currency'] = currency;
    data['string'] = string;
    data['type'] = type;
    data['categories'] = categories;
    data['brand_id'] = brandId;
    data['rate_id'] = rateId;
    data['image'] = image;
    data['active_in_menu'] = activeInMenu;
    data['has_modifier'] = hasModifier;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['off_always'] = offAlways;
    data['gallery'] = gallery;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['active'] = active;
    data['iiko_id'] = iikoId;
    data['jowi_id'] = jowiId;

    return data;
  }
}

class ChildCategories {

  ChildCategories(
      {this.id,
        this.name,
        this.slug,
        this.parentId,
        this.image,
        this.orderNo,
        this.title,
        this.description,
        this.isActive,
        this.createdAt});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'];
    image = json['image'];
    orderNo = json['order_no'];
    title = json['title'] != null ? Description.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
  }
  String? id;
  String? name;
  String? slug;
  String? parentId;
  String? image;
  String? orderNo;
  Description? title;
  Description? description;
  bool? isActive;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['image'] = image;
    data['order_no'] = orderNo;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    return data;
  }
}
