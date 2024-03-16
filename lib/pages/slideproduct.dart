// ignore_for_file: avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tuan03/data/data.dart';
import 'package:tuan03/model/product_model.dart';

class SlideProduct extends StatefulWidget {
  const SlideProduct({super.key});

  @override
  State<SlideProduct> createState() => _SlideProductState();
}

class _SlideProductState extends State<SlideProduct> {
  List<ProductModel> listProduct = [];
  Future<String> loadList() async {
    listProduct = await ReadData().loadData();
    return '';
  }

  @override
  void initState() {
    //implement
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadList(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Center(
          child: Column(children: [
            const Text(
              "Skide Product",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            slide(listProduct)
          ]),
        );
      },
    );
  }
}

Widget slide(List<ProductModel> listProduct) {
  return Container(
    child: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: listProduct.map((item) {
        return Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/' + item.img!,
                  height: 80,
                  width: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.image),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      item.name!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}
