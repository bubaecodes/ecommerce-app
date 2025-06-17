class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values
  });

  /// Json format
  toJson() {
    return {'name': name, 'values': values};
  }

  @override
  String toString(){
    return 'ProductAttributeModel(name: $name, values: $values)';
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : data['Id'],
      values: List<String>.from(data['Values']),
    );
  }
}



