import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/components/utilui/ImageSelector.dart';
import '/components/utilui/CustomeOutlineButton.dart';
import '/components/utilui/CustomeTextField.dart';
import '/models/customer/customer.dart';
import '/services/custome_service.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  Customer? customer;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  User? user;
  String? profileImage;

  @override
  void initState() {
    customer = Provider.of<CustomerService>(context, listen: false).customer;
    _nameController.text = customer!.name ?? "";
    _phoneController.text = customer!.phoneNumber!.toString();
    _emailController.text = customer!.email ?? "";
    profileImage = customer!.profileImage;
    super.initState();
  }

  update(BuildContext context) async {
    Customer customer = Customer(
      name: _nameController.text,
      phoneNumber: int.parse(_phoneController.text),
      email: _emailController.text,
    );
    Provider.of<CustomerService>(context, listen: false)
        .updateCustomer(customer);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Edit",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
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
                    backgroundImage: NetworkImage(profileImage ??
                        "https://firebasestorage.googleapis.com/v0/b/ocean-park-621.appspot.com/o/Public%2FAssets%2FIcons%2FPerson.jpg?alt=media&token=e7b625c0-48e9-47d5-a35c-a48405326233"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                hinttext: "Enter Email",
                keyboardType: TextInputType.emailAddress,
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
  }
}
