import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/ImageSelector.dart';
import 'package:ocean_park/components/utilui/CustomeOutlineButton.dart';
import 'package:ocean_park/components/utilui/CustomeTextField.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/services/custome_service.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _localityController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  User? user;
  String? profileImage;

  update(BuildContext context) async {
    // Customer customer = Customer(
    //     name: _nameController.text,
    //     phoneNumber: int.parse(_phoneController.text),
    //     email: _emailController.text,
    //     defaultAddress: 0,
    //     addresses: [
    //       Addresses(
    //         address: _addressController.text,
    //         locatity: _localityController.text,
    //         city: _cityController.text,
    //         state: _stateController.text,
    //         pinCode: int.parse(_pincodeController.text),
    //       )
    //     ]);
    //  Provider.of<CustomerService>(context).updateCustomer(customer);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerService>(
      builder: (context, snapShot, child) {
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
                    child: Text(
                      "Edit Profile",
                      style: Theme.of(context).textTheme.headline1,
                    ),
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
                        radius: 50,
                        backgroundImage: NetworkImage(snapShot
                                .customer.profileImage ??
                            "https://static.wikia.nocookie.net/gameofthrones/images/b/be/AryaShipIronThrone.PNG/revision/latest/top-crop/width/360/height/360?cb=20190520174300"),
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
                      hinttext: "Enter Email"),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Address",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: Theme.of(context).cardTheme.margin,
                    decoration: containerdecoration,
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
                      tap: () {
                        update(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
