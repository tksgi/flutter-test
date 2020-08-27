class OthelloModel {
  OthelloModel() {
    board = List<OthelloPiece>.filled(64, null);
    board[27] = OthelloPiece.white;
    board[28] = OthelloPiece.black;
    board[35] = OthelloPiece.black;
    board[36] = OthelloPiece.white;
  }

  List<OthelloPiece> board;
  bool isGameOver = false;
  Map<OthelloPiece, int> pieceCount = <OthelloPiece, int>{
    OthelloPiece.black: 2,
    OthelloPiece.white: 2,
  };

  bool canSetPiece(int currentIndex, OthelloPiece currentPiece) {
    if (board[currentIndex] != null) return false;

    // 上方向
    List<int> indexBuffer = <int>[];
    for (int i = currentIndex - 8; i >= 0; i -= 8) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        if (indexBuffer.length > 0) return true;
        break;
      }
      indexBuffer.add(i);
    }

    // 下方向
    indexBuffer = <int>[];
    for (int i = currentIndex + 8; i < board.length; i += 8) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        if (indexBuffer.length > 0) return true;
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
        if (indexBuffer.length > 0) return true;
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
        if (indexBuffer.length > 0) return true;
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
        if (indexBuffer.length > 0) return true;
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
        if (indexBuffer.length > 0) return true;
        break;
      }
      indexBuffer.add(i);
    }

    // 左下
    indexBuffer = <int>[];
    row = (currentIndex / 8).floor();
    for (int i = currentIndex + 7;
        i < board.length && (i / 8).floor() == row + 1;
        i += 7, row++) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        if (indexBuffer.length > 0) return true;
        break;
      }
      indexBuffer.add(i);
    }

    // 右下
    indexBuffer = <int>[];
    row = (currentIndex / 8).floor();
    for (int i = currentIndex + 9;
        i < board.length && (i / 8).floor() == row + 1;
        i += 9, row++) {
      if (board[i] == null) {
        break;
      }
      if (board[i] == currentPiece) {
        if (indexBuffer.length > 0) return true;
        break;
      }
      indexBuffer.add(i);
    }
    return false;
  }

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
    for (int i = currentIndex + 8; i < board.length; i += 8) {
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
        i < board.length && (i / 8).floor() == row + 1;
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
        i < board.length && (i / 8).floor() == row + 1;
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
    setPieceCount();
    isGameOver = confirmGameOver(OthelloPieceHelper.anotherPiece(currentPiece));
  }

  void setPieceCount() {
    pieceCount = <OthelloPiece, int>{
      OthelloPiece.black: 0,
      OthelloPiece.white: 0,
    };
    for (final OthelloPiece cell in board) {
      if (cell == null) continue;
      pieceCount[cell]++;
    }
  }

  bool confirmGameOver(OthelloPiece piece) {
    for (int i = 0; i < board.length; i++) {
      if (canSetPiece(i, piece)) return false;
    }
    return true;
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
