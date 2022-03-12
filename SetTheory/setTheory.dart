//import 'dart:_internal';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

/**********************************************
 * GET AND DISPLAY INTERSECTION
 * ********************************************/
void displayIntersection(List a, List b) {
  var intersect = new List();
  //Counter
  int x = 0;

  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b.length; j++) {
      if (a[i] == b[j]) {
        intersect.insert(x, a[i]);
        x++;
      }
    }
  }
  stdout.write("A intersect B = {${intersect.join(", ")}}\n");
}

/**********************************************
 * GET AND DISPLAY UNION
 * ********************************************/
void displayUnion(List a, List b) {
  //Display A union B
  var union = new List();
  var testA = new List();
  var testB = new List();
  int x = 0;

  //Parsing into dummy arrays
  for (int i = 0; i < a.length; i++) {
    testA.insert(x, a[i]);
    x++;
  }
  x = 0;
  for (int i = 0; i < b.length; i++) {
    testB.insert(x, b[i]);
    x++;
  }

  //Checking for repeat numbers
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b.length; j++) {
      if (a[i] == b[j]) {
        testB.remove(b[j]);
        x++;
      }
    }
  }

  x = 0;

  //Parsing dummy arrays into union
  for (int i = 0; i < testB.length; i++) {
    union.insert(x, testB[i]);
    x++;
  }
  x = 0;
  for (int i = 0; i < testA.length; i++) {
    union.insert(x, testA[i]);
    x++;
  }

  stdout.write("A union B = {${union.join(", ")}}\n");
}

/**********************************************
 * GET AND DISPLAY SUBTRACTION A - B
 * ********************************************/
void displaySubstractionA(List a, List b) {
  var testA = new List();
  int x = 0;

  //Parsing into dummy array
  for (int i = 0; i < a.length; i++) {
    testA.insert(x, a[i]);
    x++;
  }
  x = 0;

  //Checking for repeat numbers and removing them from testA
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b.length; j++) {
      if (a[i] == b[j]) {
        testA.remove(a[i]);
      }
    }
  }

  stdout.write("A - B = {${testA.join(", ")}}\n");
}

/**********************************************
 * GET AND DISPLAY SUBTRACTION B - A
 * ********************************************/
void displaySubstractionB(List a, List b) {
  var testB = new List();
  int x = 0;

  for (int i = 0; i < b.length; i++) {
    testB.insert(x, b[i]);
    x++;
  }
  //Checking for repeat numbers and removing them from testB
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b.length; j++) {
      if (a[i] == b[j]) {
        testB.remove(b[j]);
      }
    }
  }

  stdout.write("B - A = {${testB.join(", ")}}\n");
}

/**********************************************
 * GET AND DISPLAY MULTIPLY A x B
 * ********************************************/
void displayATimesB(List a, List b) {
  stdout.write("A x B = {");

  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b.length; j++) {
      if ((i == a.length - 1) && (j == b.length - 1)) {
        stdout.write("(${a[i]}, ${b[j]})}\n");
      } else {
        stdout.write("(${a[i]}, ${b[j]}), ");
      }
    }
  }
}

/**********************************************
 * GET AND DISPLAY MULTIPLY A x B
 * ********************************************/
void displayBTimesA(List a, List b) {
  stdout.write("B x A = {");

  for (int i = 0; i < b.length; i++) {
    for (int j = 0; j < a.length; j++) {
      if ((i == b.length - 1) && (j == a.length - 1)) {
        stdout.write("(${b[i]}, ${a[j]})}\n");
      } else {
        stdout.write("(${b[i]}, ${a[j]}), ");
      }
    }
  }
}

/**********************************************
 * DISPLAY SETS
 * ********************************************/
void displaySets(List a, List b) {
  stdout.write("A = {${a.join(", ")}}\n");
  stdout.write("B = {${b.join(", ")}}\n");

  displayIntersection(a, b);
  displayUnion(a, b);
  displaySubstractionA(a, b);
  displaySubstractionB(a, b);
  displayATimesB(a, b);
  displayBTimesA(a, b);
}

/**********************************************
 * MAIN
 * ********************************************/
void main(args) {
  if (args.isEmpty) {
    stdout.write("ERROR: Could not find input file\n");
  } else {
    var a = new List();
    var b = new List();
    //Reading in the file and populating arrays "a" and "b"
    new File(args[0].toString()).readAsLines().then((List<String> input) {
      for (var i = 0; i < input.length; i++) {
        if (i == 0) {
          a = input[i].split(' ');
        } else if (i == 1) {
          b = input[i].split(' ');
        }
        ;
      }
      displaySets(a, b);
    });
  }
}
