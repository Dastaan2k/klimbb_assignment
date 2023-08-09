// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeviceProfileCollection on Isar {
  IsarCollection<DeviceProfile> get deviceProfiles => this.collection();
}

const DeviceProfileSchema = CollectionSchema(
  name: r'DeviceProfile',
  id: 64491828519804842,
  properties: {
    r'fontSizeMultiplier': PropertySchema(
      id: 0,
      name: r'fontSizeMultiplier',
      type: IsarType.double,
    ),
    r'latitude': PropertySchema(
      id: 1,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 2,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'theme': PropertySchema(
      id: 4,
      name: r'theme',
      type: IsarType.byte,
      enumMap: _DeviceProfilethemeEnumValueMap,
    )
  },
  estimateSize: _deviceProfileEstimateSize,
  serialize: _deviceProfileSerialize,
  deserialize: _deviceProfileDeserialize,
  deserializeProp: _deviceProfileDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _deviceProfileGetId,
  getLinks: _deviceProfileGetLinks,
  attach: _deviceProfileAttach,
  version: '3.1.0+1',
);

int _deviceProfileEstimateSize(
  DeviceProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _deviceProfileSerialize(
  DeviceProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.fontSizeMultiplier);
  writer.writeDouble(offsets[1], object.latitude);
  writer.writeDouble(offsets[2], object.longitude);
  writer.writeString(offsets[3], object.name);
  writer.writeByte(offsets[4], object.theme.index);
}

DeviceProfile _deviceProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeviceProfile(
    fontSizeMultiplier: reader.readDouble(offsets[0]),
    latitude: reader.readDouble(offsets[1]),
    longitude: reader.readDouble(offsets[2]),
    name: reader.readString(offsets[3]),
    theme: _DeviceProfilethemeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        FlexScheme.material,
  );
  object.id = id;
  return object;
}

P _deviceProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_DeviceProfilethemeValueEnumMap[reader.readByteOrNull(offset)] ??
          FlexScheme.material) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DeviceProfilethemeEnumValueMap = {
  'material': 0,
  'materialHc': 1,
  'blue': 2,
  'indigo': 3,
  'hippieBlue': 4,
  'aquaBlue': 5,
  'brandBlue': 6,
  'deepBlue': 7,
  'sakura': 8,
  'mandyRed': 9,
  'red': 10,
  'redWine': 11,
  'purpleBrown': 12,
  'green': 13,
  'money': 14,
  'jungle': 15,
  'greyLaw': 16,
  'wasabi': 17,
  'gold': 18,
  'mango': 19,
  'amber': 20,
  'vesuviusBurn': 21,
  'deepPurple': 22,
  'ebonyClay': 23,
  'barossa': 24,
  'shark': 25,
  'bigStone': 26,
  'damask': 27,
  'bahamaBlue': 28,
  'mallardGreen': 29,
  'espresso': 30,
  'outerSpace': 31,
  'blueWhale': 32,
  'sanJuanBlue': 33,
  'rosewood': 34,
  'blumineBlue': 35,
  'flutterDash': 36,
  'materialBaseline': 37,
  'verdunHemlock': 38,
  'dellGenoa': 39,
  'redM3': 40,
  'pinkM3': 41,
  'purpleM3': 42,
  'indigoM3': 43,
  'blueM3': 44,
  'cyanM3': 45,
  'tealM3': 46,
  'greenM3': 47,
  'limeM3': 48,
  'yellowM3': 49,
  'orangeM3': 50,
  'deepOrangeM3': 51,
  'custom': 52,
};
const _DeviceProfilethemeValueEnumMap = {
  0: FlexScheme.material,
  1: FlexScheme.materialHc,
  2: FlexScheme.blue,
  3: FlexScheme.indigo,
  4: FlexScheme.hippieBlue,
  5: FlexScheme.aquaBlue,
  6: FlexScheme.brandBlue,
  7: FlexScheme.deepBlue,
  8: FlexScheme.sakura,
  9: FlexScheme.mandyRed,
  10: FlexScheme.red,
  11: FlexScheme.redWine,
  12: FlexScheme.purpleBrown,
  13: FlexScheme.green,
  14: FlexScheme.money,
  15: FlexScheme.jungle,
  16: FlexScheme.greyLaw,
  17: FlexScheme.wasabi,
  18: FlexScheme.gold,
  19: FlexScheme.mango,
  20: FlexScheme.amber,
  21: FlexScheme.vesuviusBurn,
  22: FlexScheme.deepPurple,
  23: FlexScheme.ebonyClay,
  24: FlexScheme.barossa,
  25: FlexScheme.shark,
  26: FlexScheme.bigStone,
  27: FlexScheme.damask,
  28: FlexScheme.bahamaBlue,
  29: FlexScheme.mallardGreen,
  30: FlexScheme.espresso,
  31: FlexScheme.outerSpace,
  32: FlexScheme.blueWhale,
  33: FlexScheme.sanJuanBlue,
  34: FlexScheme.rosewood,
  35: FlexScheme.blumineBlue,
  36: FlexScheme.flutterDash,
  37: FlexScheme.materialBaseline,
  38: FlexScheme.verdunHemlock,
  39: FlexScheme.dellGenoa,
  40: FlexScheme.redM3,
  41: FlexScheme.pinkM3,
  42: FlexScheme.purpleM3,
  43: FlexScheme.indigoM3,
  44: FlexScheme.blueM3,
  45: FlexScheme.cyanM3,
  46: FlexScheme.tealM3,
  47: FlexScheme.greenM3,
  48: FlexScheme.limeM3,
  49: FlexScheme.yellowM3,
  50: FlexScheme.orangeM3,
  51: FlexScheme.deepOrangeM3,
  52: FlexScheme.custom,
};

