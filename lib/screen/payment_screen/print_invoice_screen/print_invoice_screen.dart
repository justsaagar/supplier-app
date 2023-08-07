import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/print_invoice_controller.dart';

class PrintInvoiceScreen extends StatelessWidget {
  const PrintInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PrintInvoiceController(),
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
                          color: AppColorConstant.appBlack,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        'Sold By : XYZ General Store',
                                        color: AppColorConstant.appBlack,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                      AppText(
                                        'Shop 1&2, CGO Complex,\nKavadiguda, Hyderabad\n500080\nPhone No. 0000000000',
                                        color: AppColorConstant.appBlack,
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
                                          AppText('Order Id: ',
                                              color: AppColorConstant.appBlack,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                          AppText('253658',
                                              color: AppColorConstant.appBlack,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          AppText('Order Date: ',
                                              color: AppColorConstant.appBlack,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                          AppText('11-02-2022', color: AppColorConstant.appBlack, fontSize: 10),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          AppText('Invoice Date: ',
                                              color: AppColorConstant.appBlack,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                          AppText('11-02-2022', color: AppColorConstant.appBlack, fontSize: 10),
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
                            const Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText('Delivery to:',
                                          color: AppColorConstant.appGrey, fontWeight: FontWeight.w500, fontSize: 10),
                                      AppText('S. Srinivas',
                                          color: AppColorConstant.appBlack, fontWeight: FontWeight.w600, fontSize: 10),
                                      AppText(
                                          'Flat no.- 307, JyothiGiri Mansion,Opp. Military Ground,West Maredpally, Hyderabad,Telangana 500026Contact - 0000000000',
                                          color: AppColorConstant.appBlack,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText('Payment Method ',
                                          color: AppColorConstant.appGrey, fontWeight: FontWeight.w500, fontSize: 10),
                                      AppText('BHIM UPI',
                                          color: AppColorConstant.appBlack, fontWeight: FontWeight.w600, fontSize: 10),
                                      SizedBox(height: 5),
                                      AppText('Delivery Date and Type',
                                          color: AppColorConstant.appGrey, fontWeight: FontWeight.w500, fontSize: 10),
                                      AppText('11 February 2022 \nInstant',
                                          color: AppColorConstant.appBlack, fontWeight: FontWeight.w600, fontSize: 10),
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
                                    child: AppText('\u20B9Product', fontSize: 12, color: AppColorConstant.appBlack),
                                  ),
                                  Expanded(
                                    child: AppText('Qty', fontSize: 12, color: AppColorConstant.appBlack),
                                  ),
                                  Expanded(
                                    child: AppText('MRP  ', fontSize: 12, color: AppColorConstant.appBlack),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: AppText('Discount',
                                        fontSize: 12, textAlign: TextAlign.center, color: AppColorConstant.appBlack),
                                  ),
                                  Expanded(
                                    child: AppText('Total', fontSize: 12, color: AppColorConstant.appBlack),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 30,
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: AppText(
                                        'India Gate Basmati Rice',
                                        fontSize: 11,
                                        color: AppColorConstant.appBlack,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(
                                      child:
                                          AppText('11kg', fontSize: 12, color: AppColorConstant.appBlack, maxLines: 2),
                                    ),
                                    Expanded(
                                      child: AppText(
                                        '₹10000',
                                        fontSize: 12,
                                        color: AppColorConstant.appBlack,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: AppText(
                                        '₹ 2',
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                        color: AppColorConstant.appBlack,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Expanded(
                                      child: AppText(
                                        '₹ 98',
                                        fontSize: 12,
                                        color: AppColorConstant.appBlack,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                  paymentDetailsView('Total', '₹ 285'),
                                  paymentDetailsView('Retailer’s Coupon Discount', '-₹ 27',
                                      fontWeight: FontWeight.w500),
                                  paymentDetailsView('Sub total', '-₹ 27'),
                                  paymentDetailsView('Delivery charges', '₹ 285'),
                                  paymentDetailsView('Service Charges (incl. GST)', '₹ 285'),
                                  paymentDetailsView('Net Payable', '₹ 285', fontWeight: FontWeight.w500),
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
                onPressed: () => createPdf(),
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
        AppText(title, color: AppColorConstant.appBlack, fontSize: 12, fontWeight: fontWeight),
        const SizedBox(width: 25),
        AppText(subTitle, color: AppColorConstant.appBlack, fontSize: 12, fontWeight: fontWeight),
      ],
    );
  }

  Future<void> createPdf() async {
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
                            pw.Text('Sold By : XYZ General Store',
                                style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex('000000'),
                                )),
                            pw.Text(
                              'Shop 1&2, CGO Complex,\nKavadiguda, Hyderabad\n500080\nPhone No. 0000000000',
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
                                pw.Text('253658',
                                    style: pw.TextStyle(
                                      fontSize: 17,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColor.fromHex('000000'),
                                    )),
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
                                pw.Text('11-02-2022'),
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
                                pw.Text('11-02-2022'),
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
                            pw.Text('S. Srinivas',
                                style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex('000000'),
                                )),
                            pw.Text(
                              'Flat no.- 307, JyothiGiri Mansion,Opp. Military Ground,West Maredpally, Hyderabad,Telangana 500026Contact - 0000000000',
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
                            pw.Text('BHIM UPI',
                                style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex('000000'),
                                )),
                            pw.SizedBox(height: 5),
                            pw.Text('Delivery Date and Type'),
                            pw.Text('11 February 2022 \nInstant',
                                style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColor.fromHex('000000'),
                                )),
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
                    itemCount: 4,
                    padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    itemBuilder: (context, index) => pw.Container(
                      margin: const pw.EdgeInsets.symmetric(vertical: 5),
                      height: 30,
                      child: pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text('India Gate Basmati Rice'),
                          ),
                          pw.Expanded(
                            child: pw.Text('11kg'),
                          ),
                          pw.Expanded(
                            child: pw.Text(
                              '\u20B910000',
                              maxLines: 2,
                            ),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                              '\u20B9 2',
                              maxLines: 2,
                            ),
                          ),
                          pw.Expanded(
                            child: pw.Text(
                              '\u20B9 98',
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            pw.Text('\u20B9 285'),
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
                              '-\u20B9 27',
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
                            pw.Text('\u20B9 285'),
                          ],
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Text('Service Charges (incl. GST)'),
                            pw.SizedBox(width: 25),
                            pw.Text('\u20B9 285'),
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
                              '\u20B9 285',
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
    ));

    Directory? documentDirectory = await getExternalStorageDirectory();
    String documentPath = '${documentDirectory!.absolute.path}/bill';
    Directory billDirectory = await Directory(documentPath).create(recursive: true);
    final file = File('${billDirectory.path}/Supplier.pdf');
    await file.writeAsBytes(await pdf.save());
    OpenFile.open(file.path);
  }
}
