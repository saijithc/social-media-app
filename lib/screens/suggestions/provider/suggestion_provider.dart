import 'package:flutter/widgets.dart';
import 'package:socio/screens/current_user/model/timeline_post_model.dart';
import 'package:socio/services/suggestions.dart';

class SuggestionProvider with ChangeNotifier {
  List<UserId> suggestions = [];
  getSuggetions() {
    Suggestion().getSuggestions().then((value) {
      suggestions = value.map((e) => UserId.fromJson(e)).toList();
      notifyListeners();

      // suggestions = value;
      // notifyListeners();
    });
  }
}
