// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuan03/data/data.dart';
import 'package:tuan03/model/product_model.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
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
            child: Column(
              children: [
              const Text(
                "List Product",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listProduct.length,
                  itemBuilder: (context, index) {
                    return itemListView(listProduct[index]);
                  },
                ),
              )
            ]),
          );
      },
    );
  }
}

Widget itemListView(ProductModel productModel) {
  return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical:5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/' + productModel.img!,
            height: 80,
            width: 80,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
          ),
          SizedBox(width: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          )
        ],
      )
  );
}

