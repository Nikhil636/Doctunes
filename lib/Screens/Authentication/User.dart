// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// // final FirebaseAuth auth = FirebaseAuth.instance;
// // final GoogleSignIn googleSignIn = GoogleSignIn();
// // late String name;
// // late String Email;
// // late String imgurl;
// // late String Uid;
// // Future<String> signInWithGoogle() async {
// //   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
// //   final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount
// //       ?.authentication;
// //   final AuthCredential credential = GoogleAuthProvider.credential(
// //       accessToken: googleSignInAuthentication?.accessToken,
// //       idToken : googleSignInAuthentication?.idToken,
// //   );
// //   final UserCredential authResult = await auth.signInWithCredential(credential);
// //   final user = authResult.user!;
// //   assert (user.email != null);
// //   assert(user.displayName != null);
// //   assert(user.photoURL != null);
// //   assert(user.uid != null);
// //   name = user.displayName!;
// //   Email = user.email!;
// //   imgurl = user.photoURL!;
// //   Uid = user.uid;
// //   final User currentUser = await auth.currentUser!;
// //   assert(user.uid == currentUser.uid);
// //   return 'signInWithGoogle succeeded: $user';
// // }
// // void signOutGoogle()async{
// //   await googleSignIn.signOut();
// //   print("User out");
// // }
// final GoogleSignIn _googleSignIn = GoogleSignIn();
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _db = FirebaseFirestore.instance;
//
// GoogleSignInAccount? _googleUser;
// late User _user;
// bool _isSigningIn = false;
//
// @override
// void initState() {
//   super.initState();
//   _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
//     setState(() {
//       _googleUser = account;
//     });
//     if (_googleUser != null) {
//       _signInFirebase();
//     }
//   });
// }
// Future<void> _signInFirebase() async {
//   setState(() {
//     _isSigningIn = true;
//   });
//   GoogleSignInAuthentication googleAuth = await _googleUser!.authentication;
//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//   UserCredential result = await _auth.signInWithCredential(credential);
//   _user = result.user!;
//   await _saveUserInfoToFirestore();
//   setState(() {
//     _isSigningIn = false;
//   });
// }Future<void> _saveUserInfoToFirestore() async {
//   DocumentReference ref = _db.collection('users').doc(_user.uid);
//   await ref.set({
//     'uid': _user.uid,
//     'email': _user.email,
//     'displayName': _user.displayName,
//     'photoURL': _user.photoURL,
//   }, SetOptions(merge: true));
// }
