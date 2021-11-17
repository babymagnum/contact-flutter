class ContactList {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? notes;
  String? created;
  List<Labels>? labels;

  ContactList({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.notes, 
      this.created, 
      this.labels});

  ContactList.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    notes = json["notes"];
    created = json["created"];
    if (json["labels"] != null) {
      labels = [];
      json["labels"].forEach((v) {
        labels?.add(Labels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["phone"] = phone;
    map["notes"] = notes;
    map["created"] = created;
    if (labels != null) {
      map["labels"] = labels?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Labels {
  String? slug;
  String? title;

  Labels({
      this.slug, 
      this.title});

  Labels.fromJson(dynamic json) {
    slug = json["slug"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["slug"] = slug;
    map["title"] = title;
    return map;
  }

}