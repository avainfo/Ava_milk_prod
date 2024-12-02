import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Database {
  late FirebaseFirestore db;
  late FirebaseAuth auth;
  late CollectionReference col;

  void initialiseDB() {
    db = FirebaseFirestore.instance;
    auth = FirebaseAuth.instance;
    col = db.collection("milk_prod_data");
  }

  Future<void> setData(data, DateTime date) async {
    var formattedDate = DateFormat("yyMMdd").format(date);
    var doc = col.doc(formattedDate);
    bool exists = (await doc.get()).exists;
    if (exists) {
      doc.update(data);
    } else {
      doc.set(data);
    }
  }

  Future<List<Object?>> getAllData() async {
    var docs = (await col.get()).docs;
    return docs.map((e) => e.data()).toList();
  }

  void test() {
    setData(
      {
        "Acid Lait (pH)": 5,
        "Acid Serum (pH)": 5,
        "Qualité du caille": [
          "Beau",
          "Gonflé",
        ],
      },
      DateTime.now(),
    );

    getAllData();
  }
}
