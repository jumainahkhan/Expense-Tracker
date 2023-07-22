import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
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
              onPressed: () {},
            ),
          ],
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
                "\$ 2,500.00",
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: h * 0.05,
                        width: h * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 5, 98, 164),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Shopping",
                        style: GoogleFonts.poppins(
                          fontSize: h * 0.018,
                        ),
                      ),
                      subtitle: Text(
                        "Shopping at Walmart",
                        style: GoogleFonts.poppins(
                          fontSize: h * 0.015,
                        ),
                      ),
                      trailing: Text(
                        "\$ 500",
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
  }
}
