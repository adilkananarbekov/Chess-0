import 'package:chess_app/models/cell.dart';
import 'package:chess_app/models/cell_calculator.dart';
import 'package:chess_app/models/cell_position.dart';
import 'package:chess_app/models/figure.dart';
import 'package:chess_app/models/figures/bishop.dart';
import 'package:chess_app/models/figures/cubic.dart';
import 'package:chess_app/models/figures/goose.dart';
import 'package:chess_app/models/figures/king.dart';
import 'package:chess_app/models/figures/knight.dart';
import 'package:chess_app/models/figures/pawn.dart';
import 'package:chess_app/models/figures/queen.dart';
import 'package:chess_app/models/figures/rook.dart';
import 'package:chess_app/models/game_colors.dart';
import 'package:chess_app/models/lost_figures.dart';
import 'package:flutter/widgets.dart';

const boardSize = 8;

class Board {
  final List<List<Cell>> cells;
  final LostFigures blackLost;
  final LostFigures whiteLost;

  Board(
      {required this.cells, required this.blackLost, required this.whiteLost});

  void createCells() {
    for (int y = 0; y < boardSize; y++) {
      final List<Cell> row = [];
      for (int x = 0; x < boardSize; x++) {
        if ((x + y) % 2 != 0) {
          row.add(Cell.white(board: this, position: CellPosition(x, y)));
        } else {
          row.add(Cell.black(board: this, position: CellPosition(x, y)));
        }
      }
      cells.add(row);
    }
  }

  void pushFigureToLost(Figure lostFigure) {
    if (lostFigure.isBlack) {
      blackLost.push(lostFigure);
    }
    if (lostFigure.isWhite) {
      whiteLost.push(lostFigure);
    }
  }

  Set<String> getAvailablePositionsHash(Cell? selectedCell) {
    return CellCalculator.getAvailablePositionsHash(this, selectedCell);
  }

  Board copyThis() {
    return Board(cells: cells, blackLost: blackLost, whiteLost: whiteLost);
  }

  Cell getCellAt(int x, int y) {
    return cells[y][x];
  }

  void putFigures() {
    _putGooses();
    _putPawns();
    // _putBishops();
    _putKnights();
    _putRooks();
    _putQueens();
    _putKings();
  }

  void _putPawns() {
    for (int i = 0; i < 8; i++) {
      Pawn(color: GameColors.white, cell: getCellAt(i, 6));
      Pawn(color: GameColors.black, cell: getCellAt(i, 1));
    }
  }

  // void _putBishops() {
  //   Bishop(color: GameColors.white, cell: getCellAt(2, 7));
  //   Bishop(color: GameColors.white, cell: getCellAt(5, 7));
  //   Bishop(color: GameColors.black, cell: getCellAt(2, 0));
  //   Bishop(color: GameColors.black, cell: getCellAt(5, 0));
  // }
  void _putGooses() {
    Goose(color: GameColors.white, cell: getCellAt(2, 7));
    Goose(color: GameColors.white, cell: getCellAt(5, 7));
    Goose(color: GameColors.black, cell: getCellAt(2, 0));
    Goose(color: GameColors.black, cell: getCellAt(5, 0));
  }

  void _putKnights() {
    Knight(color: GameColors.white, cell: getCellAt(1, 7));
    Knight(color: GameColors.white, cell: getCellAt(6, 7));
    Knight(color: GameColors.black, cell: getCellAt(1, 0));
    Knight(color: GameColors.black, cell: getCellAt(6, 0));
  }

  void _putRooks() {
    Rook(color: GameColors.white, cell: getCellAt(0, 7));
    Rook(color: GameColors.white, cell: getCellAt(7, 7));
    Rook(color: GameColors.black, cell: getCellAt(0, 0));
    Rook(color: GameColors.black, cell: getCellAt(7, 0));
  }

  void _putKings() {
    King(color: GameColors.white, cell: getCellAt(4, 7));
    King(color: GameColors.black, cell: getCellAt(4, 0));
  }

  void _putQueens() {
    Queen(color: GameColors.white, cell: getCellAt(3, 7));
    Queen(color: GameColors.black, cell: getCellAt(3, 0));
  }
}
