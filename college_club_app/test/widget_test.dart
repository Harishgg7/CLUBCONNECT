// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:college_club_app/main.dart';

void main() {
  testWidgets('ClubConnect app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ClubConnectApp());

    // Verify that the login screen is displayed
    expect(find.text('ClubConnect'), findsOneWidget);
    expect(find.text('Welcome back! Please login to continue'), findsOneWidget);

    // Verify that Student and Club buttons exist
    expect(find.text('Student'), findsOneWidget);
    expect(find.text('Club'), findsOneWidget);

    // Verify that login button exists
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Login screen toggles between Student and Club', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ClubConnectApp());

    // Initially, College ID field should be visible (Student mode)
    expect(find.text('College ID'), findsOneWidget);

    // Tap the Club button
    await tester.tap(find.text('Club'));
    await tester.pumpAndSettle();

    // Now Club Email field should be visible
    expect(find.text('Club Email'), findsOneWidget);
    expect(find.text('College ID'), findsNothing);
  });

  testWidgets('Login form validation works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ClubConnectApp());

    // Try to login without entering credentials
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that validation errors are shown
    expect(find.text('Please enter your college ID'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Password visibility toggle works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ClubConnectApp());

    // Find the password field
    final passwordField = find.widgetWithText(TextFormField, 'Password');
    expect(passwordField, findsOneWidget);

    // Find and tap the visibility icon
    final visibilityIcon = find.byIcon(Icons.visibility);
    expect(visibilityIcon, findsOneWidget);

    await tester.tap(visibilityIcon);
    await tester.pumpAndSettle();

    // After tapping, the icon should change to visibility_off
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });

  testWidgets('Forgot Password dialog shows', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ClubConnectApp());

    // Tap the Forgot Password button
    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    // Verify that the dialog is displayed
    expect(find.text('Forgot Password'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Send'), findsOneWidget);
  });

  testWidgets('Sign Up dialog shows', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ClubConnectApp());

    // Tap the Sign Up button
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify that the dialog is displayed
    expect(find.text('Sign Up'), findsWidgets);
    expect(
      find.text(
        'Please contact your college administrator to create an account.',
      ),
      findsOneWidget,
    );
  });
}
