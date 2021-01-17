import 'package:flutter/material.dart';
import 'package:flutter_stock/models/Product.dart';
import 'package:flutter_stock/services/rest_api.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();
  String productName,
      productDetail,
      productBarcode,
      productPrice,
      productImage,
      productCategory;
  int productQty, productStatus;

  Widget productNameText() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(
          Icons.storage,
          color: Colors.teal,
          size: 30,
        ),
        //hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product name',
        labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        errorStyle: TextStyle(fontSize: 16.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Product name cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productName = value;
      },
    );
  }

  Widget productDetailText() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.storage,
            color: Colors.teal,
            size: 30,
          ),
          //hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product detail',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product detail cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productDetail = value;
      },
    );
  }

  Widget productBarcodeText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.storage,
            color: Colors.teal,
            size: 30,
          ),
          //hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product barcode',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product barcode cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productBarcode = value;
      },
    );
  }

  Widget productQtyText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.storage,
            color: Colors.teal,
            size: 30,
          ),
          //hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product Qty',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product Qty cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productQty = int.parse(value);
      },
    );
  }

  Widget productPriceText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.storage,
            color: Colors.teal,
            size: 30,
          ),
          //hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product Price',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product price cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productPrice = value;
      },
    );
  }

  Widget productImageText() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.storage,
            color: Colors.teal,
            size: 30,
          ),
          //hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product image',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product image cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productImage = value;
      },
    );
  }

  Widget productCategoryText() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.storage,
            color: Colors.teal,
            size: 30,
          ),
          //hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product Category',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product category cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productCategory = value;
      },
    );
  }

  Widget productStatusText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.storage,
            color: Colors.teal,
            size: 30,
          ),
          //hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product status',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product status cannot empty";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        productStatus = int.parse(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new product'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productNameText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productDetailText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productBarcodeText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productQtyText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productPriceText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productImageText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productCategoryText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productStatusText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RaisedButton(
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      print('validation Pass');
                      Product productdata = new Product(
                          productName: productName,
                          productDetail: productDetail,
                          productBarcode: productBarcode,
                          productQty: productQty,
                          productPrice: productPrice,
                          productImage: productImage,
                          productCategory: productCategory,
                          productStatus: productStatus);
                      //print(productdata);
                      var response = await CallAPI().createProduct(productdata);
                      print(response);
                      if (response == true) {
                        Navigator.pop(context, true);
                      }
                    }
                  },
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
