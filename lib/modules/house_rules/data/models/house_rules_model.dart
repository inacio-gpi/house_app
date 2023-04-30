// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:house_app/lib.dart';

class HouseRulesModel extends HouseRulesEntity {
  final List<EntitiesModel> entities;
  final PaginationModel pagination;
  HouseRulesModel({
    required this.entities,
    required this.pagination,
  }) : super(entities: entities, pagination: pagination);

  Map<String, dynamic> toMap() => {
        'entities': entities.map((x) => x.toMap()).toList(),
        'pagination': pagination.toMap(),
      };

  factory HouseRulesModel.fromMap(Map<String, dynamic> map) => HouseRulesModel(
        entities: List<EntitiesModel>.from(map['entities']?.map((x) => EntitiesModel.fromMap(x))),
        pagination: PaginationModel.fromMap(map['pagination']),
      );

  String toJson() => json.encode(toMap());

  factory HouseRulesModel.fromJson(String source) => HouseRulesModel.fromMap(json.decode(source));
}

class EntitiesModel extends EntitiesEntity {
  final int id;
  final String name;
  final int active;
  final int order;
  EntitiesModel({
    required this.id,
    required this.name,
    required this.active,
    required this.order,
  }) : super(
          id: id,
          name: name,
          active: active,
          order: order,
        );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'active': active,
        'order': order,
      };

  factory EntitiesModel.fromMap(Map<String, dynamic> map) => EntitiesModel(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        active: map['active']?.toInt() ?? 0,
        order: map['order']?.toInt() ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory EntitiesModel.fromJson(String source) => EntitiesModel.fromMap(json.decode(source));
}

class PaginationModel extends PaginationEntity {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final LinksModel links;
  PaginationModel({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  }) : super(
          total: total,
          count: count,
          perPage: perPage,
          currentPage: currentPage,
          totalPages: totalPages,
          links: links,
        );

  Map<String, dynamic> toMap() => {
        'total': total,
        'count': count,
        'per_page': perPage,
        'current_page': currentPage,
        'total_pages': totalPages,
        'links': links.toMap(),
      };

  factory PaginationModel.fromMap(Map<String, dynamic> map) => PaginationModel(
        total: map['total']?.toInt() ?? 0,
        count: map['count']?.toInt() ?? 0,
        perPage: map['per_page']?.toInt() ?? 0,
        currentPage: map['current_page']?.toInt() ?? 0,
        totalPages: map['total_pages']?.toInt() ?? 0,
        links: LinksModel.fromMap(map['links']),
      );

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(String source) => PaginationModel.fromMap(json.decode(source));
}

class LinksModel extends LinksEntity {
  final String next;
  final String prev;
  LinksModel({
    required this.next,
    required this.prev,
  }) : super(next: next, prev: prev);

  Map<String, dynamic> toMap() => {
        'next': next,
        'prev': prev,
      };

  factory LinksModel.fromMap(Map<String, dynamic> map) => LinksModel(
        next: map['next'] ?? '',
        prev: map['prev'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory LinksModel.fromJson(String source) => LinksModel.fromMap(json.decode(source));
}
