class Order {
  String categoryId;
  String categoryName;
  String categoryImage;
  String subCategoryId;
  String subCategoryName;
  String subCategoryImage;
  var date;
  int pricePerKg;
  int quantity;
  String product;
  String userId;
  String note;
  String status;

  Order(categoryId, categoryName, categoryImage, subCategoryId, subCategoryName, subCategoryImage, date, pricePerKg, quantity, product, userId,
      note, status) {
    this.categoryId = categoryId;
    this.categoryName = categoryName;
    this.categoryImage = categoryImage;
    this.subCategoryId = subCategoryId;
    this.subCategoryName = subCategoryName;
    this.subCategoryImage = subCategoryImage;
    this.date = date;
    this.pricePerKg = pricePerKg;
    this.quantity = quantity;
    this.product = product;
    this.userId = userId;
    this.note = note;
    this.status = status;
  }
}
