import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@JsonSerializable()
class BreedModel {
  final String? id;
  final String? name;
  final String? temperament;
  final String? origin;
  final String? description;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  @JsonKey(name: 'affection_level')
  final int? affectionLevel;
  @JsonKey(name: 'child_friendly')
  final int? childFriendly;
  @JsonKey(name: 'dog_friendly')
  final int? dogFriendly;
  @JsonKey(name: 'energy_level')
  final int? energyLevel;
  final int? intelligence;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;
  final Weight? weight;

  const BreedModel({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.intelligence,
    required this.wikipediaUrl,
    required this.referenceImageId,
    required this.weight,
  
  });

   factory BreedModel.fromJson(Map<String, dynamic> json) => _$BreedModelFromJson(json);
   Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}

@JsonSerializable()
class Weight {
  final String imperial;
  final String metric;

  Weight({required this.imperial, required this.metric});
  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
  Map<String, dynamic> toJson() => _$WeightToJson(this);
}

@JsonSerializable()
class CatModel {
  final String id;
  final String url;
  final int width;
  final int height;
  final List<BreedModel>? breeds;
  const CatModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.breeds,
  });
  factory CatModel.fromJson(Map<String, dynamic> json) => _$CatModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatModelToJson(this);
}
