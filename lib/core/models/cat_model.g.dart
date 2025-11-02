// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  temperament: json['temperament'] as String?,
  origin: json['origin'] as String?,
  description: json['description'] as String?,
  lifeSpan: json['life_span'] as String?,
  affectionLevel: (json['affection_level'] as num?)?.toInt(),
  childFriendly: (json['child_friendly'] as num?)?.toInt(),
  dogFriendly: (json['dog_friendly'] as num?)?.toInt(),
  energyLevel: (json['energy_level'] as num?)?.toInt(),
  intelligence: (json['intelligence'] as num?)?.toInt(),
  wikipediaUrl: json['wikipedia_url'] as String?,
  referenceImageId: json['reference_image_id'] as String?,
  weight: json['weight'] == null
      ? null
      : Weight.fromJson(json['weight'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'life_span': instance.lifeSpan,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'intelligence': instance.intelligence,
      'wikipedia_url': instance.wikipediaUrl,
      'reference_image_id': instance.referenceImageId,
      'weight': instance.weight,
    };

Weight _$WeightFromJson(Map<String, dynamic> json) => Weight(
  imperial: json['imperial'] as String,
  metric: json['metric'] as String,
);

Map<String, dynamic> _$WeightToJson(Weight instance) => <String, dynamic>{
  'imperial': instance.imperial,
  'metric': instance.metric,
};

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
  id: json['id'] as String,
  url: json['url'] as String,
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  breeds: (json['breeds'] as List<dynamic>?)
      ?.map((e) => BreedModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'width': instance.width,
  'height': instance.height,
  'breeds': instance.breeds,
};
