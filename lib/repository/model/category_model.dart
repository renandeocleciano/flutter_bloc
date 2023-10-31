class CategoryModel {
  final int? id;
  final String? name;
  final String? url;
  final String? image;

  const CategoryModel({this.id, this.name, this.url, this.image});

  static const empty = CategoryModel(id: 1, name: '', url: '', image: '');
}
