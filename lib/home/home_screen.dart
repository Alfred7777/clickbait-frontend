import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickbait_app/widgets/top_bar.dart';
import 'package:clickbait_app/widgets/clickbait_button.dart';
import 'package:clickbait_app/repositories/user_repository.dart';
import 'package:clickbait_app/repositories/title_repository.dart';
import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final userRepository = UserRepository();
  final titleRepository = TitleRepository();
  late HomeBloc _homeBloc;
  late TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(
      userRepository: userRepository,
      titleRepository: titleRepository,
    );
    _usernameController = TextEditingController();
  }

  void _onSendAnswer(String eventID, bool? answer) {
    _homeBloc.add(
      SendAnswer(
        eventID: eventID,
        answer: answer,
      ),
    );
  }

  void _onCreateAccount() {
    _homeBloc.add(
      CreateUser(
        username: _usernameController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade800,
          body: Column(
            children: <Widget>[
              const TopBar(),
              Expanded(
                child: BlocConsumer(
                  bloc: _homeBloc,
                  listener: (context, state) {
                    if (state is CreateUserFailure) {
                      var snackBar = SnackBar(
                        content: Text(state.error),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red.shade400,
                      );
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state is FetchTitleFailure) {
                      var snackBar = SnackBar(
                        content: Text(state.error),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.red.shade400,
                      );
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  buildWhen: (previous, current) {
                    if (current is HomeLoading) {
                      return false;
                    }
                    if (current is CreateUserFailure) {
                      return false;
                    }
                    if (current is FetchTitleFailure) {
                      return false;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    if (state is HomeUninitialized) {
                      _homeBloc.add(CheckUserID());
                    }
                    if (state is HomeAccount) {
                      _homeBloc.add(FetchTitle());
                    }
                    if (state is HomeNoAccount) {
                      return CreateAccountForm(
                        usernameController: _usernameController,
                        onButtonPressed: _onCreateAccount,
                      );
                    } else if (state is HomeReady) {
                      return HomeLayout(
                        title: state.title,
                        onButtonPressed: _onSendAnswer,
                      );
                    } else {
                      return HomePlaceholder(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: constraints.maxWidth < 600 ? 18 : 24,
                            horizontal: constraints.maxWidth < 600 ? 18 : 24,
                          ),
                          child: CircularProgressIndicator(
                            color: Colors.grey.shade100,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class HomeLayout extends StatelessWidget {
  final ArticleTitle title;
  final Function onButtonPressed;

  const HomeLayout({
    Key? key,
    required this.title,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth < 600 ? 18 : 24,
                  ),
                  child: ClickbaitTitle(
                    title: title.content,
                    fontSize: constraints.maxWidth < 600 ? 24 : 28,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: constraints.maxWidth < 600 ? 24 : 32,
                horizontal: constraints.maxWidth < 600 ? 18 : 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClickbaitButton(
                    text: 'TAK',
                    icon: Icons.check,
                    primaryColor: Colors.green.shade300,
                    secondaryColor: Colors.green.shade400,
                    fontSize: constraints.maxWidth < 600 ? 36 : 44,
                    onPressed: () {
                      onButtonPressed(title.titleID, true);
                    },
                  ),
                  ClickbaitButton(
                    text: 'NIE',
                    icon: Icons.close,
                    primaryColor: Colors.red.shade300,
                    secondaryColor: Colors.red.shade400,
                    fontSize: constraints.maxWidth < 600 ? 36 : 44,
                    onPressed: () {
                      onButtonPressed(title.titleID, false);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: constraints.maxWidth < 600 ? 108 : 144,
              ),
              child: ClickbaitButton(
                text: 'POMIŃ',
                icon: Icons.skip_next,
                primaryColor: Colors.lightBlue.shade600,
                secondaryColor: Colors.lightBlue.shade700,
                fontSize: constraints.maxWidth < 600 ? 36 : 44,
                onPressed: () {
                  onButtonPressed(title.titleID, null);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class HomePlaceholder extends StatelessWidget {
  final Widget child;

  const HomePlaceholder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxWidth < 600 ? 18 : 24,
            horizontal: constraints.maxWidth < 600 ? 18 : 24,
          ),
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(
                constraints.maxWidth < 600 ? 24 : 32,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                constraints.maxWidth < 600 ? 24 : 32,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CreateAccountForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController;
  final Function onButtonPressed;

  CreateAccountForm({
    Key? key,
    required this.usernameController,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxWidth < 600 ? 64 : 96,
                  left: constraints.maxWidth < 600 ? 24 : 32,
                  right: constraints.maxWidth < 600 ? 24 : 32,
                ),
                child: Text(
                  'Aby kontynuować musisz utworzyć swoją nazwe użytkownika! Dodatkowo w zakładce POMOC znajdziesz informacje, które pomogą Ci korzystać z aplikacji.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade100,
                    fontSize: constraints.maxWidth < 600 ? 18 : 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxWidth < 600 ? 24 : 32,
                  bottom: constraints.maxWidth < 600 ? 24 : 32,
                  left: constraints.maxWidth < 600 ? 18 : 24,
                  right: constraints.maxWidth < 600 ? 18 : 24,
                ),
                child: TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nazwa użytkownika nie może być pusta!';
                    } else if (value.length < 3) {
                      return 'Nazwa użytkownika musi być dłuższa niż 3 znaki!';
                    } else if (value.length > 20) {
                      return 'Nazwa użytkownika musi być krótsza niż 20 znaków!';
                    } else if (!RegExp(r'^[A-Za-z0-9_]+$').hasMatch(value)) {
                      return 'Nazwa użytkownika zawiera niedozwolone znaki!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                        constraints.maxWidth < 600 ? 24 : 32,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: constraints.maxWidth < 600 ? 16 : 24,
                      horizontal: constraints.maxWidth < 600 ? 24 : 30,
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: constraints.maxWidth < 600 ? 20 : 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: constraints.maxWidth < 600 ? 20 : 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: constraints.maxWidth < 600 ? 12 : 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    errorMaxLines: 3,
                    fillColor: Colors.blueGrey.shade900,
                    filled: true,
                  ),
                  style: TextStyle(
                    color: Colors.grey.shade100,
                    fontSize: constraints.maxWidth < 600 ? 20 : 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ClickbaitButton(
                text: 'UTWÓRZ',
                icon: null,
                primaryColor: Colors.lightBlue.shade600,
                secondaryColor: Colors.lightBlue.shade700,
                fontSize: constraints.maxWidth < 600 ? 28 : 36,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    onButtonPressed();
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ClickbaitTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const ClickbaitTitle({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
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
