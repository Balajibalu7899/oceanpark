import 'package:flutter/material.dart';
import '/components/utilui/CustomSnackBar.dart';
import '/components/utilui/CustomeIconButton.dart';
import '/components/utilui/CustomeOutlineButton.dart';
import '/components/utilui/CustomeTextField.dart';
import '/global/texts/light_container_properties.dart';
import '/models/customer/addresses.dart';
import '/models/customer/location.dart';
import '/services/custome_service.dart';
import '/services/utilities/live_location.dart';
import 'package:provider/provider.dart';

class AddressEditPage extends StatefulWidget {
  @override
  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _localityController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();

  String? action;
  CustomeLocation? location;
  int defaultAddress = 0;
  int? activeAddress;
  List<Addresses>? addresses = <Addresses>[];

  @override
  void initState() {
    final customer =
        Provider.of<CustomerService>(context, listen: false).customer;
    defaultAddress = customer.defaultAddress!;
    addresses = customer.addresses;
    super.initState();
  }

  save() async {
    Addresses address = Addresses(
      name: _nameController.text,
      phone: _phoneController.text,
      area: _areaController.text,
      street: _streetController.text,
      locatity: _localityController.text,
      city: _cityController.text,
      state: _stateController.text,
      pinCode: int.parse(_pincodeController.text),
      address:
          "${_areaController.text},${_streetController.text},${_localityController.text},${_cityController.text},${_stateController.text},${_pincodeController.text}",
      location: location,
    );
    if (action == "new") {
      addresses!.add(address);
      setState(() {
        action = null;
      });
    } else {
      addresses![activeAddress!] = address;
      setState(() {
        action = null;
      });
    }
  }

  update(BuildContext context) {
    try {
      Provider.of<CustomerService>(context, listen: false)
          .updateAddress(addresses!, defaultAddress);
      Navigator.of(context).pop();
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomeIconButton(
                  iconname: Icons.add,
                  callback: () async {
                    _nameController.clear();
                    _phoneController.clear();
                    _areaController.clear();
                    _streetController.clear();
                    _localityController.clear();
                    _cityController.clear();
                    _stateController.clear();
                    _pincodeController.clear();
                    setState(() {
                      action = "new";
                      activeAddress = addresses!.length + 1;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: addresses!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          defaultAddress = index;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          action = "edit";
                          activeAddress = index;
                          _nameController.text = addresses![index].name ?? "";
                          _phoneController.text = addresses![index].phone ?? "";
                          _areaController.text = addresses![index].area ?? "";
                          _streetController.text =
                              addresses![index].street ?? "";
                          _localityController.text =
                              addresses![index].locatity ?? "";
                          _cityController.text = addresses![index].city ?? "";
                          _stateController.text = addresses![index].state ?? "";
                          _pincodeController.text =
                              addresses![index].pinCode!.toString();
                        });
                      },
                      onDoubleTap: () {
                        setState(() {
                          action = "edit";
                          activeAddress = index;
                          _nameController.text = addresses![index].name ?? "";
                          _phoneController.text = addresses![index].phone ?? "";
                          _areaController.text = addresses![index].area ?? "";
                          _streetController.text =
                              addresses![index].street ?? "";
                          _localityController.text =
                              addresses![index].locatity ?? "";
                          _cityController.text = addresses![index].city ?? "";
                          _stateController.text = addresses![index].state ?? "";
                          _pincodeController.text =
                              addresses![index].pinCode!.toString();
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: Theme.of(context).cardTheme.margin,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: defaultAddress == index
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).backgroundColor,
                          ),
                          color: containerdecoration.color,
                          borderRadius: containerdecoration.borderRadius,
                          boxShadow: containerdecoration.boxShadow,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  defaultAddress == index
                                      ? "Default Address"
                                      : "Other Address",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Spacer(),
                                CustomeIconButton(
                                  iconname: Icons.delete_rounded,
                                  callback: () {
                                    setState(() {
                                      addresses!.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, bottom: 5),
                              child: Text(
                                "Name: ${addresses![index].name!}",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, bottom: 5),
                              child: Text(
                                "Phone: ${addresses![index].phone!}",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Address: ${addresses![index].address!}",
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              action != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Update Address",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        CustomeTextField(
                          controller: _nameController,
                          label: "Name",
                          hinttext: "Enter the name",
                        ),
                        CustomeTextField(
                          controller: _phoneController,
                          label: "Phone Number",
                          hinttext: "Enter the Phone Number",
                          keyboardType: TextInputType.phone,
                        ),
                        InkWell(
                          onTap: () async {
                            location = await LiveLocation().location(context);
                            customeSnackBar(
                                context, " LiveLocation as Been Uploaded");
                          },
                          child: Container(
                            height: 45,
                            margin: Theme.of(context).cardTheme.margin,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardTheme.color,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .cardTheme
                                        .shadowColor!,
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
                                    style:
                                        Theme.of(context).textTheme.headline3,
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
                          controller: _areaController,
                          label: "House NO / Area",
                          hinttext: "Enter the area",
                        ),
                        CustomeTextField(
                          controller: _streetController,
                          label: "Street",
                          hinttext: "Enter the Street",
                          keyboardType: TextInputType.streetAddress,
                        ),
                        CustomeTextField(
                          controller: _localityController,
                          label: "Locality",
                          hinttext: "Enter Locality/ Land mark",
                        ),
                        CustomeTextField(
                          controller: _cityController,
                          label: "City",
                          hinttext: "Enter City",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CustomeTextField(
                                controller: _stateController,
                                label: "State",
                                hinttext: "Enter State",
                              ),
                            ),
                            Expanded(
                              child: CustomeTextField(
                                controller: _pincodeController,
                                label: "PinCode",
                                hinttext: "Enter PinCode",
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomeOutlineButton(
                            title: "Save",
                            tap: save,
                          ),
                        ),
                        SizedBox(height: 10)
                      ],
                    )
                  : Align(
                      alignment: Alignment.bottomRight,
                      child: CustomeOutlineButton(
                        title: "Continue",
                        tap: () {
                          update(context);
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
