class HouseRulesEntity {
  final List<EntitiesEntity> entities;
  final PaginationEntity pagination;
  HouseRulesEntity({
    required this.entities,
    required this.pagination,
  });

  HouseRulesEntity copyWith({
    List<EntitiesEntity>? entities,
    PaginationEntity? pagination,
  }) =>
      HouseRulesEntity(
        entities: entities ?? this.entities,
        pagination: pagination ?? this.pagination,
      );
}

class EntitiesEntity {
  final int id;
  final String name;
  final int active;
  final int order;
  EntitiesEntity({
    required this.id,
    required this.name,
    required this.active,
    required this.order,
  });

  EntitiesEntity copyWith({
    int? id,
    String? name,
    int? active,
    int? order,
  }) =>
      EntitiesEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
        order: order ?? this.order,
      );
}

class PaginationEntity {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;
  final LinksEntity links;
  PaginationEntity({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  PaginationEntity copyWith({
    int? total,
    int? count,
    int? perPage,
    int? currentPage,
    int? totalPages,
    LinksEntity? links,
  }) =>
      PaginationEntity(
        total: total ?? this.total,
        count: count ?? this.count,
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        links: links ?? this.links,
      );
}

class LinksEntity {
  final String next;
  final String prev;
  LinksEntity({
    required this.next,
    required this.prev,
  });

  LinksEntity copyWith({
    String? next,
    String? prev,
  }) =>
      LinksEntity(
        next: next ?? this.next,
        prev: prev ?? this.prev,
      );
}
