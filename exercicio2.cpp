#include <iostream>

using namespace std;

int main() {
    int mtzA[3][3] = {
        {1,2,3},
        {4,5,6},
        {7,8,9}
    };
    
    int mtzB[3][3] = {
        {1,2,3},
        {4,5,6},
        {7,8,9}
    };
    
    int mtzSoma[3][3];
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            mtzSoma[i][j] = mtzA[i][j] + mtzB[i][j];
        }
    }
    
    cout << "Matriz A:\n";
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            cout << mtzA[i][j] << " ";
        }
        cout << endl;
    }
    
    cout << "Matriz B:\n";
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            cout << mtzB[i][j] << " ";
        }
        cout << endl;
    }
    
    
    cout << "Matriz Soma:\n";
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            cout << mtzSoma[i][j] << " ";
        }
        cout << endl;
    }
    
    return 0;
}