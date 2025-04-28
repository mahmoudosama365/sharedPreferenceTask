import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/model/event.dart';

class FirebaseUtils {

  static CollectionReference<Event> getEventCollection(){
    return FirebaseFirestore.instance.collection(Event.collectionName).
    withConverter<Event>(
      fromFirestore: (snapshots,options) => Event.fromFirestore(snapshots.data()!)  ,
       toFirestore: (event,options) => event.toFireStore()  ,
    );
  }



  static Future<void> addEventToFireStore(Event event){
    var eventsCollection = getEventCollection() ;
    DocumentReference<Event> docRef = eventsCollection.doc();
     event.id =  docRef.id ;
     return docRef.set(event);

  }
}