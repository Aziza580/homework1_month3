class AddState {
  final bool isSaved;
  final String? errorText;

  const AddState({required this.isSaved, this.errorText});

//Начальное состояние
  factory AddState.initial() => const AddState(isSaved: false, errorText: null);

  AddState copyWith({
    bool? isSaved,
    String? errorText,
  }) {
    return AddState(isSaved: isSaved ?? this.isSaved, errorText: errorText);
  }
}