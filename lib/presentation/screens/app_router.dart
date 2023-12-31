import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRoute, GoRouter;

import '../../core/my_app.dart';
import '../../data/notes/cloud/s_cloud_notes.dart';
import 'auth/profile/s_profile.dart';
import 'auth/w_dynamic_auth.dart';
import 'note/s_note.dart';
import 'onboarding/s_onboarding.dart';
import 'settings/s_settings.dart';
import 'story/s_story.dart';

class AppRouter {
  const AppRouter._();

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: DynamicAuthWidget.routeName,
        builder: (context, state) => const DynamicAuthWidget(),
      ),
      GoRoute(
        path: MyHomeWidget.routeName,
        builder: (context, state) => const MyHomeWidget(),
      ),
      GoRoute(
        path: OnBoardingScreen.routeName,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: SettingsScreen.routeName,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: ProfileScreen.routeName,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: StoryScreen.routeName,
        builder: (context, state) => const StoryScreen(),
      ),
      GoRoute(
        path: NoteScreen.routeName,
        builder: (context, state) {
          final args = state.extra as NoteScreenArgs;
          return NoteScreen(
            args: args,
          );
        },
      ),
      GoRoute(
        path: '${NoteScreen.routeName}/:noteId',
        builder: (context, state) {
          final noteId = state.pathParameters['noteId'];
          if (noteId == null) {
            throw ArgumentError('The noteId should not be null');
          }
          return FutureBuilder(
            future: CloudNotesService.getInstance().getNoteById(noteId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: CircularProgressIndicator.adaptive(),
                );
              }
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Error while loading the note: ${snapshot.error.toString()}',
                    ),
                  ),
                );
              }
              final cloudNote = snapshot.data;
              if (cloudNote == null) {
                return const Scaffold(
                  body: Center(child: Text('Note does not exists.')),
                );
              }
              return NoteScreen(
                args: NoteScreenArgs(
                  isDeepLink: true,
                  note: cloudNote,
                ),
              );
            },
          );
        },
      ),
    ],
  );
}
