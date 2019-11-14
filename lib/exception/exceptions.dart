







class PropertyIsRequired implements Exception{
  String field;
  PropertyIsRequired(this.field);
  @override
  String toString() {
  return 'Property ${this.field} is required';
  }
}