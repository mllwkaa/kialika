import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartprovider.dart';
import 'sabadkharid.dart';
import 'favoriteprovider.dart';
import 'nextshopprovider.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  ProductDetailPage({required this.productId});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _rating = 4.0;
  int _quantity = 1;
  List<String> _comments = [];
  List<bool> _likes = [];
  late String _productName;
  late String _productImage;
  late double _price;
  late String _productDescription;
  late int _stock;
  late int _sold;

  final TextEditingController _commentController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _loadProductDetails(widget.productId);
  }

  void _loadProductDetails(String productId) {
    if (productId == 'Honey Infused Hair Oil') {
      _productName = 'Gisou Honey Infused Hair Oil';
      _productImage = 'assets/hair/honey.jpg';
      _price = 40;
      _productDescription = 'Our global bestselling, award-winning* & clinically proven hair oil powered by Mirsalehi Honey to intensely hydrate, instantly boost shine, smooth frizz & protect from heat up to 230°C/ 450°F - along with the Bee Garden Oils, that deeply nourishes for glossy hair.';
      _stock = 50;
      _sold = 200;
      _rating=4.5;
    } else if (productId == 'CeraVe Hydrating Cleanser') {
      _productName = 'Cerave hydrating cleanser';
      _productImage = 'assets/Hygienic/cerave.jpg';
      _price = 15;
      _productDescription = 'CeraVe Hydrating Facial Cleanser was designed to cleanse and refresh the skin without over-stripping it or leaving it feeling tight and dry';
      _stock = 30;
      _sold = 150;
      _rating=4.8;
    } else if (productId == '30 Montaigne Short Necklace'){
      _productName = '30 Montaigne Short Necklace';
      _productImage = 'assets/jewelry/brac.jpg';
      _price = 650;
      _productDescription = 'Completely new Dior 30 gold plated Montaigne Necklace, featuring a CD logo, white fantasy pearls, and a lobster closure.';
      _stock = 23;
      _sold = 100;
      _rating=4.5;

    }
    else if (productId == 'Dior Forever Couture Luminizer'){
      _productName = 'Dior Forever Couture Luminizer';
      _productImage = 'assets/Cosmetic/dior.jpg';
      _price = 61;
      _productDescription = 'The Dior Forever Couture Luminizer is adorned with a golden Christian Dior band. A regal-inspired motif created by Italian artist Pietro Ruffo elegantly unfolds around it.';
      _stock = 20;
      _sold = 150;
      _rating=4.5;
    }
    else if (productId == 'Yves Saint Laurent Libre Eau de Parfum 150 ml'){
      _productName = 'Yves Saint Laurent Libre Eau de Parfum 150 ml';
      _productImage = 'assets/Perfume/libra.jpg';
      _price = 185.95;
      _productDescription = 'YSL Libre Eau de Parfum perfume is a daring scent of freedom which produces a unique and captivating aroma. Lavender and bergamot, as the top notes, bring out a fresh scent; whereas orange blossom and jasmine as the heart notes give off a subtle yet sexy fragrance.';
      _stock = 150;
      _sold = 200;
      _rating=4.5;

    }
    else if (productId == 'Charlotte Magic Serum Crystal Elixir'){
      _productName = 'Charlotte Magic Serum Crystal Elixir';
      _productImage = 'assets/skin/magic.jpg';
      _price = 79;
      _productDescription = 'It works to enhance the skin texture for a smoother, softer and more radiant finish. Charlotte Tilbury Magic Serum Crystal Elixir combines effective ingredients with ground-breaking skincare technology. It helps to create a brighter, more even canvas for enhanced makeup application.';
      _stock = 23;
      _sold = 100;
      _rating=4.5;

    }
    else if(productId == 'Rosemary Mint Scalp & Hair Strengthening Oil'){
      _productName = 'Rosemary Mint Scalp & Hair Strengthening Oil';
      _productImage = 'assets/hair/rose.jpg';
      _price = 19.99;
      _productDescription = 'Made with more than 20 natural oils/ingredients Promotes growth with biotin infusion Revives and nourishes follicles Prevents dryness of the scalp Smooths split ends Faster and thicker growth Both rosemary and mint essential oils are known to increase blood circulation which allows for more oxygen to be carried to your scalp. More oxygen will stimulate your follicles, resulting in faster and thicker growth.';
      _stock = 20;
      _sold = 100;
      _rating=4.8;

    }

    else if(productId == 'Dior Lip Oil'){
      _productName = 'Dior Lip Oil';

      _productImage = 'assets/Cosmetic/lipoil.jpg';
      _price = 65;
      _productDescription = 'Dior Lip Glow Oil is a nourishing glossy lip oil. It protects the lips while enhancing the lips by bringing out their natural color. It is a non-sticky, rich, non-greasy and balmy lip oil. It provides intense lip care while it makes lips look glossy and shiny.';
      _stock = 15;
      _sold = 150;
      _rating=4.8;

    }
    else if(productId == 'Marvis Sensitive Gums Gentle Mint Toothpaste (75ml)'){
      _productName = 'Marvis Sensitive Gums Gentle Mint Toothpaste (75ml)';
      _productImage ='assets/Hygienic/marvis.jpg';
      _price = 8.55;
      _productDescription = 'Marvis flavors are created by offsetting the aroma of mint, to provide the freshness you need, with innovative notes to offer you a long-lasting pleasurable taste sensation that can be different every day.';
      _stock = 15;
      _sold = 95;
      _rating=4.5;

    }
    else if(productId == 'LA CREME MAIN CHANEL'){
      _productName = 'LA CREME MAIN CHANEL';
      _productImage ='assets/skin/chanel.jpg';
      _price = 56;
      _productDescription = 'LA CREME MAIN TEXTURE RICHE is a comprehensive, ultra-nourishing care product for the hands and nails. Intensely moisturised, hands recover their softness with a feeling of lasting comfort. The rich formula improves skin hydration upon application. It is ideal for hand protection against cold weather.';
      _stock = 60;
      _sold = 95;
      _rating=4.8;

    }
    else if(productId == 'Miss Dior'){
      _productName = 'Miss Dior';
      _productImage ='assets/Perfume/missdior.jpg';
      _price = 70;
      _productDescription = 'Notes: This perfume opens with delicious strawberry, cherry, pineapple and mandarin orange notes, blending with a heart of caramel, violet, popcorn rose and jasmine. To warm the fragrance and leave a lasting impression the top and heart layer atop a base of amber, musk and patchouli.';
      _stock = 20;
      _sold = 98;
      _rating=4.8;

    }
    else if(productId == 'Dio(r)evolution Ring'){
      _productName = 'Dio(r)evolution Ring';
      _productImage ='assets/jewelry/ring.jpg';
      _price = 320;
      _productDescription = 'The Dio(R)evolution ring from Christian Dior is fashioned with elegance and simplicity at the forefront. A white crystal and Dior signature is set delicately on a thin gold finished metal band.';
      _stock = 20;
      _sold = 10;
      _rating=4.8;
    }
    setState(() {});
  }

  void _addToCart(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(CartItem(
      id: widget.productId,
      name: _productName,
      imageUrl: _productImage,
      price: _price,
      discountedPrice: _price,
      quantity: _quantity,
    ));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product added to cart!')),
    );
  }

  void _toggleFavorite(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final isFavorite = favoriteProvider.isFavorite(widget.productId);

    setState(() {
      if (isFavorite) {
        favoriteProvider.removeFromFavorites(widget.productId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product removed from favorites!')),
        );
      } else {
        favoriteProvider.addToFavorites(CartItem(
          id: widget.productId,
          name: _productName,
          imageUrl: _productImage,
          price: _price,
          discountedPrice: _price,
          quantity: _quantity,
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product added to favorites!')),
        );
      }
    });
  }

  void _toggleNextShop(BuildContext context) {
    final nextShopProvider = Provider.of<NextShopProvider>(context, listen: false);
    final isInNextShop = nextShopProvider.isInNextShop(widget.productId);

    setState(() {
      if (isInNextShop) {
        nextShopProvider.removeFromNextShop(widget.productId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product removed from Next Shop!')),
        );
      } else {
        nextShopProvider.addToNextShop(CartItem(
          id: widget.productId,
          name: _productName,
          imageUrl: _productImage,
          price: _price,
          discountedPrice: _price,
          quantity: _quantity,
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product added to Next Shop!')),
        );
      }
    });
  }
  void _addComment() {
    setState(() {
      if (_commentController.text.isNotEmpty) {
        _comments.add(_commentController.text);
        _likes.add(false); // به صورت پیش‌فرض، کامنت لایک نمی‌شود
        _commentController.clear(); // پاک کردن فیلد بعد از ارسال کامنت
      }
    });
  }

  void _toggleCommentLike(int index) {
    setState(() {
      _likes[index] = !_likes[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final nextShopProvider = Provider.of<NextShopProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(widget.productId);
    final isInNextShop = nextShopProvider.isInNextShop(widget.productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(_productName),
        backgroundColor: Colors.pink[100],
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => _toggleFavorite(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(_productImage, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_productName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Price: \$${_price.toStringAsFixed(2)}'),
                  SizedBox(height: 8),
                  Text('Stock: $_stock units available'),
                  SizedBox(height: 8),
                  Text('Sold: $_sold items'),
                  SizedBox(height: 8),
                  Text('Product Overview'),
                  SizedBox(height: 8),
                  Text(_productDescription),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _addToCart(context),
                    child: Text('Add to Cart'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _toggleFavorite(context),
                    child: Text(isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _toggleNextShop(context),
                    child: Text(isInNextShop ? 'Remove from Next Shop' : 'Add to Next Shop'),
                  ),
                  SizedBox(height: 32),
                  // بخش ارسال کامنت
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _addComment,
                    child: Text('Post Comment'),
                  ),
                  SizedBox(height: 16),
                  // بخش نظرات
                  Text(
                    'Comments:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_comments[index]),
                        trailing: IconButton(
                          icon: Icon(
                            _likes[index] ? Icons.thumb_up : Icons.thumb_up_off_alt,
                            color: _likes[index] ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () => _toggleCommentLike(index),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
