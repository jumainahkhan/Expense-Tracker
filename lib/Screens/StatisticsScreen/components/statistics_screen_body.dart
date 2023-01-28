import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hexcolor/hexcolor.dart';

class StatisticsScreenBody extends StatefulWidget {
  const StatisticsScreenBody({super.key});

  @override
  State<StatisticsScreenBody> createState() => _StatisticsScreenBodyState();
}

final List<String> expenseItems = [
  'Income',
  'Saving',
  'Investment',
  'Debt',
];

String? selectedValue;

class _StatisticsScreenBodyState extends State<StatisticsScreenBody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(
                      'Statistics',
                      style: GoogleFonts.lato(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      width: 99,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const HeroIcon(
                          HeroIcons.arrowDownOnSquare,
                          size: 28,
                        )),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    padding: const EdgeInsets.all(15),
                    controller: tabController,
                    unselectedLabelColor: HexColor('#bebebe'),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#568986'),
                    ),
                    tabs: [
                      Tab(
                        height: 40,
                        child: Text(
                          'Day',
                          style: GoogleFonts.lato(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Tab(
                        height: 40,
                        child: Text(
                          'Week',
                          style: GoogleFonts.lato(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Tab(
                        height: 40,
                        child: Text(
                          'Month',
                          style: GoogleFonts.lato(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Tab(
                        height: 40,
                        child: Text(
                          'Year',
                          style: GoogleFonts.lato(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomDropdownButton2(
                        buttonPadding: const EdgeInsets.all(11),
                        buttonWidth: 110,
                        buttonHeight: 40,
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[600],
                          size: 20,
                        ),
                        hint: 'Expense',
                        dropdownItems: expenseItems,
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                // TODO add the chart here
                const SizedBox(
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Top Spending",
                          style: GoogleFonts.lato(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    const Icon(Icons.swap_vert)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
