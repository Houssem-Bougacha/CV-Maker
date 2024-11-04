// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../data/util.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final pdf = pw.Document();
  final image = pw.MemoryImage(
    MyUtil.myImgPic!.readAsBytesSync(),
  );

  @override
  void initState() {
    super.initState();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Container(
            height: 850,
            width: double.infinity,
            color: PdfColors.white, // UI Container Color
            child: pw.Column(
              children: [
                pw.Container(
                  height: 170,
                  padding: pw.EdgeInsets.all(10),
                  color: PdfColor.fromInt(0xfff3f2f2), // UI Container Color
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Align(
                        alignment: pw.Alignment(0, 0),
                        child: pw.Container(
                          height: 75,
                          width: 80,
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(10)),
                          child: (MyUtil.myImgPic != null)
                              ? pw.Image(
                                  image,
                                  fit: pw.BoxFit.cover,
                                  // height: 80,
                                )
                              : pw.Image('img/pic.png' as pw.ImageProvider,
                                  fit: pw.BoxFit.cover, height: 80),
                        ),
                      ),
                      pw.SizedBox(
                        width: 40,
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            MyUtil.myName ??
                                '', // ignore: dead_null_aware_expression
                            style: pw.TextStyle(
                              fontSize: 25,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.black, // UI Text Color
                            ),
                          ),
                          pw.SizedBox(height: 20),
                          pw.Text(
                            MyUtil.myCurrentDesignation,
                            style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors
                                  .black, // You can set your own text color
                            ),
                          ),
                          pw.SizedBox(height: 15),
                          pw.Container(
                            height: 1,
                            width: 150,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                width: 1,
                                color: PdfColors.white, // UI Text Color
                              ),
                            ),
                          ),
                          pw.SizedBox(height: 15),
                          pw.Text(
                            ' ${MyUtil.myEmail}',
                            style: pw.TextStyle(fontSize: 10),
                          ),
                          pw.SizedBox(height: 15),
                          pw.Text(
                            '${MyUtil.myAdd1} ',
                            style: pw.TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        height: 550,
                        width: 180,
                        child: pw.Expanded(
                          flex: 6,
                          child: pw.Container(
                            padding: pw.EdgeInsets.all(9),
                            // height: 650,
                            decoration: pw.BoxDecoration(
                              color: PdfColors.white, // UI Container Color
                            ),
                            child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(height: 20),
                                pw.Text(
                                  'Personal Details',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 15,
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Tel : ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    pw.Text(
                                      MyUtil.myPhone,
                                      style: pw.TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Birth : ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    pw.Text(MyUtil.myDob),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Marital Status : ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    pw.Text(
                                      MyUtil.myMaritalStatus,
                                      style: pw.TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Nationality : ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    pw.Text(MyUtil.myNationality),
                                  ],
                                ),
                                pw.SizedBox(height: 20),
                                pw.Text(
                                  'Languages Known',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 15,
                                ),
                                ...MyUtil.myLangKnown.map((e) {
                                  if (e['isSelect'] == true) {
                                    return pw.Text(' ${e['langName']}');
                                  } else {
                                    return pw.Container();
                                  }
                                }),
                                pw.SizedBox(height: 20),
                                pw.Text(
                                  'Education',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.Text('Degree/Course : ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.Text(MyUtil.myCourseDegree),
                                pw.Text('College : ',
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.Text(MyUtil.mySchoolColIns),

                                pw.Row(
                                  children: [
                                    pw.Text('Passing Year : ',
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            fontSize: 10)),
                                    pw.Text(MyUtil.myPassingYear),
                                  ],
                                ),
                                pw.SizedBox(
                                  height: 25,
                                ),
                                pw.Text(
                                  'Skills',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 15,
                                ),
                                ...MyUtil.mySkills.map((e) {
                                  return (e.text != null)
                                      ? pw.Text(e.text)
                                      : pw.Container();
                                }),
                                pw.SizedBox(
                                  height: 15,
                                ),
                                pw.Text(
                                  'Achievements',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 15,
                                ),
                                ...MyUtil.myAchievements.map((e) {
                                  return (e.text != null)
                                      ? pw.Text(e.text)
                                      : pw.Container();
                                }),
                                pw.SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      pw.Container(
                        height: 550,
                        width: 295,
                        child: pw.Expanded(
                          flex: 10,
                          child: pw.Container(
                            padding: pw.EdgeInsets.all(10),
                            decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.only(
                                  bottomRight: pw.Radius.circular(10)),
                              color: PdfColor.fromInt(0xFFF0F0E6), // UI Container Color
                            ),
                            child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceAround,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  'Carrier Objective',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.Text(MyUtil.myCareerObj),
                                pw.Text(
                                  'Work Experience',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.Row(
                                  children: [
                                    pw.Text(
                                      'Starting : ',
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    pw.Text(MyUtil.myJoinDate),
                                    pw.SizedBox(
                                      width: 15,
                                    ),
                                    if (MyUtil.myEmployedStatus != true)
                                      pw.Row(
                                        children: [
                                          pw.Text(
                                            'Ending : ',
                                            style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          ),
                                          pw.Text(MyUtil.myExitDate),
                                        ],
                                      )
                                    else
                                      pw.Container(),
                                  ],
                                ),
                                (MyUtil.myEmployedStatus == true)
                                    ? pw.Text(
                                        'Currently',
                                        style: pw.TextStyle(
                                          fontSize: 11,
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors
                                              .blueAccent, // UI Text Color
                                        ),
                                      )
                                    : pw.Container(),
                                pw.Text(
                                  MyUtil.myComName,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Text(
                                  MyUtil.mySCI,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Text(MyUtil.myRoles),
                                pw.Text(
                                  'Projects',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.Text(
                                  'Project Title : ',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  MyUtil.myProTitle,
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                                pw.Text(
                                  'Technologies : ',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                ...MyUtil.myTechnologiesList.map((e) {
                                  return pw.Text(
                                    e['langName'],
                                    style: pw.TextStyle(fontSize: 10),
                                  );
                                }),
                                pw.Text(
                                  'Roles : ',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.Text(
                                  MyUtil.myProRoles,
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                                pw.Text(
                                  'Project Desc : ',
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.blueAccent, // UI Text Color
                                  ),
                                ),
                                pw.Text(
                                  MyUtil.myProDesc,
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            onPressed: () async {
              Printing.layoutPdf(onLayout: (format) {
                return pdf.save();
              });
            },
            child: const Icon(Icons.print),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: 850,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // User pic,name,email
                Container(
                  height: 170,
                  padding: EdgeInsets.all(10),
                  color: Color(0xFFF5F5F5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Pic
                      Align(
                        alignment: Alignment(0, 0),
                        child: SizedBox(
                          height: 280,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              (MyUtil.myImgPic != null)
                                  ? CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                          FileImage(MyUtil.myImgPic!),
                                    )
                                  : CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.lightGreenAccent,
                                      backgroundImage:
                                          AssetImage('img/pic2.png')),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      // User Name & Email
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MyUtil.myName ??
                                '', // ignore: dead_null_aware_expression
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            MyUtil.myCurrentDesignation,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 1,
                            width: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            ' ${MyUtil.myEmail}',
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${MyUtil.myAdd1} ',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side Bar .......................................
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: EdgeInsets.all(9),
                        height: 650,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            // Language
                            Text(
                              'Personal Details',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tel : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(
                                  MyUtil.myPhone,
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Birth : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(MyUtil.myDob),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Marital Status : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(
                                  MyUtil.myMaritalStatus,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Nationality : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(MyUtil.myNationality),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Language
                            Text(
                              'Languages Known',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ...MyUtil.myLangKnown.map((e) {
                              if (e['isSelect'] == true) {
                                return Text(' ${e['langName']}');
                              } else {
                                return Container();
                              }
                            }),
                            SizedBox(height: 10),
                            // Education : ...........
                            Text('Education',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                            Text('Degree/Course : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10)),
                            Text(MyUtil.myCourseDegree),
                            Text('College : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10)),
                            Text(MyUtil.mySchoolColIns),

                            Row(
                              children: [
                                Text('Passing Year : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10)),
                                Text(MyUtil.myPassingYear),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Skills....
                            Text(
                              'Skills',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ...MyUtil.mySkills.map((e) {
                              return (e.text != null)
                                  ? Text(e.text)
                                  : Container();
                            }),
                            // Text('1. C'),
                            // Text('2. C++'),
                            // Text('3. Java'),
                            // Text('4. PHP'),
                            // Text('5. Python'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Achievements',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ...MyUtil.myAchievements.map((e) {
                              return (e.text != null)
                                  ? Text(e.text)
                                  : Container();
                            }),
                            // Text('1. C Certificate'),
                            // Text('2. C++ Certificate'),
                            // Text('3. Java Certificate'),
                            // Text('4. PHP Certificate'),
                            // Text('5. Python Certificate'),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right Side Bar .......................................
                    Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 650,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10)),
                          color: Color(0xFFF0F0E6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Carrier Objective.................
                            Text(
                              'Carrier Objective',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Text(MyUtil.myCareerObj),
                            // 'Historically, surnames evolved as a way to sort people into groups - by occupation, place of origin, clan affiliation, patronage, parentage, adoption, and even physical characteristics (like red hair). Many of the modern surnames in the dictionary can be traced back to Britain and Ireland.'),
                            SizedBox(height: 10),
                            // Experience .........................
                            Text(
                              'Work Experience',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Starting : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(MyUtil.myJoinDate),
                                SizedBox(
                                  width: 5,
                                ),
                                if (MyUtil.myEmployedStatus != true)
                                  Row(
                                    children: [
                                      Text(
                                        'Ending : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                      Text(MyUtil.myExitDate),
                                    ],
                                  )
                                else
                                  Container(),
                              ],
                            ),
                            // Currently ..................
                            (MyUtil.myEmployedStatus == true)
                                ? Text(
                                    'Currently',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )
                                : Container(),
                            Text(
                              MyUtil.myComName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              MyUtil.mySCI,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(MyUtil.myRoles),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Projects',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              'Project Title : ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              MyUtil.myProTitle,
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              'Technologies : ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ...MyUtil.myTechnologiesList.map((e) {
                              return Text(
                                e['langName'],
                                style: TextStyle(fontSize: 10),
                              );
                            }),
                            Text(
                              'Roles : ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              MyUtil.myProRoles,
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              'Project Desc : ',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              MyUtil.myProDesc,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
