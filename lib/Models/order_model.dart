class Order {
  String objective;
  String name;
  String image;
  String contact_name;
  String aim;
  String email;
  var date;
  int phone;
  int price;
  int service;
  String userId;

  Order(objective, name, image, contact_name, aim, email, date, phone, price,
      service, userId) {
    this.objective = objective;
    this.name = name;
    this.image = image;
    this.contact_name = contact_name;
    this.aim = aim;
    this.email = email;
    this.date = date;
    this.phone = phone;
    this.price = price;
    this.service = service;
    this.userId = userId;
  }
}
