#include <stdio.h>
#include <cuda.h>

void addArrays(int* a, int* b, int* c, int count){
    for(int i = 0; i < count; i++){
        c[i] = a[i] + b[i];
    }
}

int main(void){
    const int count = 4;
    int a[] = {1,2,3,4};
    int b[] = {10,20,30,40};
    int c[count];

    addArrays(da, db, dc, count);

    for(int i = 0; i < count; i++){
        printf("%d", hc[i]);
    }

    getchar();

    return 0;
}
