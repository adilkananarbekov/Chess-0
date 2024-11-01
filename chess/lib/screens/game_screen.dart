import 'package:chess_app/bloc/cubits/game_cubit.dart';
import 'package:chess_app/bloc/states/game_state.dart';
import 'package:chess_app/config/colors.dart';
import 'package:chess_app/models/figure.dart';
import 'package:chess_app/models/game-end.dart';
import 'package:chess_app/ui/board_widget.dart';
import 'package:chess_app/ui/lost_figures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<GameCubit, GameState>(
        bloc: GetIt.I<GameCubit>(),
        listener: (context, state) {
          // Check the global `route` flag to trigger navigation
          // if (route) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => const GameEndPage(),
          //     ),
          //   );
          //   route = false; // Reset route after navigation
          // }
        },
        child: BlocBuilder<GameCubit, GameState>(
          bloc: GetIt.I<GameCubit>(),
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LostFiguresWidget(figures: state.board.blackLost.figures),
                BoardWidget(
                  availablePositionsHash: state.availablePositionsHash,
                  board: state.board,
                  selectedCell: state.selectedCell,
                ),
                LostFiguresWidget(figures: state.board.whiteLost.figures),
              ],
            );
          },
        ),
      ),
    );
  }
}
