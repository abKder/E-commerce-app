import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxDouble shippingCost = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble grandTotal = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final productController = ProductController.instance;

  @override
  void onInit() {
    loadCartItems();
    super.onInit();
  }

  // Add Item to Cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      ASnackBarHelpers.customToast(message: 'Select Quantity');
      return;
    }

    if (product.stock < 1) {
      ASnackBarHelpers.warningSnackBar(
          title: 'Oh Snap!', message: 'Selected Product is out of stock.');
      return;
    }

    // Convert ProductModel to CartItemModel with the current quantity
    final selectedCartItem =
        convertProductToCartItem(product, productQuantityInCart.value);

    // Check if valid
    // (Here we skip variation checking as it wasn't strictly requested and might complicate things,
    // but in a real app check variationId)

    // Check if already added in cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // Already in cart, update quantity
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
      ASnackBarHelpers.customToast(
          message: 'Your product has been added to the Cart.');
      Get.to(() => const CartScreen());
    }

    updateCart();
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
      ASnackBarHelpers.customToast(
          message: 'Your product has been added to the Cart.');
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show dialog or just remove? usually show dialog
        cartItems[index].quantity == 1
            ? removeFromCartDialog(cartItems[index])
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(CartItemModel item) {
    Get.defaultDialog(
        title: 'Remove Product',
        middleText: 'Are you sure you want to remove this product?',
        onConfirm: () {
          cartItems.remove(item);
          updateCart();
          ASnackBarHelpers.customToast(
              message: 'Product removed from the Cart.');
          Get.back();
        },
        onCancel: () => () => Get.back());
  }

  // Initialize already added item's count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    // If product has no variations then calculate cart entries and display total number.
    // For now we assume simple products or handle variations simply.
    // We check matches by productId.

    productQuantityInCart.value = 0; // reset default

    var cartItem = cartItems.firstWhere((item) => item.productId == product.id,
        orElse: () => CartItemModel.empty());

    if (cartItem.productId.isNotEmpty) {
      productQuantityInCart.value = cartItem.quantity;
    }
  }

  // Convert ProductModel to CartItemModel
  CartItemModel convertProductToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: product.salePrice > 0 ? product.salePrice : product.price,
      quantity: quantity,
      variationId: '', // Default for now
      image: product.thumbnail,
      brandName: product.brand?.name,
    );
  }

  // Clear Cart
  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  // Update Cart Values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;

    // Calculate Billing
    shippingCost.value = 10.0;
    taxAmount.value = totalCartPrice.value * 0.10;
    grandTotal.value =
        totalCartPrice.value + shippingCost.value + taxAmount.value;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    GetStorage().write('CartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = GetStorage().read<List<dynamic>>('CartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.firstWhere(
        (item) => item.productId == productId,
        orElse: () => CartItemModel.empty());
    return foundItem.productId.isNotEmpty ? foundItem.quantity : 0;
  }
}
