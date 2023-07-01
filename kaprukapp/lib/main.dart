// import 'dart:convert';
// import 'dart:ffi';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Product {
//   final String title;
//   final Int price;
//   final String description;
//   final Double discountPercentage;
//   final Double rating;
//   final Int stock;
//   final String brand;
//   final String category;
//   final String thumbnail;
//   final String images;

//   Product({required this.title, required this.price, required this.description,required this.discountPercentage,required this.rating,required this.stock,required this.brand,required this.category,required this.thumbnail,required this.images});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       title: json['title'],
//       price: json['price'].to,
//       description: json['description'],
//       discountPercentage:json['discountPercentage'],
//       rating:json['rating'],
//       stock:json['stock'],
//       brand:json['brand'],
//       category:json['category'],
//       thumbnail:json['thumbnail'],
//       images:json['images']

//     );
//   }
// }

// class ProductListScreen extends StatefulWidget {
//   @override
//   _ProductListScreenState createState() => _ProductListScreenState();
// }

// class _ProductListScreenState extends State<ProductListScreen> {
//   List<Product> products = [];
//   bool isLoading = false;

//   Future<void> fetchProducts() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final response = await http.get(Uri.parse('https://dummyjson.com/products'));
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);
//         products = jsonData.map((data) => Product.fromJson(data)).toList();
//       } else {
//         throw Exception('Failed to fetch products');
//       }
//     } catch (e) {
//       print('Error: $e');
//       // Handle error scenario
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final product = products[index];
//                 return ListTile(
//                   title: Text(product.title),
//                   subtitle: Text(product.description),
//                    trailing: Text('\$${product.price}'),
//                 );
//               },
//             ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ProductListScreen(),
//   ));
// }

// import 'dart:js';

import 'package:flutter/material.dart';

class Product {
  final int id;
  final String imagePath;
  double rating;
  double price;
  String description;
  int stock;
  String brand;
  String category;

  Product({
    required this.id,
    required this.imagePath,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.description,
    required this.price,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      imagePath: 'lib/assets/iphone.jpg',
      rating: 2.5,
      stock: 10,
      description: 'An apple mobile which is nothing like apple',
      brand: 'Apple',
      price: 549,
      category: 'SmartPhones',
    ),
    Product(
      id: 2,
      imagePath: 'lib/assets/iphone1.jpg',
      rating: 3.0,
      stock: 15,
      description: 'An apple mobile which is nothing like apple',
      price: 649,
      brand: 'Apple',
      category: 'smartphones',
    ),
     Product(
      id: 3,
      imagePath: 'lib/assets/iphone2.jpg',
      rating: 3.8,
      price: 749,
      description: 'An apple mobile which is nothing like apple',
      stock: 20,
      brand: 'Apple',
      category: 'smartPhones',
    ),
    Product(
      id: 4,
      imagePath: 'lib/assets/iphone4.jpg',
      rating: 5.8,
      price: 849,
      description: 'An apple mobile which is nothing like apple',
      stock: 18,
      brand: 'apple',
      category: 'smartphones',
    ),
    // Add more products here...
  ];

  void navigateToProductDetail(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  Widget buildProductImage(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () => navigateToProductDetail(context, product),
      // child: Image.asset(
      //   product.imagePath,
      //   fit: BoxFit.cover,
      //   width: 200,
      //   height: 500,
      // ),
      child: Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 2.0,
    ),
  ),
  child: Image.asset(
    product.imagePath,
    fit: BoxFit.cover,
    width: 300,
    height: 500,
  ),
),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return ListTile(
            title: buildProductImage(context, product), // Pass the context here
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rating:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                SizedBox(width: 8),
                Text(
                  '${product.rating.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
             SizedBox(height: 16),
            Text(
              'price: ${product.price}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'description: ${product.description}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 16),
            Text(
              'Stock: ${product.stock}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Brand: ${product.brand}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Category: ${product.category}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}








