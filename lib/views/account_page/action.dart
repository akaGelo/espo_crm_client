import 'package:espo_crm_client/model/firebase_user.dart';
import 'package:fish_redux/fish_redux.dart';

enum AccountPageAction {
  action,
  login,
  profile,
  logout,
  navigatorPush,
  themeChanged
}

class AccountPageActionCreator {
  static Action onAction() {
    return const Action(AccountPageAction.action);
  }

  static Action onLogin() {
    return Action(AccountPageAction.login);
  }

  static Action onProfile(UserProfile userProfile) {
    return Action(AccountPageAction.profile, payload: userProfile);
  }

  static Action onLogout() {
    return Action(AccountPageAction.logout);
  }

  static Action navigatorPush(String routeName, {Object arguments}) {
    return Action(AccountPageAction.navigatorPush,
        payload: [routeName, arguments]);
  }

  static Action themeChange() {
    return const Action(AccountPageAction.themeChanged);
  }
}
