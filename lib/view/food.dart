import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:words_record/components/image_card.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FoodPage();
  }
}

class _FoodPage extends State<FoodPage> {
  List<Map> foodList = [
    {
      "url":
          "https://media.istockphoto.com/id/1277719283/cs/fotografie/pouli%C4%8Dn%C3%AD-j%C3%ADdlo-burgery-z-masn%C3%BDch-%C5%99%C3%ADzk%C5%AF-jsou-v-pap%C3%ADrov%C3%BDch-krabic%C3%ADch-rozvoz-j%C3%ADdla.jpg?s=612x612&w=0&k=20&c=Gc_EU3B-uy9SPgpNfdh7TEm0awYIJPTGoV-UeodTQGo=",
      "name": 'check ',
      "country": 'usa'
    },
    {
      "url":
          "https://media.istockphoto.com/id/1277719283/cs/fotografie/pouli%C4%8Dn%C3%AD-j%C3%ADdlo-burgery-z-masn%C3%BDch-%C5%99%C3%ADzk%C5%AF-jsou-v-pap%C3%ADrov%C3%BDch-krabic%C3%ADch-rozvoz-j%C3%ADdla.jpg?s=612x612&w=0&k=20&c=Gc_EU3B-uy9SPgpNfdh7TEm0awYIJPTGoV-UeodTQGo=",
      "name": 'check ',
      "country": 'usa'
    },
    {
      "url":
          "https://media.istockphoto.com/id/1277719283/cs/fotografie/pouli%C4%8Dn%C3%AD-j%C3%ADdlo-burgery-z-masn%C3%BDch-%C5%99%C3%ADzk%C5%AF-jsou-v-pap%C3%ADrov%C3%BDch-krabic%C3%ADch-rozvoz-j%C3%ADdla.jpg?s=612x612&w=0&k=20&c=Gc_EU3B-uy9SPgpNfdh7TEm0awYIJPTGoV-UeodTQGo=",
      "name": 'check ',
      "country": 'usa'
    },
    {
      "url":
          "https://media.istockphoto.com/id/502840530/cs/fotografie/luxusn%C3%AD-restaura%C4%8Dn%C3%AD-st%C5%AFl-p%C5%99i-z%C3%A1padu-slunce.jpg?s=612x612&w=0&k=20&c=Sflhzn04I1xnVYecBfb8ukLVzO7lzL81CbO__4Xht7M=",
      "name": 'check ',
      "country": 'usa'
    },
    {
      "url":
          "https://media.istockphoto.com/id/1277719283/cs/fotografie/pouli%C4%8Dn%C3%AD-j%C3%ADdlo-burgery-z-masn%C3%BDch-%C5%99%C3%ADzk%C5%AF-jsou-v-pap%C3%ADrov%C3%BDch-krabic%C3%ADch-rozvoz-j%C3%ADdla.jpg?s=612x612&w=0&k=20&c=Gc_EU3B-uy9SPgpNfdh7TEm0awYIJPTGoV-UeodTQGo=",
      "name": 'check ',
      "country": 'usa'
    },
    {
      "url":
          'https://media.istockphoto.com/id/1271870386/cs/fotografie/arabsk%C3%A1-tradi%C4%8Dn%C3%AD-kuchyn%C4%9B-bl%C3%ADzkov%C3%BDchodn%C3%AD-meze-s-pitou-olivami-barevn%C3%BDm-hummusem-falafelem.jpg?s=612x612&w=0&k=20&c=mBvhoOjo2n-wbHbWYKBgF5K2Halb_IuL569cqxyMSqQ=',
      "name": 'check ',
      "country": 'usa'
    },
  ];

  List<Widget> renderImageCard() {
    List<Widget> list = [];
    for (var element in foodList) {
      list.add(ImageCard(
          url: element['url'],
          name: element['name'],
          country: element['country']));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: renderImageCard(),
          ),
        ),
      ),
    );
  }
}
