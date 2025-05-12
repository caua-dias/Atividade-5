#include <iostream>
#include <cctype>

using namespace std;

int main()
{
    string texto = "Hello World 123";
    
    int vogais = 0;
    int consoantes = 0;
    int digitos = 0;
    int espaco = 0;
    
    for (char c : texto) {
        if (isspace(c)) {
            espaco++;
        } else if (isdigit(c)) {
            digitos++;
            
        } else if (isalpha(c)) {
            char lower = tolower(c);
            if (lower == 'a' | lower == 'e' | lower == 'i'| lower == 'o' | lower == 'u') {
                vogais++;
            } else {
                consoantes++;
            }
        }
    }
    
    cout << "Vogais: " << vogais << endl;
    cout << "Consoantes: " << consoantes << endl;
    cout << "Digitos: " << digitos << endl;
    cout << "Quantidade de espaços: " << espaco << endl;
    
    return 0;
    
}