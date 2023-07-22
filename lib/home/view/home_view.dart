import 'package:expense_tracker/home/model/home_model.dart';
import 'package:expense_tracker/new_transaction/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            forceMaterialTransparency: true,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NewTransaction(),
                    ),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 5, 98, 164),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NewTransaction(),
                ),
              );
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
          body: Padding(
            padding:
                EdgeInsets.only(left: w * 0.1, right: w * 0.1, top: h * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Balance",
                  style: GoogleFonts.poppins(
                    fontSize: h * 0.017,
                  ),
                ),
                Text(
                  "\$ ${homeController.currentBalance}",
                  style: GoogleFonts.poppins(
                    fontSize: h * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  height: h * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 5, 98, 164),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.02, top: h * 0.035),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Income",
                                style: GoogleFonts.poppins(
                                  fontSize: h * 0.017,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "\$ 3,500.00",
                                style: GoogleFonts.poppins(
                                  fontSize: h * 0.03,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          width: w * 0.01,
                          endIndent: h * 0.04,
                          indent: h * 0.04,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: w * 0.02, top: h * 0.035),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expense",
                                style: GoogleFonts.poppins(
                                  fontSize: h * 0.017,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "\$ 1,000.00",
                                style: GoogleFonts.poppins(
                                  fontSize: h * 0.03,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Expenses",
                      style: GoogleFonts.poppins(
                        fontSize: h * 0.018,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.zero),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text("View All",
                          style: GoogleFonts.poppins(
                              fontSize: h * 0.015, color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: homeController.listOfTransactions.length,
                    itemBuilder: (context, index) {
                      List<HomeModel> transactions =
                          homeController.listOfTransactions.reversed.toList();
                      return ListTile(
                        leading: Container(
                          height: h * 0.05,
                          width: h * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          transactions[index].category,
                          style: GoogleFonts.poppins(
                            fontSize: h * 0.018,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: GoogleFonts.poppins(
                            fontSize: h * 0.015,
                          ),
                        ),
                        trailing: Text(
                          "\$ ${transactions[index].value}",
                          style: GoogleFonts.poppins(
                              fontSize: h * 0.018, fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
