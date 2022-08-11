class Order {
  String? id;
  String? user;
  List<OrderItem>? orderItems;
  ShippingAddress? shippingAddress;
  String? paymentMethod;
  PaymentResult? paymentResult;
  double? itemPrice;
  double? taxPrice;
  double? shippingPrice;
  double? totalPrice;
  bool? isPaid;
  String? paidAt;
  bool? isDelivered;
  String? delivereAt;
  String? createAt;
  String? updateAt;

  Order({
    this.id,
    this.user,
    this.orderItems,
    this.shippingAddress,
    this.paymentMethod,
    this.paymentResult,
    this.itemPrice,
    this.taxPrice,
    this.shippingPrice,
    this.totalPrice,
    this.isPaid,
    this.paidAt,
    this.isDelivered,
    this.delivereAt,
    this.createAt,
    this.updateAt,
  });

  factory Order.fromJson(Map<String, dynamic> res) {
    List<OrderItem> items = [];
    for (var item in res['orderItems']) {
      items.add(OrderItem.fromJson(item));
    }

    if (res['payment_result'] != null) {
      return Order(
        id: res['id'],
        user: res['user'],
        orderItems: items,
        shippingAddress: ShippingAddress.fromJson(res['shipping_address']),
        paymentMethod: res['payment_method'],
        itemPrice: res['item_price'],
        taxPrice: res['tax_price'],
        shippingPrice: res['shipping_price'],
        totalPrice: res['total_price'],
        isPaid: res['is_paid'],
        paidAt: res['paid_at'],
        isDelivered: res['is_delivered'],
        delivereAt: res['delivere_at'],
        createAt: res['createAt'],
        updateAt: res['updateAt'],
      );
    }
    return Order(
      id: res['id'],
      user: res['user'],
      orderItems: items,
      shippingAddress: ShippingAddress.fromJson(res['shipping_address']),
      paymentMethod: res['payment_method'],
      paymentResult: PaymentResult.fromJson(res['payment_result']),
      itemPrice: res['item_price'],
      taxPrice: res['tax_price'],
      shippingPrice: res['shipping_price'],
      totalPrice: res['total_price'],
      isPaid: res['is_paid'],
      paidAt: res['paid_at'],
      isDelivered: res['is_delivered'],
      delivereAt: res['delivere_at'],
      createAt: res['createAt'],
      updateAt: res['updateAt'],
    );
  }
}

class OrderItem {
  String? name;
  int? qty;
  String? image;
  double? price;
  String? product;

  OrderItem({this.name, this.qty, this.image, this.price, this.product});

  factory OrderItem.fromJson(Map<String, dynamic> res) {
    return OrderItem(
      name: res['name'],
      qty: res['qty'],
      image: res['image'],
      price: res['price'],
      product: res['product'],
    );
  }
}

class ShippingAddress {
  Address? address;

  ShippingAddress({this.address});

  factory ShippingAddress.fromJson(Map<String, dynamic> res) {
    return ShippingAddress(
      address: Address.fromJson(res['address']),
    );
  }
}

class Address {
  String? province;
  String? district;
  String? ward;
  String? street;

  Address({this.province, this.district, this.ward, this.street});

  factory Address.fromJson(Map<String, dynamic> res) {
    return Address(
      province: res['province'],
      district: res['district'],
      ward: res['ward'],
      street: res['street'],
    );
  }
}

class PaymentResult {
  String? id;
  String? status;
  String? updateTime;
  String? emailAddress;

  PaymentResult({this.id, this.status, this.updateTime, this.emailAddress});

  factory PaymentResult.fromJson(Map<String, dynamic> res) {
    return PaymentResult(
      id: res['id'],
      status: res['status'],
      updateTime: res['update_time'],
      emailAddress: res['email_address'],
    );
  }
}
