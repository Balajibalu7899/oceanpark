import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/ImageSelector.dart';
import 'package:ocean_park/components/utilui/CustomSnackBar.dart';
import 'package:ocean_park/components/utilui/CustomeOutlineButton.dart';
import 'package:ocean_park/components/utilui/CustomeTextField.dart';
import 'package:ocean_park/models/customer/addresses.dart';
import 'package:ocean_park/models/customer/customer.dart';
import 'package:ocean_park/models/customer/location.dart';
import 'package:ocean_park/pages/main/HomeMain.dart';
import 'package:ocean_park/services/auth_service.dart';
import 'package:ocean_park/services/custome_service.dart';
import 'package:ocean_park/services/utilities/live_location.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

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
      defaultAddress: 0,
      profileImage: profileImage,
      addresses: [
        Addresses(
          address: _addressController.text,
          locatity: _localityController.text,
          city: _cityController.text,
          state: _stateController.text,
          pinCode: int.parse(_pincodeController.text),
          location: location,
        ),
      ],
    );
    bool log = await Provider.of<CustomerService>(context, listen: false)
        .addCustomer(customer);
    if (log) {
      customeSnackBar(context, "user added");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomeMain();
      }));
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
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
                    backgroundImage: NetworkImage(profileImage == null
                        ? "https://static.wikia.nocookie.net/gameofthrones/images/b/be/AryaShipIronThrone.PNG/revision/latest/top-crop/width/360/height/360?cb=20190520174300"
                        : profileImage!),
                    radius: 50,
                  ),
                ),
              ),
              CustomeTextField(
                  controller: _nameController,
                  label: "Name",
                  hinttext: "Enter FullName"),
              CustomeTextField(
                  controller: _phoneController,
                  label: "Phone",
                  hinttext: "Enter PhoneNumber"),
              CustomeTextField(
                  controller: _emailController,
                  label: "Email",
                  hinttext: "Enter EmailAddress"),
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
                  // final coordinates = await Coordinates(
                  //     location!.latitude, location!.longitude);
                  // var address = await Geocoder.local
                  //     .findAddressesFromCoordinates(coordinates);
                  // print(address);
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
