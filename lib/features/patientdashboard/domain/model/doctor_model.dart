class Doctormodel {
  final String image;
  final String title;
  final String subtitle;
  final double rating;

  Doctormodel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  factory Doctormodel.fromJson(Map<String, dynamic> json) {
    return Doctormodel(
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      rating: json['rating'].toDouble(),
    );
  }
}
