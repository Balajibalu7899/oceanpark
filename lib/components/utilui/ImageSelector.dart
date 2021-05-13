import 'package:flutter/material.dart';
import 'package:ocean_park/services/imageupload_service.dart';

class ImageSelector {
  choseImage(BuildContext context, String path, Function setUrl) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    "Choose Image From?",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Icon(
                      Icons.photo_camera,
                      size: 50,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                          child: Text(
                            "Gallery",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          onPressed: () async {
                            final url =
                                await ImageUpload().uploadImage(path, false);
                            setUrl(url);
                            Navigator.pop(context);
                          }),
                      TextButton(
                          child: Text(
                            "Camera",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                            ),
                          ),
                          onPressed: () async {
                            final url =
                                await ImageUpload().uploadImage(path, true);
                            setUrl(url);
                            Navigator.pop(context);
                          }),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
