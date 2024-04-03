class ProductModel {
  final String id, title, imgUrl, productCategory;
  final double price, salePrice;
  final bool isOnSale, isPiece;

  ProductModel(
      {required this.id,
      required this.title,
      required this.imgUrl,
      required this.productCategory,
      required this.price,
      required this.salePrice,
      required this.isOnSale,
      required this.isPiece});
}
