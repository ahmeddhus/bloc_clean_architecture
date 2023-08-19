import 'package:valu_store_app/domain/entities/parent_model.dart';

class FromMap {
  final Map<String, dynamic> map;

  FromMap({this.map = const <String, dynamic>{}});

  String? convertToString({
    required String key,
    String? defaultValue,
    Map<String, dynamic>? innerMap,
  }) {
    final Map<String, dynamic> tempMap = innerMap ?? map;

    final String? result = tempMap[key]?.toString() ?? defaultValue;
    return result;
  }

  int? convertToInt({
    required String key,
    int? defaultValue,
    Map<String, dynamic>? innerMap,
  }) {
    final Map<String, dynamic> tempMap = innerMap ?? map;
    if (tempMap[key] is int?) {
      return (tempMap[key] as int?) ?? defaultValue;
    } else {
      final String? value = tempMap[key]?.toString();
      final int? result = int.tryParse(value ?? "") ?? defaultValue;
      return result;
    }
  }

  double? convertToDouble({
    required String key,
    double? defaultValue,
    Map<String, dynamic>? innerMap,
  }) {
    final Map<String, dynamic> tempMap = innerMap ?? map;
    if (tempMap[key] is double?) {
      return (tempMap[key] as double?) ?? defaultValue;
    } else {
      String? value = tempMap[key]?.toString();
      if ((value?.contains('.') ?? false) && (value?.contains(',') ?? false)) {
        value = value?.split(',').join();
      }
      final double? result = double.tryParse(value ?? "") ?? defaultValue;
      return result;
    }
  }

  T? convertToObjects<T extends ParentModel>({dynamic jsonData, dynamic modelInstance}) {
    final T t = modelInstance as T;
    return jsonData is Map<String, dynamic> ? t.fromJsonInstance(jsonData) : null;
  }
}
