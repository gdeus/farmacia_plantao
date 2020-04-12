import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Informações do aplicativo", style: GoogleFonts.lato(fontSize: 24),),
        Text("Aplicativo criado baseado no Diário Oficial do Município de São Miguel do Iguaçu (Edição nº 2235 | 20/01/2020) onde é definido os plantões das farmácias em 2020. Caso o aplitivo esteja com problema ou informando a farmácia incorrreta "
            "favor verificar as configurrações de data e hora do seu celular. Dúvidas, informações, problemas ou bugs, favor entrar no contato no e-mail dedeus.gabriel@gmail.com", style: GoogleFonts.lato(fontSize: 16), textAlign: TextAlign.center, ),
      ],
    );
  }
}