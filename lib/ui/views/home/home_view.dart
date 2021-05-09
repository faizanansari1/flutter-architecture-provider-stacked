import 'package:flutter/material.dart';
import 'package:flutter_architecture_provider_stacked/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  final TextEditingController textControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('BUILD');
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Column(
            children: [
              TextField(controller: textControl),
              SizedBox(height: 25),
              RaisedButton(
                onPressed: () {
                  if (textControl.text.isNotEmpty) {
                    model.addItem(textControl.text);
                    textControl.text = '';
                  }
                },
                child: Text('Add'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.getData.length,
                  itemBuilder: (_, index) => Card(
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        model.onDelete(index);
                      },
                      title: Text('${model.getData[index]['title']}'),
                      leading: CircleAvatar(
                        child: Text('${model.getData[index]['votes']}'),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          model.onDelete(index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.updateCounter,
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
