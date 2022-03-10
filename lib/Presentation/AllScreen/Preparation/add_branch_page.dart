import 'package:BornoBangla/Data/Models/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBranchPage extends StatefulWidget {
  const AddBranchPage({Key? key}) : super(key: key);

  @override
  _AddBranchPageState createState() => _AddBranchPageState();
}

class _AddBranchPageState extends State<AddBranchPage> {
  TextEditingController branchNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Add Branch')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: branchNameController,
              decoration: InputDecoration(
                labelText: 'Branch Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                BranchModel branchModel = BranchModel(
                  name: branchNameController.text,
                );
                await branchModel.save();
                branchNameController.clear();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Text(
                  'Add Branch',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<BranchModel>>(
                stream: BranchModel.getAllAsStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(snapshot.data![index].name),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await snapshot.data![index].delete();
                              },
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 20);
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
