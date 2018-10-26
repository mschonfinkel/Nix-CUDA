#include <iostream>
#include <cuda.h>

using namespace std;

int main(void){
    int count;
    cudaGetDeviceCount(&count);

    cudaDeviceProp prop;

    for(int i=0; i < count; i++){
        cudaGetDeviceProperties(&prop, i);
        cout << "Device " << i << ": " << prop.name << endl;
        cout << "Compute Capability: " << prop.major << prop.minor << endl;
        cout << "Max Grid Dimensions: (" <<
            prop.maxGridSize[0] << " x " <<
            prop.maxGridSize[1] << " x " <<
            prop.maxGridSize[2] << " )"  << endl;
        cout << "Max Block Dimensions: (" <<
            prop.maxThreadsDim[0] << " x " <<
            prop.maxThreadsDim[1] << " x " <<
            prop.maxThreadsDim[2] << " )"  << endl;
    }

    getchar();

    return 0;
}
