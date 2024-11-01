import 'package:chess_app/models/board.dart';
import 'package:chess_app/models/cell_position.dart';
import 'package:chess_app/models/figure.dart';
import 'package:chess_app/models/figures/goose.dart';
import 'package:chess_app/models/game_colors.dart';

class Cell {
  final GameColors color;
  final Board board;
  final CellPosition position;
  Figure? _figure;

  bool get occupied => _figure != null;
  bool get isBlack => color == GameColors.black;
  bool get isWhite => color == GameColors.white;
  String get positionHash => '${position.x}-${position.y}';

  Cell({required this.color, required this.board, required this.position});
  Cell.white({required this.board, required this.position})
      : color = GameColors.white;
  Cell.black({required this.board, required this.position})
      : color = GameColors.black;

  void setFigure(Figure? figure) {
    _figure = figure;
    //figure?.onMoved(this);
  }

  Figure? getFigure() {
    return _figure;
  }

  bool occupiedByEnemy(Cell target) {
    if (target.occupied) {
      assert(occupied);
      return _figure!.color != target.getFigure()!.color;
    }
    return false;
  }

  void moveFigure(Cell target) {
    if (!occupied) {
      return;
    }
    final figure = _figure!;
    if (figure.availableForMove(target)) {
      if (target.occupied) {
        assert(target.getFigure() != null);
        board.pushFigureToLost(target.getFigure()!);
      }
      target.setFigure(figure);
      figure.onMoved(target);
      _figure = null;
    }
  }
}
