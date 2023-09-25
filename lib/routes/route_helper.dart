import 'package:get/get.dart';
import 'package:supplier/routes/route_constant.dart';
import 'package:supplier/screen/dashboard_module/dashboard_screen.dart';
import 'package:supplier/screen/dashboard_module/masters_screen/add_item_screen/add_item_screen.dart';
import 'package:supplier/screen/dashboard_module/notification_screen/no_internet_screen.dart';
import 'package:supplier/screen/dashboard_module/profile_screen/edit_profile_screen.dart';
import 'package:supplier/screen/inventory_screen/inventory_screen.dart';
import 'package:supplier/screen/invoice_screen/invoice_details_screen.dart';
import 'package:supplier/screen/login_screen/login_screen.dart';
import 'package:supplier/screen/new_orders_screen/orders_screen/orders_screen.dart';
import 'package:supplier/screen/new_orders_screen/review_order_screen/review_order_screen.dart';
import 'package:supplier/screen/otp_verification_screen/mobile_verification_screen.dart';
import 'package:supplier/screen/otp_verification_screen/otp_verification_screen.dart';
import 'package:supplier/screen/otp_verification_screen/pending_verification_screen.dart';
import 'package:supplier/screen/otp_verification_screen/verified_application_screen.dart';
import 'package:supplier/screen/payment_screen/payment_details_screen/payment_details_screen.dart';
import 'package:supplier/screen/payment_screen/print_invoice_screen/print_invoice_screen.dart';
import 'package:supplier/screen/signup_screen/signup_screen.dart';
import 'package:supplier/screen/splash_screen/splash_screen.dart';

import '../screen/invoice_screen/add_new_invoice_screen/add_new_invoice_screen.dart';
import '../screen/retailers_screen/retailers_details_screen/retailers_details_view.dart';

class RouteHelper {
  static String getInitialRoute() => RouteConstant.initial;

  static String getNoInternetRoute() => RouteConstant.initial;

  static String getLoginRoute() => RouteConstant.login;

  static String getMobileVerificationRoute() => RouteConstant.mobileVerification;

  static String getOtpVerificationRoute() => RouteConstant.otpVerification;

  static String getSignUpRoute() => RouteConstant.signUp;

  static String getPendingVerificationRoute() => RouteConstant.pendingVerification;

  static String getVerifiedApplicationRoute() => RouteConstant.verifiedApplication;

  static String getDashboardRoute() => RouteConstant.dashboard;

  static String getEditProfileRoute() => RouteConstant.editProfile;

  static String getPaymentDetailsRoute() => RouteConstant.paymentDetails;

  static String getPrintInvoiceRoute() => RouteConstant.printInvoice;

  static String getInventoryRoute() => RouteConstant.inventoryScreen;

  static String getAddItemRoute() => RouteConstant.addItemScreen;

  static String getRetailerDetailsRoute() => RouteConstant.retailersDetails;

  static String getAddNewInVoiceRoute() => RouteConstant.addNewInVoiceScreen;

  static String getInvoiceDetailsRoute() => RouteConstant.invoiceDetailsScreen;

  static String getManageOrdersRoute() => RouteConstant.manageOrderScreen;

  static String getReviewOrderRoute() => RouteConstant.reviewOrderScreen;

  static List<GetPage> routes = [
    GetPage(name: RouteConstant.initial, page: () => const SplashScreen()),
    GetPage(name: RouteConstant.noInternet, page: () => const NoInternetScreen()),
    GetPage(name: RouteConstant.login, page: () => const LogInScreen()),
    GetPage(name: RouteConstant.mobileVerification, page: () => const MobileVerificationScreen()),
    GetPage(name: RouteConstant.otpVerification, page: () => const OtpVerificationScreen()),
    GetPage(name: RouteConstant.signUp, page: () => const SignUpScreen()),
    GetPage(name: RouteConstant.pendingVerification, page: () => const PendingVerificationScreen()),
    GetPage(name: RouteConstant.verifiedApplication, page: () => const VerifiedApplicationScreen()),
    GetPage(name: RouteConstant.dashboard, page: () => const DashboardScreen()),
    GetPage(name: RouteConstant.editProfile, page: () => const EditProfileScreen()),
    GetPage(name: RouteConstant.paymentDetails, page: () => const PaymentDetailsScreen()),
    GetPage(name: RouteConstant.printInvoice, page: () => const PrintInvoiceScreen()),
    GetPage(name: RouteConstant.inventoryScreen, page: () => const InventoryScreen()),
    GetPage(name: RouteConstant.addItemScreen, page: () => const AddItemScreen()),
    GetPage(name: RouteConstant.retailersDetails, page: () => const RetailersDetailsView()),
    GetPage(name: RouteConstant.addNewInVoiceScreen, page: () => const AddNewInVoiceScreen()),
    GetPage(name: RouteConstant.invoiceDetailsScreen, page: () => const InVoiceDetailsScreen()),
    GetPage(name: RouteConstant.manageOrderScreen, page: () => const ManageOrdersScreen()),
    GetPage(name: RouteConstant.reviewOrderScreen, page: () => const ReviewOrderScreen()),
  ];
}
