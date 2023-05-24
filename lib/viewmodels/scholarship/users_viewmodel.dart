import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/users_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

CollectionReference scholarship = FirebaseFirestore.instance.collection('scholarship');

class UsersViewModel extends BaseViewModel {
  final UsersRepository repository;
  UsersViewModel({required this.repository});
  List<UsersModel> listMsv = [];
  UsersModel? nameOnly;
  List<UsersModel> listUsers = [];
  late UsersModel user;
  List<UsersModel> get usersModel => listUsers;
  @override
  void onInitView(BuildContext context) {
    getUsers().then((_) {
      updateUI();
    });
    super.onInitView(context);
  }

  Future getUsers() async {
    listUsers = await repository.getUsers();
  }

  Future<List<String>> getSearchClass(String classValue) async {
    try {
      listUsers = await repository.getUsers();
      listMsv =
          listUsers.where((element) => element.classRoom!.contains(classValue.trim())).toList();
      updateUI();

      return listMsv.map((element) => element.msv!).toList();
    } catch (e) {
      Utils.showToast(message: e.toString());
      return []; // Return an empty list or handle the error accordingly
    }
  }

  Future<String?> getSearchName(String msv) async {
    try {
      listUsers = await repository.getUsers();
      List<String> names = listUsers
          .where((element) => element.msv!.contains(msv.trim()))
          .map((user) => user.name ?? "")
          .toList();
      updateUI();

      return names.isNotEmpty ? names.join(", ") : null;
    } catch (e) {
      Utils.showToast(message: e.toString());
      return null; // or handle the error accordingly
    }
  }

  Future<void> addScholarship({
    required String name,
    required String msv,
    required String classRoom,
    required String rank,
    required String bonus,
  }) async {
    try {
      // Kiểm tra nếu đã tồn tại tài liệu với msv tương tự
      final querySnapshot = await scholarship.where('msv', isEqualTo: msv).get();

      if (querySnapshot.docs.isEmpty) {
        // Không có tài liệu trùng msv, tiến hành thêm dữ liệu mới
        await scholarship.add({
          'name': name,
          'msv': msv,
          'classRoom': classRoom,
          'rank': rank,
          'bonus': bonus,
        });
        Utils.showPopup(context,
            icon: AppAssets.icCheck,
            title: "Thêm sinh viên thành công",
            message: "Sinh viên đã được thêm vào danh sách học bổng");
      } else {
        Utils.showPopup(context,
            icon: AppAssets.icClose,
            title: "Thêm sinh viên thất bại",
            message: "Sinh viên đã được thêm vào rồi\nThoát ra ngoài nếu muốn xem nhé :3");
      }
    } catch (error) {
      print('Failed to add scholarship: $error');
    }
  }
}
