import 'package:cloud_firestore/cloud_firestore.dart';

class CreateContractFirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getAllUsers() async {
    Map<String, dynamic> map = {};
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('AllUsers').get();

      List<Map<String, dynamic>> allusers = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();   // List<Map<String, dynamic>>

      // map['userNames'] = allusers.map((user) => user['Name'].toString()).toList();
      map['User_ids'] = allusers.map((user) => user['User_id'].toString()).toList();
      map['Village'] = allusers.map((user) => user['Village'].toString()).toList();
      map['Domain'] = allusers.map((user) => user['Domain'].toString()).toList();
      map['AllUsers'] = allusers;

      return map;

    } catch (e) {
      print('Error fetching all users: $e');
      return {};
    }
  }

 Future<Map<String, dynamic>> getUsersByDomain(
      List<Map<String, dynamic>> allUsers, String domain) async {
    try {
      List<Map<String, dynamic>> filteredUsers =
          allUsers.where((user) => user['Domain'] == domain).toList();

      List<String> locations = filteredUsers.map((user) => user['Village'].toString()).toSet().toList();
      List<String> userNames = filteredUsers.map((user) => user['User_id'].toString()).toList();

      return {'users': filteredUsers, 'locations': locations, 'User_ids': userNames};
    } catch (e) {
      print('Error fetching users by domain: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getUsersByVillage(
      List<Map<String, dynamic>> allUsers, String village) async {
    try {
      List<Map<String, dynamic>> filteredUsers =
          allUsers.where((user) => user['Village'] == village).toList();

      List<String> domains = filteredUsers.map((user) => user['Domain'].toString()).toSet().toList();
      List<String> userNames = filteredUsers.map((user) => user['User_id'].toString()).toList();

      return {'users': filteredUsers, 'domains': domains, 'User_ids': userNames};
    } catch (e) {
      print('Error fetching users by village: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getUsersByName(
      List<Map<String, dynamic>> allUsers, String name) async {
    try {
      List<Map<String, dynamic>> filteredUsers =
          allUsers.where((user) => user['User_id'] == name).toList();
      List<String> userNames = filteredUsers.map((user) => user['User_id'].toString()).toList();
      return {'users': filteredUsers, 'User_ids': userNames};

    } catch (e) {
      print('Error fetching users by name: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getUsersByDomainAndVillage(
      List<Map<String, dynamic>> allUsers, String domain, String village) async {
    try {
      List<Map<String, dynamic>> filteredUsers = allUsers
          .where((user) => user['Domain'] == domain && user['Village'] == village)
          .toList();
      List<String> userNames = filteredUsers.map((user) => user['User_id'].toString()).toList();
      return {'users': filteredUsers, 'User_ids': userNames};

    } catch (e) {
      print('Error fetching users by domain and village: $e');
      return {};
    }
  }
}