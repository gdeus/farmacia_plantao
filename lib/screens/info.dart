import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Informações do aplicativo", style: GoogleFonts.lato(fontSize: 24),),
        Text("Aplicativo criado baseado no Diário Oficial do Município de São Miguel do Iguaçu (Edição nº 2525 | 12/02/2021) onde é definido os plantões das farmácias em 2021. Caso o aplicativo esteja com problema ou informando a farmácia incorrreta "
            "favor verificar as configurações de data e hora do seu celular. Dúvidas, informações, problemas ou bugs, favor entrar no contato no e-mail dedeus.gabriel@gmail.com", style: GoogleFonts.lato(fontSize: 20), textAlign: TextAlign.center, ),
      ],
    );
  }
}
