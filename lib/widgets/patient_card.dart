import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key,
      required this.id,
      required this.fullname,
      required this.address,
      required this.phone,
      required this.admissionDate,
      required this.dischargeDate,
      required this.delete});
  final int id;
  final String fullname;
  final String address;
  final String phone;
  final String admissionDate;
  final String dischargeDate;
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(10, 10))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mã Bệnh Nhân - ${id}",
                style: const TextStyle(fontSize: 16),
              ),
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      size: 16,
                    ),
                    Text(
                      "${address}",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          _dashLine(),
          const SizedBox(
            height: 8,
          ),
          Text(
            "${fullname}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ngày nhập viện",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${admissionDate}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Ngày xuất viện",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${dischargeDate}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: const Offset(1, 2)),
                      ]),
                  child: const Icon(Icons.phone)),
              const SizedBox(
                width: 8,
              ),
              Text("${phone}")
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFFE8425E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    _showDeleteDialog(context, delete);
                  },
                  child: const Text(
                    "Xóa",
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D124C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Chỉnh sửa",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _dashLine() {
  return Row(
    children: List.generate(
        52,
        (index) => Expanded(
              child: Container(
                color: index % 2 == 1 ? Colors.transparent : Colors.grey,
                height: 2,
              ),
            )),
  );
}

void _showDeleteDialog(BuildContext context, VoidCallback delete) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Cảnh báo!!!"),
          content: Text("Bạn có chắc muốn xóa bệnh nhân này không"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  delete();
                  Navigator.pop(context);
                },
                child: Text("Có")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Không"))
          ],
        );
      });
}
