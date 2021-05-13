import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CustomeTextField.dart';
import 'package:ocean_park/global/texts/light_container_properties.dart';

class PaymentsPage extends StatelessWidget {
  TextEditingController _cardnumber = TextEditingController();
  TextEditingController _expiredate = TextEditingController();
  TextEditingController _cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Total Ammount',
                style: Theme.of(context).textTheme.headline1,
              ),
              Spacer(),
              Text(
                '₹ 2500',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Container(
            margin: Theme.of(context).cardTheme.margin,
            decoration: containerdecoration,
            child: ExpansionTile(
              title: Text(
                'UPI Payment',
                style: Theme.of(context).textTheme.headline2,
              ),
              children: <Widget>[
                ListTile(title: Text('Title of the item')),
                ListTile(
                  title: Text('Title of the item2'),
                )
              ],
            ),
          ),
          Container(
            margin: Theme.of(context).cardTheme.margin,
            decoration: containerdecoration,
            child: ExpansionTile(
              title: Text(
                'Net Banking',
                style: Theme.of(context).textTheme.headline2,
              ),
              children: <Widget>[
                ListTile(title: Text('Title of the item')),
                ListTile(
                  title: Text('Title of the item2'),
                )
              ],
            ),
          ),
          Container(
            margin: Theme.of(context).cardTheme.margin,
            decoration: containerdecoration,
            child: ExpansionTile(
              title: Text(
                'Debit Card',
                style: Theme.of(context).textTheme.headline2,
              ),
              children: <Widget>[
                CustomeTextField(
                  controller: _cardnumber,
                  label: "Card Number",
                  hinttext: "Enter Your Card Number",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 40,
                      child: CustomeTextField(
                        controller: _expiredate,
                        label: "Expire Date",
                        hinttext: "Month | Year",
                      ),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 40,
                      child: CustomeTextField(
                        controller: _cvv,
                        label: "CVV",
                        hinttext: "Enter the CVV",
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: Theme.of(context).cardTheme.margin,
            decoration: containerdecoration,
            child: ExpansionTile(
              title: Text(
                'Credit Card',
                style: Theme.of(context).textTheme.headline2,
              ),
              children: <Widget>[
                ListTile(title: Text('Title of the item')),
                ListTile(
                  title: Text('Title of the item2'),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
