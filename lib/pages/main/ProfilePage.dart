import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/Coupons.dart';
import 'package:ocean_park/components/utilui/CustomeIconButton.dart';
import 'package:ocean_park/components/utilui/CustomeOutlineButton.dart';
import 'package:ocean_park/components/utilui/LogOut.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';
import 'package:ocean_park/pages/sub/AddressEditPage.dart';
import 'package:ocean_park/pages/sub/ProfileEditPage.dart';
import 'package:ocean_park/services/custome_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerService>(
      builder: (context, snapshot, child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    margin: Theme.of(context).cardTheme.margin,
                    decoration: containerdecoration,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 130,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.customer.name!,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(height: 5),
                            Text(
                              snapshot.customer.phoneNumber.toString(),
                              maxLines: 1,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(height: 5),
                            Text(
                              snapshot.customer.email!,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -60,
                    left: 20,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(snapshot
                              .customer.profileImage ??
                          "https://static.wikia.nocookie.net/gameofthrones/images/b/be/AryaShipIronThrone.PNG/revision/latest/top-crop/width/360/height/360?cb=20190520174300"),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CustomeIconButton(
                      iconname: Icons.create_sharp,
                      callback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfileEditPage();
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: Theme.of(context).cardTheme.margin,
                padding: EdgeInsets.all(10),
                decoration: containerdecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Address",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Spacer(),
                        CustomeIconButton(
                          iconname: Icons.create_sharp,
                          callback: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AddressEditPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        snapshot
                                .customer
                                .addresses?[snapshot.customer.defaultAddress!]
                                .address ??
                            "${snapshot.customer.addresses?[0].locatity}${snapshot.customer.addresses?[0].city}${snapshot.customer.addresses?[0].state}${snapshot.customer.addresses?[0].pinCode}",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Coupons.show(context);
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  margin: Theme.of(context).cardTheme.margin,
                  padding: EdgeInsets.all(8.0),
                  decoration: containerdecoration,
                  child: Text(
                    "Coupons",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: Theme.of(context).cardTheme.margin,
                  padding: EdgeInsets.all(10.0),
                  decoration: containerdecoration,
                  child: Text(
                    "Terms of use",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  logout(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: Theme.of(context).cardTheme.margin,
                  padding: EdgeInsets.all(10.0),
                  decoration: containerdecoration,
                  child: Text(
                    "LogOut",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
