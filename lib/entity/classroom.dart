import 'package:flutter/material.dart';

class Classroom {
 late String id;
  late String semester;
  late String subject;
  late String totalStudent;
  late Color  bg;
  late String url;


  Classroom( this.id,this.semester,this.subject,this.totalStudent,{ this.bg=Colors.blue});



}
var lst = [
  Classroom("2024-2025.1_Tin3067","2024-2025", "2024-2025.1_Tin3067 Lập Trình Di Động Flutter - Nhóm 3","10" ,bg: Colors.red),
  Classroom("2024-2025.1","2024-2025", "LTDD", "10",bg: Colors.green),
  Classroom("2024-2025.1","2024-2025", "LTDD","10",bg: Colors.yellowAccent),
  Classroom("2024-2025.1","2024-2025", "LTDD", "10",bg: Colors.orangeAccent),
  Classroom("2024-2025.1","2024-2025", "LTDD","10",bg:Colors.brown),

];


