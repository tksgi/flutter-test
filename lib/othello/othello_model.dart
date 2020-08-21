class OthelloModel {
  OthelloModel() {
    board = List<OthelloPiece>.filled(64, null);
    board[27] = OthelloPiece.white;
    board[28] = OthelloPiece.black;
    board[35] = OthelloPiece.black;
    board[36] = OthelloPiece.white;
  }

  List<OthelloPiece> board;

  bool canSetPiece(int index) => board[index] == null;

  void setPiece(int index, OthelloPiece piece) {
    board[index] = piece;
  }
}

enum OthelloPiece {
  black,
  white,
}
