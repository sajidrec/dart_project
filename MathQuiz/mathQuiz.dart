import 'dart:math';
import 'dart:io';

String qSign(int qNum) {
  String holdV = qNum.toString();
  switch (holdV) {
    case "0":
      return "+";
    case "1":
      return "-";
    case "2":
      return "*";
  }
  return "error";
}

int calculateM(int fNum, int sNum, String s) {
  switch (s) {
    case "+":
      return fNum + sNum;
    case "-":
      return fNum - sNum;
    case "*":
      return fNum * sNum;
  }
  return 1;
}

class Quiz {
  String question = "";
  int ans = 0;
  Quiz(int fNum, int sNum, int sN) {
    String s = qSign(sN);
    this.question = "What is the value of ${fNum} ${s} ${sNum}";
    this.ans = calculateM(fNum, sNum, s);
  }
}

void main() {
  Random random = Random();

  Quiz q;

  int fNum, sNum, numOfQuiz, i, score = 0, nSign, usrAns, minNum, maxNum;

  print("Enter the number of questions you want -> ");
  numOfQuiz = int.parse(stdin.readLineSync() as String);

  if (numOfQuiz <= 0) {
    numOfQuiz = 25;
    print("Invalid input. we've set default value 25");
  }

  print(
      "Enter minimum number range must be greater than zero and less than maximum number");
  minNum = int.parse(stdin.readLineSync() as String);

  print("Enter max number range must be greater than zero and minimum number");
  maxNum = int.parse(stdin.readLineSync() as String);

  if (maxNum <= 0) {
    maxNum = 127;
  }
  if (minNum < 0) {
    minNum = 0;
  }
  if (minNum >= maxNum) {
    minNum = 0;
    maxNum = 127;
  }

  print("If you entered any invalid input then we've set our defalut value");

  for (i = 1; i <= numOfQuiz; i++) {
    fNum = random.nextInt(maxNum - minNum) + minNum;
    sNum = random.nextInt(maxNum - minNum) + minNum;
    nSign = random.nextInt(3);
    q = Quiz(fNum, sNum, nSign);
    print(q.question);
    usrAns = int.parse(stdin.readLineSync() as String);
    if (usrAns == q.ans) {
      print("Correct.");
      score++;
    } else {
      print("Wrong. Answer -> ${q.ans}");
    }
  }

  print("****************************************");
  print("Total score ${score} out of ${numOfQuiz}");
  print("****************************************");
}
