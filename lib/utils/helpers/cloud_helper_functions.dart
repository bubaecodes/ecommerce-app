import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TCloudHelperFunctions {
  /// helper function to check the state of a single database record
  ///
  /// returns a widget based on the state of the snapshot
  /// if data is still loading, it returns a CircularProgressIndicator
  /// if no data is found, it returns a generic "no data found" message
  /// if an error occurs, it returns a generic error message
  /// otherwise, it returns null;

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if(snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found!'));
    }

    if (snapshot.hasError) {
      return const Center(child: Text('Something went wrong'));
    }

    return null;
  }

  /// helper function to check the state of multiple (list) database record
  ///
  /// returns a widget based on the state of the snapshot
  /// if data is still loading, it returns a CircularProgressIndicator
  /// if no data is found, it returns a generic "no data found" message
  /// if an error occurs, it returns a generic error message
  /// otherwise, it returns null;
  static Widget? checkMultiRecordState<T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {
    if(snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: Text('No Data Found!'));
    }

    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: Text('Something went wrong'));
    }

    return null;
  }

  /// create a reference with an initial file path and name and retrieve the download URL
  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }
}










