import 'package:bloc/bloc.dart';
import 'package:ebooks/repositery/api/ebookapi/ebookapinew.dart';
import 'package:meta/meta.dart';

import '../repositery/model/ebookmodel.dart';

part 'ebook_event.dart';
part 'ebook_state.dart';

class EbookBloc extends Bloc<EbookEvent, EbookState> {
  late List<Ebook> ebook;
  EbookApi ebookApi=EbookApi();
  EbookBloc() : super(EbookInitial()) {
    on<EbookEvent>((event, emit) async {
        emit(EbookblocLoading());
        try{

          ebook = await ebookApi.getEbook();
          emit(EbookblocLoaded());
        } catch(e){
          print(e);
          emit(EbookblocError());}
      // TODO: implement event handler
    });
  }
}
