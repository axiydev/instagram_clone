import 'package:instagram_clone/pages/main/post/create_post/create_post_page.dart';
import 'package:instagram_clone/pages/main/post/posts/posts_page.dart';
import 'package:instagram_clone/pages/main/profile/profile/profile_page.dart';
import 'package:instagram_clone/pages/main/reaction/reaction_page.dart';
import 'package:instagram_clone/pages/main/search/search_view.dart';

final List pageList = [
  PostsPage.show,
  SearchView.show,
  CreatePost.show,
  ReactionPage.view,
  ProfilePage.view,
];

String? userNotificationToken = '';
String? usernameApp = '';