Id _deviceProfileGetId(DeviceProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _deviceProfileGetLinks(DeviceProfile object) {
  return [];
}

void _deviceProfileAttach(
    IsarCollection<dynamic> col, Id id, DeviceProfile object) {
  object.id = id;
}

extension DeviceProfileQueryWhereSort
    on QueryBuilder<DeviceProfile, DeviceProfile, QWhere> {
  QueryBuilder<DeviceProfile, DeviceProfile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeviceProfileQueryWhere
    on QueryBuilder<DeviceProfile, DeviceProfile, QWhereClause> {
  QueryBuilder<DeviceProfile, DeviceProfile, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceProfileQueryFilter
    on QueryBuilder<DeviceProfile, DeviceProfile, QFilterCondition> {
  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      fontSizeMultiplierEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontSizeMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      fontSizeMultiplierGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontSizeMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      fontSizeMultiplierLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontSizeMultiplier',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      fontSizeMultiplierBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontSizeMultiplier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      themeEqualTo(FlexScheme value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      themeGreaterThan(
    FlexScheme value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      themeLessThan(
    FlexScheme value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theme',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterFilterCondition>
      themeBetween(
    FlexScheme lower,
    FlexScheme upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceProfileQueryObject
    on QueryBuilder<DeviceProfile, DeviceProfile, QFilterCondition> {}

extension DeviceProfileQueryLinks
    on QueryBuilder<DeviceProfile, DeviceProfile, QFilterCondition> {}

extension DeviceProfileQuerySortBy
    on QueryBuilder<DeviceProfile, DeviceProfile, QSortBy> {
  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      sortByFontSizeMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeMultiplier', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      sortByFontSizeMultiplierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeMultiplier', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> sortByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> sortByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }
}

extension DeviceProfileQuerySortThenBy
    on QueryBuilder<DeviceProfile, DeviceProfile, QSortThenBy> {
  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      thenByFontSizeMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeMultiplier', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      thenByFontSizeMultiplierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeMultiplier', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy>
      thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.asc);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QAfterSortBy> thenByThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theme', Sort.desc);
    });
  }
}

extension DeviceProfileQueryWhereDistinct
    on QueryBuilder<DeviceProfile, DeviceProfile, QDistinct> {
  QueryBuilder<DeviceProfile, DeviceProfile, QDistinct>
      distinctByFontSizeMultiplier() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontSizeMultiplier');
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceProfile, DeviceProfile, QDistinct> distinctByTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theme');
    });
  }
}

extension DeviceProfileQueryProperty
    on QueryBuilder<DeviceProfile, DeviceProfile, QQueryProperty> {
  QueryBuilder<DeviceProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DeviceProfile, double, QQueryOperations>
      fontSizeMultiplierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontSizeMultiplier');
    });
  }

  QueryBuilder<DeviceProfile, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<DeviceProfile, double, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<DeviceProfile, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<DeviceProfile, FlexScheme, QQueryOperations> themeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theme');
    });
  }
}
