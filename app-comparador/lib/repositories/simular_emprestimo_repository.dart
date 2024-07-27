import 'package:dio/dio.dart';

import '../models/convenio_models.dart';

class SimularEmprestimoRepository {
  final Dio dio = Dio();
  final url = 'https://swapi.dev/api/people/';
  Future<List<ConvenioModels>> fetchTodos() async {
    final response = await dio.get(url);
    var list = (response.data['results'] as List).map((item) {
      return ConvenioModels.fromJson(item);
    }).toList();
    return list;
  }
}

/*
* usar com future builder
*  Future<List<ConvenioModels>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    List<ConvenioModels> todos = [];
    for (var json in list) {
      final todo = ConvenioModels.fromJson();
      todos.add(todo);
    }
    return todos;
  }
* */
/*
* body: FutureBuilder(
future: minhafuncao.futuro(),
builder: (BuildContext context, AsyncSnapshot snapshot){
switch(snapshot.connectionState){
case ConnectionState.none:
case ConnectionState.waiting:
return Text('carregando');
default:
if(snapshot.hasError)
return Text('snapshot.error');
else
return listView(context, snapshot);
}
}
);

*
* */
