class MySourceModel {
  final String? id;
  final String? name;
  // ignore: sort_constructors_first
  const MySourceModel({
    this.id,
    this.name,
  });


  // ignore: sort_constructors_first
  factory MySourceModel.fromJson(Map<String, dynamic> json) {
    return MySourceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

}
