import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_zar_beslisi/oyun_zar_beslisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(zarBesliConfig.title.length, 33);
    expect(zarBesliConfig.tagline.length, 33);
    for (final s in zarBesliConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: zarBesliId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = zarBesliRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
