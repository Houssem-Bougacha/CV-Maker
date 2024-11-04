import 'dart:io';
import 'package:flutter/material.dart';

class MyUtil {
  static String myName = '';
  static String myEmail = '';
  static String myPhone = '';
  static String myAdd1 = '';
  static File? myImgPic;

  static String myCareerObj = '';
  static String myCurrentDesignation = '';
  static String myDob = '';
  static String myMaritalStatus = 'Single';
  static String myNationality = '';

  static String myCourseDegree = '';
  static String mySchoolColIns = '';
  static String myPassingYear = '';

  static String myComName = '';
  static String mySCI = '';
  static String myRoles = '';
  static bool myEmployedStatus = true;
  static String myJoinDate = '';
  static String myExitDate = '';

  static List<TextEditingController> mySkills = [TextEditingController()];
  static String myProTitle = '';
  static List<Map<String, dynamic>> myTechnologiesList = [];
  static String myProRoles = '';
  static String myTechnologiesEx = '';
  static String myProDesc = '';
  static List<TextEditingController> myAchievements = [TextEditingController()];
  static String myRefName = '';
  static String myDesignation = '';
  static String myOrgInstName = '';
  static String myDeclarationDesc = '';
  static String myDateDecl = '';
  static String myPlaceIntCity = '';
  static List<Map<String, dynamic>> myLangKnown = [
    {
      'isSelect': false,
      'langName': 'English',
    },
    {
      'isSelect': false,
      'langName': 'French',
    },
    {
      'isSelect': false,
      'langName': 'Allemand',
    },
  ];
}

List<Map<String, dynamic>> myCategoryName = [
  {
    'img': 'user.png',
    'name': 'Contact Info',
    'page': 'contact_info',
  },
  {
    'img': 'briefcase.png',
    'name': 'Carrier Objective',
    'page': 'carrier_objective',
  },
  {
    'img': 'user.png',
    'name': 'Personal Detail',
    'page': 'personal_details',
  },
  {
    'img': 'mortarboard.png',
    'name': 'Education',
    'page': 'eduction',
  },
  {
    'img': 'thinking.png',
    'name': 'Experiences',
    'page': 'experiences',
  },
  {
    'img': 'declaration.png',
    'name': 'Technical_Skills',
    'page': 'technical_skills',
  },
  {
    'img': 'project.png',
    'name': 'Projects',
    'page': 'projects_page',
  },
  {
    'img': 'achievement.png',
    'name': 'Achievements',
    'page': 'achievements_page',
  },
  {
    'img': 'declaration.png',
    'name': 'Declaration',
    'page': 'declaration',
  },
];
