import 'package:valu_store_app/domain/entities/parent_model.dart';
import 'package:valu_store_app/utils/from_map.dart';

class Rating extends ParentModel {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  @override
  ParentModel fromJsonInstance(Map<String, dynamic> json) {
    final FromMap converter = FromMap(map: json);

    return Rating(
      rate: converter.convertToDouble(key: "rate"),
      count: converter.convertToInt(key: "count"),
    );
  }
}
