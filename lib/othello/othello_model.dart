class OthelloModel {
  OthelloModel() {
    board = List<OthelloPiece>.filled(64, null);
    board[27] = OthelloPiece.white;
    board[28] = OthelloPiece.black;
    board[35] = OthelloPiece.black;
    board[36] = OthelloPiece.white;
  }

  List<OthelloPiece> board;

  // 仮実装  既に駒が追いてなければtrue
  bool canSetPiece(int index) => board[index] == null;

  void setPiece(int currentIndex, OthelloPiece currentPiece) {
    board[currentIndex] = currentPiece;

    // ひっくり返せるか確認
    // 上方向
    List<int> indexBuffer = <int>[];
    for (int i = currentIndex - 8; i >= 0; i -= 8) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }

    // 下方向
    indexBuffer = <int>[];
    for (int i = currentIndex + 8; i < 64; i += 8) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }

    // 左方向
    indexBuffer = <int>[];
    int row = (currentIndex / 8).floor();
    for (int i = currentIndex - 1; (i / 8).floor() == row; i--) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }

    // 右方向
    indexBuffer = <int>[];
    row = (currentIndex / 8).floor();
    for (int i = currentIndex + 1; (i / 8).floor() == row; i++) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }

    // 左上
    indexBuffer = <int>[];
    row = (currentIndex / 8).floor();
    for (int i = currentIndex - 9;
        i >= 0 && (i / 8).floor() == row - 1;
        i -= 9, row--) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }

    // 右上
    indexBuffer = <int>[];
    row = (currentIndex / 8).floor();
    for (int i = currentIndex - 7;
        i >= 0 && (i / 8).floor() == row - 1;
        i -= 7, row--) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }

    // 左下
    indexBuffer = <int>[];
    row = (currentIndex / 8).floor();
    for (int i = currentIndex + 7;
        i < 64 && (i / 8).floor() == row + 1;
        i += 7, row++) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }

    // 右下
    indexBuffer = <int>[];
    row = (currentIndex / 8).floor();
    for (int i = currentIndex + 9;
        i < 64 && (i / 8).floor() == row + 1;
        i += 9, row++) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        indexBuffer.forEach((int j) => board[j] = currentPiece);
        break;
      }
      indexBuffer.add(i);
    }
  }
}

enum OthelloPiece {
  black,
  white,
}

class OthelloPieceHelper {
  static OthelloPiece anotherPiece(OthelloPiece piece) {
    if (piece == OthelloPiece.black) {
      return OthelloPiece.white;
    } else {
      return OthelloPiece.black;
    }
  }
}
