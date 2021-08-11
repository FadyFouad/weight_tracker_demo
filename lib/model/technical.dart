///****************************************************
///*** Created by Fady Fouad on 07-Aug-21 at 17:36.***
///****************************************************

class Technical {
  //Employee info
  final String id;
  final String name;
  final String address;
  final String phoneNum;
  final String workLocation;
  final String techType;

  //task info
  final String projectName;
  final String taskNum;
  final String taskDesc;
  final String governrate;
  final List<String> tools;

  //Attendance
  final String attendance;

  //productivity
  final String taskStatus;

  //Behavior
  final String behaviorStatus;

  //tools
  final String toolsStatus;

  //notes
  final String recommendation;

  Technical({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNum,
    required this.workLocation,
    required this.techType,
    required this.projectName,
    required this.taskNum,
    required this.taskDesc,
    required this.governrate,
    required this.tools,
    required this.attendance,
    required this.taskStatus,
    required this.behaviorStatus,
    required this.toolsStatus,
    required this.recommendation,
  });
}

// enum Attendance { ATTEND, ABSENCE, LATE }
//
// enum Behaviour { VERY_BAD, BAD, GOOD, VERY_GOOD }
//
// enum TechType { LOCAL_LOOP, FIBER_CIRCUITS }
