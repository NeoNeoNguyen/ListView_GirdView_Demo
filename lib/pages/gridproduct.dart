// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuan03/data/data.dart';
import 'package:tuan03/model/product_model.dart';

class GridProduct extends StatefulWidget {
  const GridProduct({super.key});

  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
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
        return Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              Text(
                "Grid View",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: listProduct.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemBuilder: (context, index) {
                    return itemGridView(listProduct[index]);
                  },
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}

Widget itemGridView(ProductModel productModel) {
  return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/' + productModel.img!,
            height: 80,
            width: 80,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
          ),
          Text(
            productModel.name ?? '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            NumberFormat('###,###.###').format(productModel.price),
            style: TextStyle(fontSize: 15, color: Colors.red),
          ),
          Text(
            productModel.des!,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          )
        ],
      ));
}
