import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginPageAction {
  errorMessage,
  loginclicked,
  urlChanged,
  accoutChanged,
  pwdChanged,
}

class LoginPageActionCreator {
  static Action onErrorMessage(String message) {
    return Action(LoginPageAction.errorMessage, payload: message);
  }

  static Action onLoginClicked() {
    return const Action(LoginPageAction.loginclicked);
  }

  static Action onUrlChange(String url) {
    return Action(LoginPageAction.urlChanged, payload: url);
  }

  static Action onAccountChange(String account) {
    return Action(LoginPageAction.accoutChanged, payload: account);
  }

  static Action onPwdChange(String pwd) {
    return Action(LoginPageAction.pwdChanged, payload: pwd);
  }
}
