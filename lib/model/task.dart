class Task {
  String? name;
  String? description;
  bool isDone;

  Task({
    this.isDone = false,
    this.name,
    this.description,
  });
  void isDOneToggle() {
    isDone = !isDone;
  }
}
