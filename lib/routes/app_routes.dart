import 'package:unirespadmapp/views/pages/colaboradores/index.dart';
import 'package:unirespadmapp/views/pages/criar_colaborador/index.dart';
import 'package:unirespadmapp/views/pages/home/index.dart';
import 'package:unirespadmapp/views/pages/login/index.dart';
import 'package:unirespadmapp/views/pages/solicitacoes/index.dart';
import 'package:unirespadmapp/views/pages/solicitacao_detalhada/index.dart';

abstract class AppRoutes {
  static const String COLABORADORES = 'COLABORADORES';
  static const String CRIAR_COLABORADOR = 'CRIAR_COLABORADOR';
  static const String LOGIN = 'LOGIN';
  static const String SOLICITACOES = 'SOLICITACOES';
  static const String HOME = 'HOME';
  static const String SOLICITACAODETALHADA = 'SOLICITACAODETALHADA';

  static final routes = {
    COLABORADORES: (context) => ListaColaboradores(),
    CRIAR_COLABORADOR: (context) => CadastarColaboradorPage(),
    LOGIN: (context) => LoginADMPage(),
    SOLICITACOES: (context) => SolicitacoesPage(),
    HOME: (context) => HomePage(),
    SOLICITACAODETALHADA: (builder) => SolicitacaoDetalhada(),
  };
}
