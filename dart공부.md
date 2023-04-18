변수 선언

보통 main 함수 안에서 var

String, int 등도 사용 가능

final → const같음 재선언X

dynamic → 여러 타입 선언 가능!!

javascript에서 처럼 ? 붙여서 nullable 가능

const → compile time constant : 컴파일 시점에 값을 알고 있어야함

late → final, String, var 등 앞에 사용. 나중에 받아온 변수 저장 ex) api로 받아온 데이터

int, String, double, bool → 모두 class

num → int와 double의 부모. 정수 실수 둘다 사용가능

void main() {
  print('hello world');

  bool giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ];

  print(numbers);

var name = 'nico';
  var age = 10;
  var greeting = "Hello everyone, my name is $name. I'm ${age + 2} years old. ";
  print(greeting);

var oldFriends = ["nico", "lily"];
  var newFriends = [
    "Ralph",
    "may",
    "roy",
    for (var friend in oldFriends) "❤️ $friend"
  ];

  print(newFriends);
}