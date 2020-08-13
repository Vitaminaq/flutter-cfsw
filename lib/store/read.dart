import '../api/read.dart';
import '../model/read.dart' as ReadModel;
import '../common/loader-list.dart';

class ReadStore extends LoaderList<ReadModel.LibraryBookResponse,
    ReadModel.Datum, ReadModel.LibraryBookParams> {
  ReadModel.LibraryBookParams params = ReadModel.LibraryBookParams();
  @override
  baseAjaxMethod() async {
    ReadModel.LibraryBookResponse r = await api.getLibraryBook(params.toJson());
    return r;
  }
}
