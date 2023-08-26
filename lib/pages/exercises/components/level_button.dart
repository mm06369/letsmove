import 'package:fitness_app_ui/logic/cubit/user/user_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelButton extends StatelessWidget {
  final String title;
  final void Function(String?) onPressed;
  const LevelButton({Key? key, required this.title, required this.onPressed}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
              color: (state.user!.level != title)
                  ? Colors.orange
                  : Colors.deepOrange,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: MaterialButton(
            onPressed: () {
              onPressed(title);
            },
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
