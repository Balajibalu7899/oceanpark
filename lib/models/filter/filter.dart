enum FilterType { SEARCH, CATEGORY, CUT, PRICE }

class Filter {
  FilterType? type;
  dynamic data;

  Filter({this.type, this.data});
}
