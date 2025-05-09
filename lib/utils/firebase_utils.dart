import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/model/event.dart';
import 'package:flutter_application_2/model/my_user.dart';

class FirebaseUtils {

  static CollectionReference<Event> getEventCollection(uId){
    return getUserCollection().doc(uId).collection(Event.collectionName).
    withConverter<Event>(
      fromFirestore: (snapshots,options) => Event.fromFirestore(snapshots.data()!)  ,
       toFirestore: (event,options) => event.toFireStore()  ,
    );
  }

  static CollectionReference<MyUser> getUserCollection(){
   return FirebaseFirestore.instance.collection(MyUser.collectionName).
    withConverter<MyUser>(
     fromFirestore: (snapshot , options){
        return MyUser.fromFireStore(snapshot.data()!);
     } ,
     toFirestore: (myuser ,options){
      return myuser.toFireStore() ;
     });

  }

  static Future<void> addUserToFireStore(MyUser myuser){
    return getUserCollection().doc(myuser.id).set(myuser);
  }

  static Future<MyUser?> readUserFromFireStore(String id) async{
    var querySnapShot = await getUserCollection().doc(id).get();
    return querySnapShot.data();
  }

  static Future<void> addEventToFireStore(Event event,String uId){
    var eventsCollection = getEventCollection(uId) ;
    DocumentReference<Event> docRef = eventsCollection.doc();
     event.id =  docRef.id ;
     return docRef.set(event);
  }


  
}