import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/models/reaction_model.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/pages/main/reaction/reaction_provider.dart';
import 'package:instagram_clone/pages/main/reaction/widget/custom_user_card_widget.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:provider/provider.dart';

class ReactionPage extends StatefulWidget {
  const ReactionPage({super.key});
  static Widget get view => ChangeNotifierProvider(
        create: (_) => ReactionProvider(),
        lazy: false,
        child: const ReactionPage(),
      );
  @override
  State<ReactionPage> createState() => _ReactionPageState();
}

class _ReactionPageState extends State<ReactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: Text(
            'Notifications',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 25.sp, fontWeight: FontWeight.w600),
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: .0,
        ),
      ),
      body: Consumer2<ReactionProvider, MainProvider>(
          builder: (context, reactionProvider, mainProvider, _) {
        return FirestoreListView(
          query: FireSrc.firebaseFirestore
              .collection('notifications')
              .doc(AuthSrc.firebaseAuth.currentUser!.uid)
              .collection('reaction')
              .orderBy('reactionPubplishDate', descending: true),
          shrinkWrap: true,
          itemBuilder: (context, document) {
            if (!document.exists) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (document.data().isEmpty) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            // log(document.data()['reactionId'].toString());
            final ReactionModel reactionModel =
                ReactionModel.fromDocumentSnapshot(document);
            return CustomCardItemReaction(
                username: reactionModel.myUsername,
                datetime: reactionModel.reactionPubplishDate,
                imageUrl: reactionModel.myAvatarUrl,
                postImageUrl: reactionModel.imageUrl,
                onPressed: () {},
                text: reactionModel.reactionText);
          },
        );
      }),
    );
  }
}
