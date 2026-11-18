import 'package:flutter_test/flutter_test.dart';
import 'package:cv_flutter_vabeze_gift_lomo/main.dart';

void main() {
  testWidgets('Vérification de l\'affichage de l\'écran de connexion', (tester) async {
    await tester.pumpWidget(const CvApp());

    expect(find.text('Connexion'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });
}
