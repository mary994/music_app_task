import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/data/model/artist/get_top_albums_response.dart';
import 'package:music_app/presentation/widgets/album_widget.dart';

void main() {
  group('AlbumsWidget', () {
    final album = AlbumModel(name: 'Test Album', albumImage: 'https://test.com/image.png', isFavorite: false);
    bool clicked = false;
    bool favoriteClicked = false;

    void onClick() {
      clicked = true;
    }

    void onFavoriteClick(bool isFavorite) {
      favoriteClicked = true;
    }

    testWidgets('displays album name', (WidgetTester tester) async {
      // Build the AlbumsWidget
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AlbumsWidget(album, onClick: onClick, onFavoriteClick: onFavoriteClick),
          ),
        ),
      );

      // Find the album name text widget
        final albumNameFinder = find.text(album.name ?? '');

      // Expect to find the album name text
      expect(albumNameFinder, findsOneWidget);
    });
    testWidgets('calls onClick when tapped', (WidgetTester tester) async {
      // Build the AlbumsWidget
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AlbumsWidget(album, onClick: onClick, onFavoriteClick: onFavoriteClick),
          ),
        ),
      );

      // Find the gesture detector widget
      final gestureDetectorFinder = find.byType(GestureDetector);

      // Tap the gesture detector widget
      await tester.tap(gestureDetectorFinder);

      // Wait for the frame to be rendered
      await tester.pumpAndSettle();

      // Expect onClick to have been called
      expect(clicked, true);
    });

    testWidgets('calls onFavoriteClick when favorite button is toggled', (WidgetTester tester) async {
      // Build the AlbumsWidget
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AlbumsWidget(album, onClick: onClick, onFavoriteClick: onFavoriteClick),
          ),
        ),
      );

      // Find the favorite button widget
      final favoriteButtonFinder = find.byType(FavoriteButton);

      // Tap the favorite button widget
      await tester.tap(favoriteButtonFinder);

      // Wait for the frame to be rendered
      await tester.pumpAndSettle();

      // Expect onFavoriteClick to have been called with true
      expect(favoriteClicked, true);
      expect(album.isFavorite, true);
    });
  });
}