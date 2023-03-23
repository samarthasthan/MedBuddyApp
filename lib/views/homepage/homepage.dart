import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medbuddyapp/constants.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Stack(children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight / 2,
              child: Column(
                children: const [
                  Header(),
                  SearchBar(),
                  ThreeBoxes(),
                  Card(),
                ],
              ),
            );
          },
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.56,
          minChildSize: 0.56,
          builder: ((context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        controller: scrollController,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 20.h,
                              width: double.infinity,
                              color: Colors.red,
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ]),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 16.h),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 92.h,
          child: Column(children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 11.w, right: 3.w),
                          child: SvgPicture.asset("assets/icons/medicine.svg"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Buy medicines and Rent Equipments",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Text(
                              "Superfast delivery                               ",
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Container(
                height: 23.h,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [gradientColor1, gradientColor2],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 39.w),
                  child: Text(
                    "Get 100% original medicines.",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}

class ThreeBoxes extends StatelessWidget {
  const ThreeBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SingleBox(
          imagePath: "assets/images/machine.svg",
          primaryText: 'Lab Tests',
          secondoryText: 'and reports',
        ),
        SingleBox(
          imagePath: "assets/images/doctor.svg",
          primaryText: 'Consult',
          secondoryText: 'Video call',
        ),
        SingleBox(
          imagePath: "assets/images/home.svg",
          primaryText: 'Doctor',
          secondoryText: 'Checkup at home',
        ),
      ],
    );
  }
}

class SingleBox extends StatelessWidget {
  SingleBox(
      {super.key,
      required this.imagePath,
      required this.primaryText,
      required this.secondoryText});

  String imagePath, primaryText, secondoryText;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [gradientColor1, gradientColor2],
            ),
            borderRadius: BorderRadius.circular(8)),
        height: 99.h,
        width: 108.w,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 13.w, top: 14.81.h, right: 55.2.w, bottom: 40.57.h),
              child: SvgPicture.asset(
                imagePath,
                height: 43.62,
                width: 39.48,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 11.w, top: 58.h, right: 28.w, bottom: 26.h),
              child: Text(
                primaryText,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 11.w, top: 76.h, right: 27.w, bottom: 8.h),
              child: Text(
                secondoryText,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.w, left: 21.w),
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                height: 27.5,
                width: 48,
              ),
            ),
            Text(
              "Hi UserName!",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 2.w,
            ),
            Icon(
              PhosphorIcons.caretDown,
              size: 20.0.sp,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.w),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Icon(
                  PhosphorIcons.personSimpleWalk,
                  size: 26.0.sp,
                  color: primaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Icon(
                  PhosphorIcons.microphoneFill,
                  size: 26.0.sp,
                  color: primaryColor,
                ),
              ),
              Icon(
                PhosphorIcons.scanFill,
                size: 26.0.sp,
                color: primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.sp),
      child: SizedBox(
        height: 35.h,
        child: TextField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(30.0.sp),
              ),
              hintText: "Doctors, services, medicines...",
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 188, 184, 184)),
              filled: true,
              prefixIcon: Icon(
                PhosphorIcons.magnifyingGlass,
                size: 20.0.sp,
                color: const Color.fromARGB(255, 147, 147, 147),
              )),
        ),
      ),
    );
  }
}
