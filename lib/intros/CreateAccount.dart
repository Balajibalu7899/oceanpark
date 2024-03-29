import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/components/utilui/ImageSelector.dart';
import '/components/utilui/CustomSnackBar.dart';
import '/components/utilui/CustomeOutlineButton.dart';
import '/components/utilui/CustomeTextField.dart';
import '/models/customer/addresses.dart';
import '/models/customer/customer.dart';
import '/models/customer/location.dart';
import '/services/auth_service.dart';
import '/services/custome_service.dart';
import '/services/utilities/live_location.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _localityController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  CustomeLocation? location;

  String? profileImage;
  User? user;
  String? address;

  createaccount(context) async {
    Customer customer = Customer(
      name: _nameController.text,
      phoneNumber: int.parse(_phoneController.text),
      email: _emailController.text,
      profileImage: profileImage,
      defaultAddress: 0,
      addresses: [
        Addresses(
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
        )
      ],
    );
    bool log = await Provider.of<CustomerService>(context, listen: false)
        .create(customer);
    if (log) {
      customeSnackBar(context, "user added");
      Navigator.of(context).pop();
    } else {
      customeSnackBar(context, "Unable to create User");
    }
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthService>(context, listen: false).user;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: InkWell(
                  onTap: () {
                    ImageSelector().choseImage(
                        context, "users/${user!.uid}/images", (url) {
                      setState(() {
                        profileImage = url;
                      });
                    });
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      profileImage == null
                          ? "https://firebasestorage.googleapis.com/v0/b/ocean-park-621.appspot.com/o/Public%2FAssets%2FIcons%2FPerson.jpg?alt=media&token=e7b625c0-48e9-47d5-a35c-a48405326233"
                          : profileImage!,
                    ),
                    radius: 50,
                  ),
                ),
              ),
              CustomeTextField(
                controller: _nameController,
                label: "Name",
                hinttext: "Enter FullName",
              ),
              CustomeTextField(
                controller: _phoneController,
                label: "Phone",
                hinttext: "Enter PhoneNumber",
                keyboardType: TextInputType.phone,
              ),
              CustomeTextField(
                controller: _emailController,
                label: "Email",
                hinttext: "Enter EmailAddress",
                keyboardType: TextInputType.emailAddress,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Address",
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
                  title: "Continue",
                  tap: () => createaccount(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
