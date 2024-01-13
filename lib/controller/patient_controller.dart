// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class PatientController extends GetxController {
  RxList<Map<String, dynamic>> patientsList = patients.obs;

  RxList<Map<String, dynamic>> foundPatients = RxList<Map<String, dynamic>>([]);

  RxString filterText = "Tất cả".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    foundPatients.assignAll(patientsList);
  }

  void changeFilterText(String text) {
    filterText.value = text;
    filterPatients(text);
  }

  void deletePatient(int id) {
    patientsList.removeWhere((element) => element["id"] == id);
    filterPatients("Tất cả");
  }

  void filterPatients(String filterText) {
    if (filterText == "Tất cả") {
      foundPatients.assignAll(patientsList);
    } else {
      foundPatients.assignAll(
          patientsList.where((element) => element["disease"] == filterText));
    }
  }
}

List<Map<String, dynamic>> patients = [
  {
    "id": 0,
    "fullname": "Nguyen Van A",
    "phone": "0123456654",
    "address": "Hà Nội",
    "admissionDate": "12/12/2023",
    "dischargeDate": "2/2/2024",
    "disease": "Bệnh tim"
  },
  {
    "id": 1,
    "fullname": "Nguyen Van B",
    "phone": "0123456651",
    "address": "Address 1",
    "admissionDate": "1/2/2023",
    "dischargeDate": "3/2/2024",
    "disease": "Bệnh răng hàm mặt"
  },
  {
    "id": 2,
    "fullname": "Nguyen Van C",
    "phone": "0123456652",
    "address": "Address 2",
    "admissionDate": "1/3/2023",
    "dischargeDate": "4/2/2024",
    "disease": "Bệnh tâm thần"
  },
  {
    "id": 3,
    "fullname": "Nguyen Van D",
    "phone": "0123456653",
    "address": "Address 3",
    "admissionDate": "1/4/2023",
    "dischargeDate": "5/2/2024",
    "disease": "Bệnh răng hàm mặt"
  },
  {
    "id": 4,
    "fullname": "Nguyen Van E",
    "phone": "0123456654",
    "address": "Address 4",
    "admissionDate": "1/5/2023",
    "dischargeDate": "6/2/2024",
    "disease": "Bệnh răng hàm mặt"
  },
  {
    "id": 5,
    "fullname": "Nguyen Van F",
    "phone": "0123456655",
    "address": "Address 5",
    "admissionDate": "1/6/2023",
    "dischargeDate": "7/2/2024",
    "disease": "Bệnh tâm thần"
  },
  {
    "id": 6,
    "fullname": "Nguyen Van G",
    "phone": "0123456656",
    "address": "Address 6",
    "admissionDate": "1/7/2023",
    "dischargeDate": "8/2/2024",
    "disease": "Bệnh não"
  },
  {
    "id": 7,
    "fullname": "Nguyen Van H",
    "phone": "0123456657",
    "address": "Address 7",
    "admissionDate": "1/8/2023",
    "dischargeDate": "9/2/2024",
    "disease": "Bệnh tâm thần",
  },
  {
    "id": 8,
    "fullname": "Nguyen Van I",
    "phone": "0123456658",
    "address": "Address 8",
    "admissionDate": "1/9/2023",
    "dischargeDate": "10/2/2024",
    "disease": "Bệnh não"
  },
  {
    "id": 9,
    "fullname": "Nguyen Van J",
    "phone": "0123456659",
    "address": "Address 9",
    "admissionDate": "1/10/2023",
    "dischargeDate": "11/2/2024",
    "disease": "Bệnh tim",
  }
];
