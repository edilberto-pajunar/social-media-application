import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/screens/login/select_country.dart';

import '../../components/logo.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  @override
  Widget build(BuildContext context) {
    var _enterPhoneNumber = TextEditingController();
    Map<String, dynamic> data = {"name": "Philippines", "code": "+63"};
    Map<String, dynamic>? dataResult;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Edit number"),
        previousPageTitle: "Back",
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Logo(
                width: 80.0,
                height: 80.0,
                size: 55.0,
              ),
              Text(
                "Verification * one step",
                style: TextStyle(
                  color: Color(0xFF08C187).withOpacity(0.7),
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Text(
            "Enter your phone number",
            style: TextStyle(
              color: CupertinoColors.systemGrey.withOpacity(0.7),
              fontSize: 30,
            ),
          ),
          CupertinoListTile(
            onTap: () async {
              dataResult = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const SelectCountry()));
              setState(() {
                if (dataResult != null) data = dataResult!;
              });
            },
            title: Text(
              data["name"],
              style: const TextStyle(
                color: Color(0xFF08C187),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  data["code"],
                  style: TextStyle(
                    fontSize: 25,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),
                Expanded(
                  child: CupertinoTextField(
                    placeholder: "Enter your phone number",
                    controller: _enterPhoneNumber,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 25,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "You will receive an activation code in short time",
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: CupertinoButton.filled(
              child: Text("Request Code"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
