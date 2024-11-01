enum FigureTypes {
  king,
  knight,
  pawn,
  queen,
  rook,
  bishop,
  goose,
  cubic,
}

extension ParseToString on FigureTypes {
  String toName() {
    return toString().split('.').last;
  }
}
