#include <iostream>

unsigned long long int n, d=1, i=1, m=1;

int main(){
    std::cin >> n;
    while (d<n){
        d+=++i
        m=(m+i-(m%i))+(i*(i-1));
    }
    std::cout << m-(i*(d-n));
    return 0;
}

