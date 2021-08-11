import 'package:flutter/material.dart';
import 'package:weight_tracker_demo/model/technical.dart';

///****************************************************
///*** Created by Fady Fouad on 07-Aug-21 at 21:55.***
///****************************************************

class Techs with ChangeNotifier {
  List<Technical> _technicals = [
    Technical(
        id: "123",
        name: "محمود",
        address: "البحيرة",
        phoneNum: "01123815517",
        workLocation: "Behira",
        techType: "TechType.LOCAL_LOOP",
        projectName: "",
        taskNum: "",
        taskDesc: "",
        governrate: "",
        attendance: "",
        taskStatus: "",
        behaviorStatus: "",
        toolsStatus: "",
        recommendation: "",
        tools: ["هيلتي", "سلم", "مكنة كور"]),
    Technical(
        id: "123",
        name: "محمود",
        address: "البحيرة",
        phoneNum: "01123815517",
        workLocation: "Behira",
        techType: "TechType.LOCAL_LOOP",
        projectName: "",
        taskNum: "",
        taskDesc: "",
        governrate: "",
        attendance: "",
        taskStatus: "",
        behaviorStatus: "",
        toolsStatus: "",
        recommendation: "",
        tools: ["هيلتي", "سلم", "مكنة كور"]),
    Technical(
        id: "123",
        name: "محمود",
        address: "البحيرة",
        phoneNum: "01123815517",
        workLocation: "Behira",
        techType: "TechType.LOCAL_LOOP",
        projectName: "",
        taskNum: "",
        taskDesc: "",
        governrate: "",
        attendance: "",
        taskStatus: "",
        behaviorStatus: "",
        toolsStatus: "",
        recommendation: "",
        tools: ["هيلتي", "سلم", "مكنة كور"]),
    Technical(
        id: "123",
        name: "محمود",
        address: "البحيرة",
        phoneNum: "01123815517",
        workLocation: "Behira",
        techType: "TechType.LOCAL_LOOP",
        projectName: "",
        taskNum: "",
        taskDesc: "",
        governrate: "",
        attendance: "",
        taskStatus: "",
        behaviorStatus: "",
        toolsStatus: "",
        recommendation: "",
        tools: ["هيلتي", "سلم", "مكنة كور"]),
  ];

  List<Technical> get technicals {
    return [..._technicals];
  }

  void addTech(Technical technical) {
    _technicals.add(technical);
    notifyListeners();
  }
}
