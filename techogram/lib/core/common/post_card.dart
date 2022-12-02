import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techogram/core/common/error_text.dart';
import 'package:techogram/core/common/loader.dart';
import 'package:techogram/core/constants/constants.dart';
import 'package:techogram/features/auth/controlller/auth_controller.dart';
import 'package:techogram/features/community/controller/community_controller.dart';
import 'package:techogram/features/post/controller/post_controller.dart';
import 'package:techogram/models/post_model.dart';
import 'package:techogram/responsive/responsive.dart';
import 'package:techogram/theme/pallete.dart';
import 'package:routemaster/routemaster.dart';

class PostCard extends ConsumerWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  void deletePost(WidgetRef ref, BuildContext context) async {
    ref.read(postControllerProvider.notifier).deletePost(post, context);
  }

  void navigateToCommunity(BuildContext context) {
    Routemaster.of(context).push('/r/${post.communityName}');
  }

  void navigateToComments() {
    print('Trynna comment');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTypeImage = post.type == 'image';
    final isTypeText = post.type == 'text';
    final isTypeLink = post.type == 'link';
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;

    final currentTheme = ref.watch(themeNotifierProvider);

    return Responsive(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: currentTheme.drawerTheme.backgroundColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (kIsWeb)
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ).copyWith(right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            navigateToCommunity(context),
                                        child: CircleAvatar(
                                          backgroundImage:
                                              AssetImage(Constants.logoPath),
                                          radius: 16,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${post.communityName}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => {},
                                              child: Text(
                                                '${post.username}',
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (post.uid == user.uid)
                                    IconButton(
                                      onPressed: () => deletePost(ref, context),
                                      icon: Icon(
                                        Icons.delete,
                                        color: Pallete.greenColor,
                                      ),
                                    ),
                                ],
                              ),
                              if (post.awards.isNotEmpty) ...[
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 25,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: post.awards.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final award = post.awards[index];
                                      return Image.asset(
                                        Constants.awards[award]!,
                                        height: 23,
                                      );
                                    },
                                  ),
                                ),
                              ],
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  post.title,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (isTypeImage)
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  width: double.infinity,
                                  child: Image.network(
                                    post.link!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              if (isTypeLink)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  child: AnyLinkPreview(
                                    displayDirection:
                                        UIDirection.uiDirectionHorizontal,
                                    link: post.link!,
                                  ),
                                ),
                              if (isTypeText)
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Text(
                                    post.description!,
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
