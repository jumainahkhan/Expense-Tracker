import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expense_tracker/home/controller/home_controller.dart';
import 'package:expense_tracker/home/model/home_model.dart';
import 'package:expense_tracker/new_transaction/controller/new_transaction_controller.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    final HomeController homeController = Provider.of<HomeController>(context);
    return Consumer<NewTransactionController>(
        builder: (context, newTransactionController, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 5, 98, 164),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 5, 98, 164),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(w * 0.1),
                  topRight: Radius.circular(w * 0.1),
                )),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.02),
                  Center(
                    child: Text(
                      "New Expenses",
                      style: GoogleFonts.poppins(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.17),
                  TextField(
                    controller: newTransactionController.amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      helperText: "Type here",
                      helperStyle: GoogleFonts.poppins(
                        fontSize: h * 0.015,
                        fontWeight: FontWeight.w500,
                      ),
                      labelText: "\$",
                      labelStyle: GoogleFonts.poppins(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.05),
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(
                              width: w * 0.03,
                            ),
                            const Icon(
                              Icons.add_box_outlined,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: w * 0.05,
                            ),
                            Expanded(
                              child: Text(
                                'Choose a category',
                                style: GoogleFonts.poppins(
                                  fontSize: h * 0.018,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: newTransactionController.categoryTypes
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value:
                            newTransactionController.selectedCategory.isNotEmpty
                                ? newTransactionController.selectedCategory
                                : null,
                        onChanged: (value) {
                          newTransactionController.setSelectedCategory(value!);
                        },
                        buttonStyleData: ButtonStyleData(
                          height: h * 0.08,
                          width: w * 0.8,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.grey[200],
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.grey[200],
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.05),
                  GestureDetector(
                    onTap: () {
                      HomeModel expenseData =
                          newTransactionController.onContinueClicked();
                      homeController.addTransaction(expenseData);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: h * 0.08,
                      width: w * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}
