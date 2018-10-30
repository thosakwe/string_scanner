module example;

import string_scanner;

void main() {
    auto scanner = new StringScanner("hey");

    while (!scanner.isDone) {
        scanner.readChar();
    }
}