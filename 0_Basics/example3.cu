#include <stdio.h>
#include <cuda.h>

__global__ void addArrays(int* a, int* b, int* c){
    int i = threadIdx.x;
    c[i] = a[i] + b[i];
}

int main(void){
    const int count = 4;
    int ha[] = {1,2,3,4};
    int hb[] = {10,20,30,40};
    int hc[count];

    int *da, *db, *dc;

    const int gMallocSize = count * sizeof(int);

    cudaMalloc(&da, gMallocSize);
    cudaMalloc(&db, gMallocSize);
    cudaMalloc(&dc, gMallocSize);

    cudaMemcpy(da, ha, gMallocSize, cudaMemcpyHostToDevice);
    cudaMemcpy(db, hb, gMallocSize, cudaMemcpyHostToDevice);

    addArrays<<<1, count>>>(da, db, dc);

    // copia os valores de dc de volta para o array do host
    cudaMemcpy(hc, dc, gMallocSize, cudaMemcpyDeviceToHost);

    // free nos valores alocados pela GPU
    cudaFree(da);
    cudaFree(db);
    cudaFree(dc);

    for(int i = 0; i < count; i++){
        printf("%d ", hc[i]);
    }

    getchar();

    return 0;
}
