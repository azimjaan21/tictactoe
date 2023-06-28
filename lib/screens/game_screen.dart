import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameScreen extends StatefulWidget {
  final String player1;
  final String player2;
  const GameScreen({
    super.key,
    required this.player1,
    required this.player2,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board = [];
  String currentplayer = 'x';
  String winner = '';

  @override
  void initState() {
    board = List.filled(9, '');
    _resetgame();
    super.initState();
  }

  void _switchplayer() {
    currentplayer = currentplayer == 'x' ? 'o' : 'x';
  }

  void _playmove(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentplayer;
        _switchplayer();
        _checkwinner();
      });
    }
  }

  // check who win
  void _checkwinner() {
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var line in lines) {
      var a = board[line[0]];
      var b = board[line[1]];
      var c = board[line[2]];

      if (a == b && b == c && a != '') {
        winner = a;
        break;
      }
    }

    if (winner == '' && !board.contains('')) {
      winner = 'No!';
    }

    if (winner != '') {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        btnOkText: 'Play Again',
        title: winner == 'x'
            ? '${widget.player1} Won!'
            : winner == 'o'
                ? "${widget.player2} Won!"
                : "It's Draw!",
        btnOkOnPress: () {},
      ).show();
    }
  }

  //reset
  void _resetgame() {
    board = List.filled(9, '');
    winner = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            winner == '' ? 'Turn' ' - ( $currentplayer ),' : ' Winner: $winner',
            style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: currentplayer == 'o'
                    ? const Color.fromARGB(255, 237, 16, 0)
                    : currentplayer == 'x'
                        ? Colors.blue[900]
                        : null,),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 324,
              height: 324,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 170, 170, 170),
                    offset: Offset(1, 1),
                    blurRadius: 30,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 170, 170, 170),
                    offset: Offset(-1, -1),
                    blurRadius: 30,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: GridView.count(
                  padding: const EdgeInsets.all(0),
                  crossAxisCount: 3,
                  children: List.generate(
                    9,
                    (index) => GestureDetector(
                      onTap: () => _playmove(index),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color.fromARGB(255, 170, 170, 170),
                              width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: board[index] != ''
                              ? SvgPicture.asset(board[index] == 'x'
                                  ? 'assets/svg/x.svg'
                                  : 'assets/svg/o.svg')
                              : const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          if (winner != '') ...{
            GestureDetector(
              onTap: () {
                setState(() {
                  _resetgame();
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(217, 255, 55, 0),
                      Color.fromARGB(255, 255, 34, 0)
                    ],
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Restart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.restart_alt_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          }
        ],
      ),
    );
  }
}
