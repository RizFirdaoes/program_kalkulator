import 'dart:io';

void main() {
  while (true) {
    print("KALKULATOR");
    print("NIP : ARN192-18162");
    print("Menu :");
    print("1. Perkalian");
    print("2. Pembagian");
    print("3. Hitung Luas Lingkaran");
    print("4. Hitung Volume Balok");
    print("5. Keluar");

    stdout.write("Masukkan pilihan (1-5): ");
    String? choice = stdin.readLineSync();

    if (choice == null) {
      print("Input tidak valid. Coba lagi.");
      continue;
    }

    switch (choice) {
      case '1':
        performOperation("Perkalian", (a, b) => a * b);
        break;
      case '2':
        performOperation("Pembagian", (a, b) {
          if (b == 0) {
            print("Tidak dapat melakukan pembagian dengan nol.");
            return double.nan;
          } else {
            return a / b;
          }
        });
        break;
      case '3':
        calculateCircleArea();
        break;
      case '4':
        calculateBoxVolume();
        break;
      case '5':
        print("Program berakhir.");
        return;
      default:
        print("Pilihan tidak valid. Coba lagi.");
    }
  }
}

void performOperation(
    String operationName, double Function(double, double) operation) {
  stdout.write("Masukkan angka pertama: ");
  double? num1 = double.tryParse(stdin.readLineSync() ?? '');

  if (num1 == null) {
    print("Input tidak valid. Coba lagi.");
    return;
  }

  stdout.write("Masukkan angka kedua: ");
  double? num2 = double.tryParse(stdin.readLineSync() ?? '');

  if (num2 == null) {
    print("Input tidak valid. Coba lagi.");
    return;
  }

  double result = operation(num1, num2);
  print("$operationName: $num1 dan $num2 = $result");
}

void calculateCircleArea() {
  stdout.write("Masukkan jari-jari lingkaran: ");
  double? radius = double.tryParse(stdin.readLineSync() ?? '');

  if (radius == null || radius <= 0) {
    print("Input tidak valid. Jari-jari harus lebih besar dari 0. Coba lagi.");
    return;
  }

  double area = 3.14 * radius * radius;
  print("Luas Lingkaran dengan jari-jari $radius adalah $area");
}

void calculateBoxVolume() {
  stdout.write("Masukkan panjang balok: ");
  double? length = double.tryParse(stdin.readLineSync() ?? '');

  if (length == null || length <= 0) {
    print("Input tidak valid. Panjang harus lebih besar dari 0. Coba lagi.");
    return;
  }

  stdout.write("Masukkan lebar balok: ");
  double? width = double.tryParse(stdin.readLineSync() ?? '');

  if (width == null || width <= 0) {
    print("Input tidak valid. Lebar harus lebih besar dari 0. Coba lagi.");
    return;
  }

  stdout.write("Masukkan tinggi balok: ");
  double? height = double.tryParse(stdin.readLineSync() ?? '');

  if (height == null || height <= 0) {
    print("Input tidak valid. Tinggi harus lebih besar dari 0. Coba lagi.");
    return;
  }

  double volume = length * width * height;
  print(
      "Volume Balok dengan panjang $length, lebar $width, dan tinggi $height adalah $volume");
}
