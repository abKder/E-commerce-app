import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/forgot_password/forget_password.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onBoarding/onboarding.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/edit_profile/edit_profile.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AAppRoutes{
  static final screens = [
    GetPage(name: ARoutes.home, page: () => const NavigationMenu()),
    GetPage(name: ARoutes.store, page: () => const StoreScreen(),),
    GetPage(name: ARoutes.wishlist, page: () => const WishlistScreen(),),
    GetPage(name: ARoutes.profile, page: () => const ProfileScreen(),),
    GetPage(name: ARoutes.order, page: () => const OrderScreen(),),
    GetPage(name: ARoutes.checkout, page: () => const CheckoutScreen(),),
    GetPage(name: ARoutes.cart, page: () => const CartScreen(),),
    GetPage(name: ARoutes.editProfile, page: () => const EditProfileScreen(),),
    GetPage(name: ARoutes.userAddress, page: () => const AddressScreen(),),
    GetPage(name: ARoutes.signup, page: () => const SignupScreen(),),
    GetPage(name: ARoutes.verifyEmail, page: () => const VerifyEmailScreen(),),
    GetPage(name: ARoutes.signIn, page: () => const LoginScreen(),),
    GetPage(name: ARoutes.forgetPassword, page: () => const ForgetPasswordScreen(),),
    GetPage(name: ARoutes.onBoarding, page: () => const OnBoardingScreen(),),
  ];
}