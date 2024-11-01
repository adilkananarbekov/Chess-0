import 'package:chess_app/bloc/cubits/game_cubit.dart';
import 'package:chess_app/bloc/states/game_state.dart';
import 'package:chess_app/config/colors.dart';
import 'package:chess_app/ui/board_widget.dart';
import 'package:chess_app/ui/lost_figures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GameEndPage extends StatelessWidget {
  const GameEndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Game has done!",
                style: TextStyle(
                  fontSize: 40,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
