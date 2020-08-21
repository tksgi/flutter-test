import 'package:flutter/material.dart';
import 'package:flutter_test_repository/othello/othello_model.dart';

class OthelloScreen extends StatefulWidget {
  const OthelloScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OthelloScreenState();
}

class _OthelloScreenState extends State<OthelloScreen> {
  OthelloModel othelloModel;
  OthelloPiece currentTurn;

  @override
  void initState() {
    super.initState();
    currentTurn = OthelloPiece.black;
    othelloModel = OthelloModel();
  }

  void setPiece(int index) {
    if (!othelloModel.canSetPiece(index)) {
      return;
    }
    setState(() {
      othelloModel.setPiece(index, currentTurn);
      currentTurn = OthelloPieceHelper.anotherPiece(currentTurn);
    });
  }

  @override
  Widget build(BuildContext context) {
    const double cellSize = 45;
    final List<Widget> cellList = <Widget>[];
    for (int i = 0; i < othelloModel.board.length; i++) {
      cellList.add(
        Cell(
          cellSize: cellSize,
          piece: othelloModel.board[i],
          index: i,
          setPiece: setPiece,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('オセロ'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          Center(
            child: Container(
              width: 8.0 * cellSize,
              height: 8.0 * cellSize,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: GridView.count(
                crossAxisCount: 8,
                children: cellList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cell extends StatelessWidget {
  const Cell({
    @required this.cellSize,
    @required this.piece,
    @required this.index,
    @required this.setPiece,
  });
  final double cellSize;
  final OthelloPiece piece;
  final int index;
  final Function setPiece;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: cellSize,
          height: cellSize,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: _pieceWidget(),
        ),
      ),
      onTap: () => setPiece(index),
    );
  }

  Widget _pieceWidget() {
    return piece == null
        ? null
        : Container(
            width: cellSize - 5,
            height: cellSize - 5,
            decoration: BoxDecoration(
              color: piece == OthelloPiece.black ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
          );
  }
}
