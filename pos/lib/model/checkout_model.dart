import 'package:equatable/equatable.dart';
import 'package:tarka/model/models.dart';

class Checkout extends Equatable {
  final String? total;
  final List<Product>? products;

  Checkout({this.total, this.products});
  @override
  List<Object?> get props => [
        total,
        products,
      ];

  Map<String, Object> toDocument() {
    Map customerbills = Map();
    customerbills["totol"] = total;
    customerbills["Products"] = products;

    return {
      "total": total!,
      "products": products!.map((product) => product.name).toList(),
    };
  }
}
