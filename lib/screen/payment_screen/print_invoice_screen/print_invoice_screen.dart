import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_pdf_screen.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/print_invoice_controller.dart';
import 'package:supplier/model/orders_model.dart';
import 'package:supplier/utils/utils.dart';

class PrintInvoiceScreen extends StatelessWidget {
  const PrintInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PrintInvoiceController(),
        initState: (state) {
          Future.delayed(
            const Duration(microseconds: 300),
            () {
              final printInvoiceController = Get.find<PrintInvoiceController>();
              printInvoiceController.getOrderDetails();
            },
          );
        },
        builder: (PrintInvoiceController printInvoiceController) {
          return Scaffold(
            appBar: AppAppBar(title: 'Invoice'),
            body: ListView(
              children: [
                Container(
                  decoration: AppColorConstant.boxDecoration,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).copyWith(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColorConstant.appGrey.withOpacity(0.7),
                        ),
                        child: const AppText(
                          'Tax Invoice',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        'Sold By : ${printInvoiceController.ordersContent?.storeName ?? ''}',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                      AppText(
                                        '${printInvoiceController.ordersContent?.pickupAddress?.addressLine1 ?? ''}\nPhone No. ${printInvoiceController.ordersContent?.pickupAddress?.mobileNumber ?? ''}',
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const AppText(
                                            'Order Id: ',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                          AppText(
                                            printInvoiceController.ordersContent?.id ?? '',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const AppText(
                                            'Order Date: ',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                          AppText(
                                            DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(
                                                printInvoiceController.ordersContent?.orderCreatedDate ?? DateTime.now().toIso8601String(),
                                              ),
                                            ),
                                            fontSize: 10,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const AppText(
                                            'Invoice Date: ',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                          AppText(
                                            DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(
                                                printInvoiceController.ordersContent?.orderAssignedDate ?? DateTime.now().toIso8601String(),
                                              ),
                                            ),
                                            fontSize: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              color: AppColorConstant.appGrey,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const AppText(
                                        'Delivery to:',
                                        color: AppColorConstant.appGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                      AppText(
                                        printInvoiceController.ordersContent?.userName ?? '',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                      AppText(
                                        '${printInvoiceController.ordersContent?.deliveryAddress?.addressLine1 ?? ''}Contact - ${printInvoiceController.ordersContent?.deliveryAddress?.mobileNumber ?? ''}',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AppText(
                                        'Payment Method ',
                                        color: AppColorConstant.appGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                      AppText(
                                        printInvoiceController.ordersContent?.paymentMode ?? '',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                      const SizedBox(height: 5),
                                      const AppText(
                                        'Delivery Date and Type',
                                        color: AppColorConstant.appGrey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                      AppText(
                                        '${printInvoiceController.ordersContent?.orderDelivaryDate} \nInstant',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              margin: const EdgeInsets.only(top: 15),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColorConstant.appGrey.withOpacity(0.7),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: AppText(
                                      '\u20B9Product',
                                      fontSize: 12,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppText('Qty', fontSize: 12),
                                  ),
                                  Expanded(
                                    child: AppText('MRP  ', fontSize: 12),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: AppText('Discount',
                                        fontSize: 12, textAlign: TextAlign.center),
                                  ),
                                  Expanded(
                                    child: AppText('Total', fontSize: 12,),
                                  ),
                                ],
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: printInvoiceController.ordersContent?.items.length ?? 0,
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                              itemBuilder: (context, index) {
                                OrderItem? orderItem = printInvoiceController.ordersContent?.items[index];
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: AppText(
                                        orderItem?.productName ?? '',
                                        fontSize: 11,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(
                                      child: AppText(
                                        '${orderItem?.quantity ?? ''}',
                                        fontSize: 12,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(
                                      child: AppText(
                                        '₹${orderItem?.mrp ?? 0}',
                                        fontSize: 12,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: AppText(
                                        '₹ ${orderItem?.discountPrice ?? 0}',
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(
                                      child: AppText(
                                        '₹ ${orderItem?.totalPrice ?? 0}',
                                        fontSize: 12,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 12),
                            ),
                            Container(
                              height: 1,
                              color: AppColorConstant.appBlack,
                              margin: const EdgeInsets.only(bottom: 10),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  paymentDetailsView('Total', '₹ ${printInvoiceController.ordersContent?.orderTotalValue ?? 0}'),
                                  paymentDetailsView('Retailer’s Coupon Discount', '-₹ ${printInvoiceController.ordersContent?.couponInfo ?? ''}', fontWeight: FontWeight.w500),
                                  paymentDetailsView('Sub total', '-₹ ${printInvoiceController.ordersContent?.orderValue}'),
                                  paymentDetailsView('Delivery charges', '₹ ${printInvoiceController.ordersContent?.deliveryCharges ?? 0}'),
                                  paymentDetailsView('Service Charges (incl. GST)', '₹ ${printInvoiceController.ordersContent?.serviceCharges ?? 0}'),
                                  paymentDetailsView('Net Payable', '₹ ${printInvoiceController.ordersContent?.paidAmount ?? 0}', fontWeight: FontWeight.w500),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: AppElevatedButton(
                buttonName: 'Download',
                onPressed: () => createPdf(printInvoiceController),
                buttonRadius: 7,
                fontSize: 14,
                isIconShow: true,
                imageString: AppAsset.downloadIcon,
                borderColor: AppColorConstant.greyColor,
                buttonColor: AppColorConstant.appBluest,
                fontWeight: FontWeight.w500,
                isBorderShape: true,
                fontColor: AppColorConstant.greyColor,
              ),
            ),
          );
        });
  }

  paymentDetailsView(String title, String subTitle, {FontWeight fontWeight = FontWeight.w400}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppText(title,fontSize: 12, fontWeight: fontWeight),
        const SizedBox(width: 25),
        AppText(subTitle,fontSize: 12, fontWeight: fontWeight),
      ],
    );
  }

  Future<void> createPdf(PrintInvoiceController printInvoiceController) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Container(
        decoration: pw.BoxDecoration(
          color: PdfColor.fromHex('ffffff'),
          borderRadius: pw.BorderRadius.circular(5),
          border: pw.Border.all(),
          boxShadow: [
            pw.BoxShadow(
              color: PdfColor.fromHex('C4C4C4'),
              blurRadius: 4,
            ),
          ],
        ),
        margin: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10).copyWith(top: 20),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              height: 30,
              color: PdfColor.fromHex('C4C4C4'),
              alignment: pw.Alignment.center,
              child: pw.Text('Tax Invoice'),
            ),
            pw.Container(
              margin: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Sold By : ${printInvoiceController.ordersContent?.storeName ?? ''}',
                                style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex('000000'),
                                )),
                            pw.Text(
                              '${printInvoiceController.ordersContent?.pickupAddress?.addressLine1 ?? ''}\nPhone No. ${printInvoiceController.ordersContent?.pickupAddress?.mobileNumber ?? ''}',
                            ),
                          ],
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                pw.Text('Order Id: ',
                                    style: pw.TextStyle(
                                      fontSize: 17,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColor.fromHex('000000'),
                                    )),
                                pw.Text(
                                  printInvoiceController.ordersContent?.id ??
                                      '',
                                  style: pw.TextStyle(
                                    fontSize: 17,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColor.fromHex('000000'),
                                  ),
                                ),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Text('Order Date: ',
                                    style: pw.TextStyle(
                                      fontSize: 17,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColor.fromHex('000000'),
                                    )),
                                pw.Text(
                                  DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(
                                      printInvoiceController.ordersContent?.orderCreatedDate ?? DateTime.now().toIso8601String(),
                                    ),
                                  ),),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Text('Invoice Date: ',
                                    style: pw.TextStyle(
                                      fontSize: 17,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColor.fromHex('000000'),
                                    )),
                                pw.Text(
                                  DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(
                                      printInvoiceController.ordersContent?.orderAssignedDate ?? DateTime.now().toIso8601String(),
                                    ),
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    height: 1,
                    margin: const pw.EdgeInsets.symmetric(vertical: 10),
                  ),
                  pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 3,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Delivery to:'),
                            pw.Text(
                                printInvoiceController.ordersContent?.userName ?? '',
                                style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex('000000'),
                                )),
                            pw.Text(
                              '${printInvoiceController.ordersContent?.deliveryAddress?.addressLine1 ?? ''}Contact - ${printInvoiceController.ordersContent?.deliveryAddress?.mobileNumber ?? ''}',
                            ),
                          ],
                        ),
                      ),
                      pw.SizedBox(width: 15),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Payment Method '),
                            pw.Text(
                              printInvoiceController.ordersContent?.paymentMode ?? '',
                              style: pw.TextStyle(
                                fontSize: 17,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('000000'),
                              ),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text('Delivery Date and Type'),
                            pw.Text(
                              '${printInvoiceController.ordersContent?.orderDelivaryDate} \nInstant',
                              style: pw.TextStyle(
                                fontSize: 17,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('000000'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    height: 30,
                    margin: const pw.EdgeInsets.only(top: 15),
                    padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                    alignment: pw.Alignment.center,
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex('C4C4C4'),
                    ),
                    child: pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text('Product'),
                        ),
                        pw.Expanded(
                          child: pw.Text('Qty'),
                        ),
                        pw.Expanded(
                          child: pw.Text('MRP  '),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Text('Discount'),
                        ),
                        pw.Expanded(
                          child: pw.Text('Total'),
                        ),
                      ],
                    ),
                  ),
                  pw.ListView.builder(
                    itemCount: printInvoiceController.ordersContent?.items.length ?? 0,
                    padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    itemBuilder: (context, index) {
                      OrderItem? orderItem = printInvoiceController.ordersContent?.items[index];
                      return pw.Container(
                        margin: const pw.EdgeInsets.symmetric(vertical: 5),
                        height: 30,
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(orderItem?.productName ?? ''),
                            ),
                            pw.Expanded(
                              child: pw.Text(
                                '${orderItem?.quantity ?? ''}',
                              ),
                            ),
                            pw.Expanded(
                              child: pw.Text(
                                '\u20B9${orderItem?.mrp ?? 0}',
                                maxLines: 2,
                              ),
                            ),
                            pw.Expanded(
                              flex: 2,
                              child: pw.Text(
                                '\u20B9 ${orderItem?.discountPrice ?? 0}',
                                maxLines: 2,
                              ),
                            ),
                            pw.Expanded(
                              child: pw.Text(
                                '\u20B9 ${orderItem?.totalPrice ?? 0}',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  pw.Container(
                    height: 1,
                    margin: const pw.EdgeInsets.only(bottom: 10),
                    color: PdfColor.fromHex('000000'),
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Text('Total'),
                            pw.SizedBox(width: 25),
                            pw.Text('\u20B9 ${printInvoiceController.ordersContent?.orderTotalValue ?? 0}'),
                          ],
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Text(
                              'Retailer’s Coupon Discount',
                              style: pw.TextStyle(
                                fontSize: 17,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('000000'),
                              ),
                            ),
                            pw.SizedBox(width: 25),
                            pw.Text(
                              '-\u20B9 ${printInvoiceController.ordersContent?.couponInfo ?? ''}',
                              style: pw.TextStyle(
                                fontSize: 17,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('000000'),
                              ),
                            ),
                          ],
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Text('Delivery charges'),
                            pw.SizedBox(width: 25),
                            pw.Text('\u20B9 ${printInvoiceController.ordersContent?.deliveryCharges}'),
                          ],
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Text('Service Charges (incl. GST)'),
                            pw.SizedBox(width: 25),
                            pw.Text('\u20B9 ${printInvoiceController.ordersContent?.serviceCharges}'),
                          ],
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Text(
                              'Net Payable',
                              style: pw.TextStyle(
                                fontSize: 17,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('000000'),
                              ),
                            ),
                            pw.SizedBox(width: 25),
                            pw.Text(
                              '\u20B9 ${printInvoiceController.ordersContent?.paidAmount}',
                              style: pw.TextStyle(
                                fontSize: 17,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColor.fromHex('000000'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 15)
                ],
              ),
            ),
          ],
        ),
      ),
    ),);

    Directory? documentDirectory = await getExternalStorageDirectory();
    String documentPath = '${documentDirectory!.absolute.path}/bill';
    Directory billDirectory = await Directory(documentPath).create(recursive: true);
    String pdfFilePath = '${billDirectory.path}/Supplier.pdf';
    final file = File(pdfFilePath);
    await file.writeAsBytes(await pdf.save());
    logs('message --> $pdfFilePath');
    Get.to(()=> PdfUploadScreen(pdfPath: File(pdfFilePath)));
    // OpenFile.open(file.path);
  }
}
