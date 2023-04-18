class Item {
  final String id;
  final String title;
  final bool isPurchased;

  Item({
    required this.id,
    required this.title,
    required this.isPurchased,
  });

  factory Item.fromJson(String id, Map<String, dynamic> json) => Item(
        id: id,
        title: json['title'] as String,
        isPurchased: json['isPurchased'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isPurchased': isPurchased,
      };

  Item copyWith({String? title, bool? isPurchased}) => Item(
        id: id,
        title: title ?? this.title,
        isPurchased: isPurchased ?? this.isPurchased,
      );
}
