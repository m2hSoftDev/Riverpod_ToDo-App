class Todo{
  final String id;
  final String title;
  final bool isComplete;

  Todo({
    required this.id,
    required this.title,
    required this.isComplete
  });


  Todo copyWith({ String? title, bool? isComplete}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}