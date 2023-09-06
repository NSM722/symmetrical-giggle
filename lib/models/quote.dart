class Quote {
  final String id;
  final String content;
  final String author;
  final List<String> tags; // Specify the type for List elements
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified; // Corrected the typo in the variable name

  const Quote({
    required this.id, // Use a comma (,) instead of a semicolon (;) to separate fields
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified, // Corrected the variable name
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'],
      content: json['content'],
      author: json['author'],
      tags: List<String>.from(json['tags'].map((tag) => tag)),
      authorSlug: json['authorSlug'],
      length: json['length'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }
}
