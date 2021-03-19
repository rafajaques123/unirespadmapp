import 'package:unirespadmapp/data/models/login_model.dart';
import 'package:unirespadmapp/data/providers/fire_base_auth_provider.dart';

class LoginRepository {
  static final _provider = FireBaseAuthProvider();

  Future<LoginModel> efetuarLoginADM(String email, String senha) async {
    var map = await _provider.efetuarLoginADM(email, senha);
    if (map == null) return null;
    var login = LoginModel.fromMap(map);

    return login;
  }

  void efetuarLogooff() async {
    await _provider.efetuarLogoff();
  }
}
