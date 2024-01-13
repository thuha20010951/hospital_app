import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/controller/patient_controller.dart';
import 'package:hospital_app/widgets/filter_item.dart';
import 'package:get/get.dart';
import 'package:hospital_app/widgets/patient_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> filterItems = [
    "Tất cả",
    "Bệnh tim",
    "Bệnh não",
    "Bệnh tâm thần",
    "Bệnh răng hàm mặt"
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PatientController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Bệnh nhân"),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Color(0XFFF6F6F6),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Thêm",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.grey,
                backgroundColor: Color(0xFF0D124C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: SizedBox(
          height: double.maxFinite,
          child: Obx(
            () => Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 48,
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(right: 2, bottom: 2, top: 2),
                    scrollDirection: Axis.horizontal,
                    children: filterItems
                        .map((e) => FilterItem(
                              filterText: e,
                              isFirstItem: e == filterItems[0],
                              isActive: e == c.filterText.value,
                              changeFilterText: () => c.changeFilterText(e),
                            ))
                        .toList(),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: c.foundPatients.length,
                        itemBuilder: (context, index) {
                          var reversedList = c.foundPatients.reversed.toList();
                          return PatientCard(
                            id: reversedList[index]["id"],
                            fullname: reversedList[index]["fullname"],
                            address: reversedList[index]["address"],
                            phone: reversedList[index]["phone"],
                            admissionDate: reversedList[index]["admissionDate"],
                            dischargeDate: reversedList[index]["dischargeDate"],
                            delete: () =>
                                c.deletePatient(reversedList[index]["id"]),
                          );
                        }))
              ],
            ),
          )),
    );
  }
}
