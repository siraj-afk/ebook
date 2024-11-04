part of 'ebook_bloc.dart';

@immutable
sealed class EbookState {}

final class EbookInitial extends EbookState {}
class EbookblocLoading extends EbookState {}
class EbookblocLoaded extends EbookState {}
class EbookblocError extends EbookState {}