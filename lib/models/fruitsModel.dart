/// Seller : "Abi Fruits"
/// Product : "Apple"
/// Variety : "Kashmir"
/// Price : 132
/// AvgWeight : 150
/// PerBox : 10
/// Boxes : 100
/// Delivery : "10 Days"

class FruitsModel {
  FruitsModel({
      String? seller, 
      String? product, 
      String? variety, 
      int? price, 
      int? avgWeight, 
      int? perBox, 
      int? boxes, 
      String? delivery,}){
    _seller = seller;
    _product = product;
    _variety = variety;
    _price = price;
    _avgWeight = avgWeight;
    _perBox = perBox;
    _boxes = boxes;
    _delivery = delivery;
}

  FruitsModel.fromJson(dynamic json) {
    _seller = json['Seller'];
    _product = json['Product'];
    _variety = json['Variety'];
    _price = json['Price'];
    _avgWeight = json['AvgWeight'];
    _perBox = json['PerBox'];
    _boxes = json['Boxes'];
    _delivery = json['Delivery'];
  }
  String? _seller;
  String? _product;
  String? _variety;
  int? _price;
  int? _avgWeight;
  int? _perBox;
  int? _boxes;
  String? _delivery;
FruitsModel copyWith({  String? seller,
  String? product,
  String? variety,
  int? price,
  int? avgWeight,
  int? perBox,
  int? boxes,
  String? delivery,
}) => FruitsModel(  seller: seller ?? _seller,
  product: product ?? _product,
  variety: variety ?? _variety,
  price: price ?? _price,
  avgWeight: avgWeight ?? _avgWeight,
  perBox: perBox ?? _perBox,
  boxes: boxes ?? _boxes,
  delivery: delivery ?? _delivery,
);
  String? get seller => _seller;
  String? get product => _product;
  String? get variety => _variety;
  int? get price => _price;
  int? get avgWeight => _avgWeight;
  int? get perBox => _perBox;
  int? get boxes => _boxes;
  String? get delivery => _delivery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Seller'] = _seller;
    map['Product'] = _product;
    map['Variety'] = _variety;
    map['Price'] = _price;
    map['AvgWeight'] = _avgWeight;
    map['PerBox'] = _perBox;
    map['Boxes'] = _boxes;
    map['Delivery'] = _delivery;
    return map;
  }

}