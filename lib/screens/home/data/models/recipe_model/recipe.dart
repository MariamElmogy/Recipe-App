import 'package:isar/isar.dart';

part 'recipe.g.dart';

@Collection()
class Recipe {
  Id? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;
  late bool isFavorite;

  Recipe({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json['id'] as int?,
        name: json['name'] as String?,
        ingredients: (json['ingredients'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        instructions: (json['instructions'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        prepTimeMinutes: json['prepTimeMinutes'] as int?,
        cookTimeMinutes: json['cookTimeMinutes'] as int?,
        servings: json['servings'] as int?,
        difficulty: json['difficulty'] as String?,
        cuisine: json['cuisine'] as String?,
        caloriesPerServing: json['caloriesPerServing'] as int?,
        tags:
            (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
        userId: json['userId'] as int?,
        image: json['image'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
        reviewCount: json['reviewCount'] as int?,
        mealType: (json['mealType'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients,
        'instructions': instructions,
        'prepTimeMinutes': prepTimeMinutes,
        'cookTimeMinutes': cookTimeMinutes,
        'servings': servings,
        'difficulty': difficulty,
        'cuisine': cuisine,
        'caloriesPerServing': caloriesPerServing,
        'tags': tags,
        'userId': userId,
        'image': image,
        'rating': rating,
        'reviewCount': reviewCount,
        'mealType': mealType,
      };
}
