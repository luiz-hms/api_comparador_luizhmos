
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../models/convenio_models.dart';
import '../repositories/simular_emprestimo_repository.dart';
import '../widgets/list_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SimularEmprestimoRepository _simularRepository =
      SimularEmprestimoRepository();
  List<ConvenioModels?>? responseList = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Simulador App'),
        ),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'valor da parcela',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black38,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  contentPadding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 15.0, vertical: 30),
                  filled: false,
                  /*suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 2.0,
                      child: Image.asset(
                        sufixIconAssets,
                        width: 26,
                        height: 26,
                      ),
                    )*/
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MultiSelectDropDown<dynamic>(
              onOptionSelected: (List<ValueItem> selectedOptions) {},
              options: const <ValueItem>[
                ValueItem(label: 'Option 1', value: 1),
                ValueItem(label: 'Option 2', value: 2),
                ValueItem(label: 'Option 3', value: 3),
                ValueItem(label: 'Option 4', value: 4),
                ValueItem(label: 'Option 5', value: 5),
                ValueItem(label: 'Option 6', value: 6),
              ],
              hint: 'Quantidade de parcelas',
              focusedBorderColor: Colors.amber,
              selectionType: SelectionType.single,
              chipConfig: const ChipConfig(wrapType: WrapType.wrap),
              dropdownHeight: 300,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
            const SizedBox(
              height: 20,
            ),
            MultiSelectDropDown.network(
              hint: 'Instituições',
              focusedBorderColor: Colors.amber,
              onOptionSelected: (options) {},
              networkConfig: NetworkConfig(
                url: 'https://jsonplaceholder.typicode.com/users',
                method: RequestMethod.get,
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
              chipConfig: const ChipConfig(wrapType: WrapType.wrap),
              responseParser: (response) {
                final list = (response as List<dynamic>).map((e) {
                  final item = e as Map<String, dynamic>;
                  return ValueItem(
                    label: item['name'],
                    value: item['name'].toString(),
                  );
                }).toList();

                return Future.value(list);
              },
              responseErrorBuilder: ((context, body) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Error fetching the data'),
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            MultiSelectDropDown.network(
              hint: 'Convênios',
              focusedBorderColor: Colors.amber,
              onOptionSelected: (options) {},
              networkConfig: NetworkConfig(
                url: 'https://jsonplaceholder.typicode.com/users',
                method: RequestMethod.get,
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
              chipConfig: const ChipConfig(wrapType: WrapType.wrap),
              responseParser: (response) {
                final list = (response as List<dynamic>).map((e) {
                  final item = e as Map<String, dynamic>;
                  return ValueItem(
                    label: item['name'],
                    value: item['name'].toString(),
                  );
                }).toList();

                return Future.value(list);
              },
              responseErrorBuilder: ((context, body) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Error fetching the data'),
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: isLoading ? null : () async {
                setState(() {
                isLoading = true;
                  
                });
                responseList = await _simularRepository.fetchTodos();
                if(responseList?.length != 0 || responseList != null) {

                setState(() {
                  isLoading = false;
                });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.orange,
                ),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                //height: 50,

                child:  Text(
                  'simular'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: isLoading ? Container(child: Lottie.asset('assets/lottie/lottie-file.json'),): ListView.builder(
                
                  itemCount: responseList?.length,
                  itemBuilder: (BuildContext context, index) {
                     print(responseList?[index]?.name);
                     print(responseList?[index]?.eyeColor);
                    return ListCard(
                        title: Text(responseList?[index]?.name ?? "tem nada"),
                        //Text(responseList[index].results[index].name),
                        subtitle:
                            Text(responseList?[index]?.eyeColor ?? "tem nada2"),
                        imageLink:
                            'https://gravatar.com/avatar/401268f93a9efe134d4722b2062573be?s=400&d=robohash&r=x');
                  }) ,
            ),
          ],
        ),
      ),
    );
  }
}
