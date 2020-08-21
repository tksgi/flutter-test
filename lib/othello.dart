import 'package:flutter/material.dart';

class OthelloScreen extends StatefulWidget {
  const OthelloScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OthelloScreenState();
}

class _OthelloScreenState extends State<OthelloScreen> {
  List<OthelloPiece> board;

  @override
  void initState() {
    super.initState();
    board = List<OthelloPiece>.filled(64, null);
    board[27] = OthelloPiece.white;
    board[28] = OthelloPiece.black;
    board[35] = OthelloPiece.black;
    board[36] = OthelloPiece.white;
  }

  void setPiece(int index) {
    setState(() {
      board[index] = OthelloPiece.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double cellSize = 45;
    final List<Widget> cellList = <Widget>[];
    for (int i = 0; i < board.length; i++) {
      cellList.add(
        Cell(
          cellSize: cellSize,
          piece: board[i],
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

enum OthelloPiece {
  black,
  white,
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
