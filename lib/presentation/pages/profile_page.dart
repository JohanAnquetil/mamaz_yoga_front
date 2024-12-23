import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_state.dart';
import '../blocs/user/user_status.dart';
import '../theme/app_theme.dart';
import '../utils/get_month_name.dart';
import '../widgets/custom_app_bar.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  static const route = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        print("state: $state");
        if (state.status == UserStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.status == UserStatus.authenticated) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppTheme.goldColor,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: Text(
                        "${state.user.firstName.toString().characters.first}${state.user.lastName.toString().characters.first}",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.user.displayName),
                      Text(state.user.email),
                      // To move = dateTimeParser(state.user.subscriptionEndDate),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    height: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ABONNEMENT",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          flexibleProfileCard(
                            title: "Nom",
                            content: state.user.subscriptionName,
                            backgroundCardColor: AppTheme.goldColor,
                            flexibleSize: 2,
                          ),
                          flexibleProfileCard(
                            title: "Type",
                            content: "Compte",
                            secondLine: state.user.hasAPremiumSubscription
                                ? "Premium"
                                : "gratuit",
                            backgroundCardColor: AppTheme.pinkColor,
                            flexibleSize: 2,
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        flexibleProfileCard(
                          title: "Description de l'abonnement",
                          height: 240,
                          content: state.user.subscriptionDescription,
                          backgroundCardColor: Colors.amber,
                          flexibleSize: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        flexibleProfileCard(
                          title: "Début",
                          content: dateTimeParser(
                              state.user.subscriptionStartedDate),
                          secondLine:
                              DateTime.parse(state.user.subscriptionEndDate)
                                  .year
                                  .toString(),
                          backgroundCardColor: Colors.tealAccent,
                          flexibleSize: 2,
                        ),
                        flexibleProfileCard(
                            title: "Fin",
                            content:
                                dateTimeParser(state.user.subscriptionEndDate),
                            secondLine:
                                DateTime.parse(state.user.subscriptionEndDate)
                                    .year
                                    .toString(),
                            backgroundCardColor: Colors.deepOrangeAccent,
                            flexibleSize: 2)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.status == UserStatus.unauthenticated) {
          return const Center(
            child: Text('Please log in to continue.'),
          );
        }

        if (state.status == UserStatus.error) {
          return Center(
            child: Text(
                'An error occurred: ${state.errorMessage ?? 'Unknown error'}'),
          );
        }

        return const Center(
          child: Text('Unexpected state.'),
        );
      },
    );
  }
}

String dateTimeParser(String date) {
  String parsedDatetime = date.toString();
  String day = DateTime.parse(parsedDatetime).day.toString();
  int month = DateTime.parse(parsedDatetime).month;
  //String year = DateTime.parse(parsedDatetime).year.toString();
  return "$day ${getMonthName(month)}";
}

Flexible flexibleProfileCard({
  required String title,
  required String content,
  String? secondLine,
  required Color backgroundCardColor,
  Color? textColor,
  required int flexibleSize,
  double? height,
}) =>
    Flexible(
      fit: FlexFit.tight,
      flex: flexibleSize,
      child: Card(
        color: backgroundCardColor,
        child: SizedBox(
            height: height ?? 150,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    maxLines: 6,
                  ),
                  if (secondLine != null)
                    Text(
                      secondLine,
                      textAlign: TextAlign.center,
                    )
                ],
              ),
            )),
      ),
    );
