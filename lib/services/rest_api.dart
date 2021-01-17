import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_stock/utils/constants.dart';
import 'package:flutter_stock/models/Product.dart';

class CallAPI {
  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};

  //Post Login
  postData(data, apiURL) async {
    var fullURL = baseURLAPI + apiURL;
    return await http.post(fullURL,
        body: jsonEncode(data), headers: _setHeaders());
  }

  //CRUD Product
  //Get all products
  Future<List<Product>> getProducts() async {
    final response =
        await http.get(baseURLAPI + "products", headers: _setHeaders());
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
  }

  //Create product
  Future<bool> createProduct(Product data) async {
    final response = await http.post(baseURLAPI + "products",
        headers: _setHeaders(), body: productToJson(data));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Update product
  Future<bool> updateProduct(Product data) async {
    final response = await http.put(baseURLAPI + "products/${data.id}",
        headers: _setHeaders(), body: productToJson(data));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //Delete product
  Future<bool> deleteProduct(int id) async {
    final response =
        await http.delete(baseURLAPI + "products/$id", headers: _setHeaders());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
