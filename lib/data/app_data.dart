import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/main/post/create_post/create_post_page.dart';
import 'package:instagram_clone/pages/main/post/posts/posts_page.dart';
import 'package:instagram_clone/pages/profile/profile/profile_page_provider.dart';
import 'package:instagram_clone/pages/search/search_view.dart';

final List pageList = [
  PostsPage.show,
  SearchView.show,
  CreatePost.show,
  const Center(
    child: Text('heart'),
  ),
  ProfilePage.view,
];
