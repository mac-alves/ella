class ItemSelect {

  final String id;
  final String name;

  ItemSelect({
    this.id, 
    this.name
  });

  ItemSelect fromJson(Map<String, dynamic> json) {
    return new ItemSelect(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    
    return data;
  }
}