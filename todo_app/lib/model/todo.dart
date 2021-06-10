class Todo {
  int _id;

  String _title;
  String _description;
  String _date;
  int _priority;

  /* 
      Can only be 1 constructor, but you can use "names constructor"  ´
      this.parameter is binded to its class property
      [] indicates optional parameter
  */
  Todo(this._title, this._priority, this._date, [this._description]);
  Todo.withId(this._title, this._priority, this._date, [this._description]);

  /* Getters  */
  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  /* Basically transform a Todo into a map. Useful when it works with helpers method for SQLlite */
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = _title;
    map['desciption'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;
    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  /* Take in any object to transfom into a Todo  */
  Todo.fromObject(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._description = obj["description"];
    this._priority = obj["priority"];
    this._date = obj["date"];
  }
}
