// // This file contains the StorageService class, which manages file storage operations, such as uploading and downloading files.

// import 'package:firebase_storage/firebase_storage.dart';

// class StorageService {
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> uploadFile(String filePath, String fileName) async {
//     File file = File(filePath);
//     try {
//       await _storage.ref('uploads/$fileName').putFile(file);
//       String downloadUrl = await _storage.ref('uploads/$fileName').getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       throw Exception('Error uploading file: $e');
//     }
//   }

//   Future<void> deleteFile(String fileName) async {
//     try {
//       await _storage.ref('uploads/$fileName').delete();
//     } catch (e) {
//       throw Exception('Error deleting file: $e');
//     }
//   }

//   Future<String> downloadFile(String fileName) async {
//     try {
//       String downloadUrl = await _storage.ref('uploads/$fileName').getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       throw Exception('Error downloading file: $e');
//     }
//   }
// }