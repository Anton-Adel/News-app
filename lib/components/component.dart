import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../web_view/NewsWebView.dart';

Widget defaultButton({
  double? width = double.infinity,
  Color background = Colors.grey,
  bool? upper = true,
  double radius = 0.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        height: 30,
        child: Text(
          upper! ? text.toUpperCase() : text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );

Widget DefaultTextFeild({
  required TextEditingController controller,
  required TextInputType type,
  bool password = false,
  required String label,
  required IconData prefix,
  Function? onchange,
  Function? ontap,
  IconButton? suffix,
  required FormFieldValidator validate,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: password,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix,
        border: OutlineInputBorder(),
      ),
      validator: validate,
      onChanged: (value) {
        onchange!(value);
      },
      onTap: () {
        ontap!();
      },
    );

Widget seperator() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

Widget News(artical, context) => InkWell(
      onTap: () {
        navigate(
            context,
            Webview(artical['ur'
                'l']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage('${artical['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${artical['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${artical["publishedAt"]}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget NewsArticales(List artical, context, {bool? search = true}) =>
    ((artical.length <= 0) & (search == true))
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => News(artical[index], context),
            separatorBuilder: (context, index) => seperator(),
            itemCount: artical.length);

void navigate(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void navigate_replace(context, Widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );
