import 'dart:convert';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<dynamic>? dataRetrieved; // data decoded from the json file
  List<dynamic>? data; // data to display on the scren
  var _searchController = TextEditingController();
  var searchValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Future _getData() async {
    final String response =
        await rootBundle.loadString("assets/CountryCodes.json");
    dataRetrieved = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text("Select Country"),
            previousPageTitle: "Edit number",
          ),
          SliverToBoxAdapter(
            child: CupertinoSearchTextField(
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              controller: _searchController,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate((data != null)
                ? data!
                    .where((element) => element['name']
                        .toString()
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()))
                    .map((e) => CupertinoListTile(
                          onTap: () {
                            Navigator.pop(context,
                                {"name": e['name'], "code": e['dial_code']});
                          },
                          title: Text(e['name']),
                          trailing: Text(e['dial_code']),
                        ))
                    .toList()
                : [
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ]),
          ),
        ],
      ),
    );
  }
}
