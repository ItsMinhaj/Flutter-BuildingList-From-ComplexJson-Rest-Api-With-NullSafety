import 'package:complex_json_rest_api/widget/resualbe_row.dart';
import 'package:flutter/material.dart';

import 'package:complex_json_rest_api/model/user_model.dart';
import 'package:complex_json_rest_api/services/api_services.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BuildingList from ComplexJson"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: apiServices.fetchUserData(),
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: apiServices.userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ReusableRow(
                              title: "Name",
                              value: snapshot.data![index].name.toString()),
                          ReusableRow(
                              title: "Username",
                              value: snapshot.data![index].username.toString()),
                          ReusableRow(
                              title: "Address",
                              value: snapshot.data![index].address!.city
                                  .toString()),
                          ReusableRow(
                              title: "Zip Code",
                              value: snapshot.data![index].address!.zipcode
                                  .toString()),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
