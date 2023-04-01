




class  Model {
  String? id;
  int? created;
  String? root;

  Model({
    this.id,
    this.created,
    this.root,
  });


factory Model.fromJson(Map<String, dynamic> json) => Model(
    id: json["id"],
    created: json["created"],
    root: json["root"],
  );


static  List<Model> modelFormSnapShot (List<dynamic> snapshots)    {

  return snapshots.map((snapshot) {
    return Model.fromJson(snapshot);
  }).toList();

} 
  toJson() => {
    "id": id,
    "created": created,
    "root": root,
  };
}