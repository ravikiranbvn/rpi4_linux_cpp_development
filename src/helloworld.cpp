#include <string>
#include <iostream>
#include <thread>

using namespace std;

void task1(string msg) {
    cout << "task1 says: " << msg << "\n";
}

int main() {
    cout << "start main()" << "\n";
    thread t1(task1, "Hello world");
    t1.join();
    return 0;
}
