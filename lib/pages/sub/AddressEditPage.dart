import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CustomSnackBar.dart';
import 'package:ocean_park/components/utilui/CustomeIconButton.dart';
import 'package:ocean_park/components/utilui/CustomeOutlineButton.dart';
import 'package:ocean_park/components/utilui/CustomeTextField.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/models/customer/addresses.dart';
import 'package:ocean_park/models/customer/location.dart';
import 'package:ocean_park/services/custome_service.dart';
import 'package:ocean_park/services/utilities/live_location.dart';
import 'package:provider/provider.dart';

class AddressEditPage extends StatelessWidget {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _localityController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  CustomeLocation? location;
  User? user;
  update(BuildContext context) async {
    Addresses addresses = Addresses(
      address: _addressController.text,
      locatity: _localityController.text,
      city: _cityController.text,
      state: _stateController.text,
      pinCode: int.parse(_pincodeController.text),
      location: location,
    );
    bool log = await Provider.of<CustomerService>(context, listen: false)
        .updateAddress(addresses);
    if (log) {
      customeSnackBar(context, "Address Updated");
    } else {
      customeSnackBar(context, " Unable to Update Address");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerService>(builder: (context, snapshot, child) {
      return Scaffold(
          body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          snapshot.customer.addresses!.length != null
              ? Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  margin: Theme.of(context).cardTheme.margin,
                  padding: EdgeInsets.all(5),
                  decoration: containerdecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Defauld Address",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Spacer(),
                          CustomeIconButton(
                            iconname: Icons.delete_rounded,
                            callback: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot
                                  .customer
                                  .addresses?[snapshot.customer.defaultAddress!]
                                  .address ??
                              "",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          snapshot.customer.addresses!.length != null
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.customer.addresses!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      margin: Theme.of(context).cardTheme.margin,
                      padding: EdgeInsets.all(5),
                      decoration: containerdecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Other Address",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Spacer(),
                              CustomeIconButton(
                                iconname: Icons.delete_rounded,
                                callback: () async {
                                  await Provider.of<CustomerService>(context,
                                          listen: false)
                                      .deleteAddress(index);
                                  // if (log) {
                                  //   customeSnackBar(context, "Address Deleted");
                                  // } else {
                                  //   customeSnackBar(
                                  //       context, "Unable to delete Address");
                                  // }
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.customer.addresses?[index].address ?? "",
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : Container(),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Update Address",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          InkWell(
            onTap: () async {
              location = await LiveLocation().location(context);
              customeSnackBar(context, " LiveLocation as Been Uploaded");
            },
            child: Container(
              height: 45,
              margin: Theme.of(context).cardTheme.margin,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).cardTheme.shadowColor!,
                      spreadRadius: 0,
                      blurRadius: 4,
                    ),
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Live Location",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 45,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.location_searching_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomeTextField(
              controller: _addressController,
              label: "Address",
              hinttext: "Address(House No,Building,Street)"),
          CustomeTextField(
              controller: _localityController,
              label: "Locality/Town",
              hinttext: "Locality or Town"),
          CustomeTextField(
              controller: _cityController,
              label: "City",
              hinttext: "Enter City"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width / 2),
                child: CustomeTextField(
                    controller: _stateController,
                    label: "State",
                    hinttext: "Enter State"),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 2),
                child: CustomeTextField(
                    controller: _pincodeController,
                    label: "PinCode",
                    hinttext: "Enter PinCode"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomeOutlineButton(
              title: "Update",
              tap: () {
                update(context);
              },
            ),
          ),
        ],
      ));
    });
  }
}
