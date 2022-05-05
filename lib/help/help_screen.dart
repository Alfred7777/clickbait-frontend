import 'package:flutter/material.dart';
import 'package:clickbait_app/widgets/top_bar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  static const String route = '/help';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: Column(
        children: const <Widget>[
          TopBar(),
          Expanded(
            child: HelpList(),
          )
        ],
      ),
    );
  }
}

class HelpList extends StatelessWidget {
  const HelpList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxWidth < 600 ? 18 : 24,
            horizontal: constraints.maxWidth < 600 ? 18 : 24,
          ),
          child: ListView(
            children: <Widget>[
              HelpHeaderText(
                text: 'Jak to działa?',
                fontSize: constraints.maxWidth < 600 ? 24 : 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxWidth < 600 ? 9 : 12,
                  horizontal: constraints.maxWidth < 600 ? 9 : 12,
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: 'Na głównym ekranie aplikacji zostanie Ci wyświetlony nagłówek internetowego artykułu. Twoim zadaniem jest ocenić, czy to clickbait, klikając przycisk ',
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: constraints.maxWidth < 600 ? 18 : 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'TAK', 
                        style: TextStyle(
                          color: Colors.green.shade400,
                          fontSize: constraints.maxWidth < 600 ? 18 : 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: ' lub '),
                      TextSpan(
                        text: 'NIE', 
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: constraints.maxWidth < 600 ? 18 : 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: '. Jeżeli nie masz pewności możesz kliknąć przycisk '),
                      TextSpan(
                        text: 'POMIŃ', 
                        style: TextStyle(
                          color: Colors.lightBlue.shade700,
                          fontSize: constraints.maxWidth < 600 ? 18 : 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: ', wtedy zostanie Ci pokazany kolejny nagłówek. Nie ma tutaj dobrych lub złych odpowiedzi, więc wybieraj zawsze tą, która według Ciebie jest słuszna.'),
                    ],
                  ),
                ),
              ),
              HelpHeaderText(
                text: 'Czym jest clickbait?',
                fontSize: constraints.maxWidth < 600 ? 24 : 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxWidth < 600 ? 9 : 12,
                  horizontal: constraints.maxWidth < 600 ? 9 : 12,
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: 'Clickbait to zjawisko internetowe polegające na przyciąganiu uwagi za pomocą tytułów bądź miniaturek, które przesadnie wyolbrzymiają faktyczną treść lub znaczenie artykułu. ',
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: constraints.maxWidth < 600 ? 18 : 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: 'W naszej aplikacji skupiamy się tylko na tytułach artykułów w formie tekstowej. '),
                      TextSpan(text: 'Poszukujemy zatem takich nagłowków, które zwracają uwagę, wywołują emocje lub wzbudzają ludzką ciekawość, poprzez swoją formę lub treść. '),
                      TextSpan(text: 'W związku z tym tytuły, które mają wymienione wyżej cechy powinny być przez Ciebie oznaczone jako clickbait. '),
                      TextSpan(text: 'Nagłówki, w których celowo została pominięta prosta informacja, która powinna być w nich zawarta, w celu przyciągnięcia użytkownika rownież zaliczają się jako clickbait. '),
                      TextSpan(text: 'Warto wspomnieć, że rozpatrujemy w tym przypadku sam tytuł, bez jego związku z treścią artykułu, więc ten aspekt przy ocenie powinieneś pominąć. '),
                    ],
                  ),
                ),
              ),
              HelpHeaderText(
                text: 'Ranking',
                fontSize: constraints.maxWidth < 600 ? 24 : 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxWidth < 600 ? 9 : 12,
                  horizontal: constraints.maxWidth < 600 ? 9 : 12,
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: 'Jako mały element rozrywki i rywalizacji w aplikacji został dodany ranking. ',
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: constraints.maxWidth < 600 ? 18 : 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: 'Na podstawie ilości oznaczonych nagłówków oraz porównania z pozostałymi użytkownikami zdobywasz punkty, które decydują o twojej pozycji. '),
                      TextSpan(text: 'Mamy nadzieję, że posłuży on jako dodatkowa motywacja, aby pomóc nam w znajdowaniu clickbaitów. '),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class HelpHeaderText extends StatelessWidget {
  final String text;
  final double fontSize;

  const HelpHeaderText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey.shade100,
        fontSize: fontSize,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
