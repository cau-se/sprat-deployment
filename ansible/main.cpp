#include <stdio.h>
#include <mpi.h>
#include <iostream>
#include <fstream>
using namespace std;


int main (int argc, char ** argv)
{
  int rank, size;

  MPI_Init (&argc, &argv);	/* starts MPI */
  MPI_Comm_rank (MPI_COMM_WORLD, &rank);	/* get current process id */
  MPI_Comm_size (MPI_COMM_WORLD, &size);	/* get number of processes */
  printf( "Hello world from process %d of %d\n", rank, size );
  MPI_Finalize();
  
  ofstream myfile;
  myfile.open ("simulation/output/example.txt");
  myfile << "Writing this to a file.\n";
  myfile.close();
  
  myfile.open ("simulation/output/example2.txt");
  myfile << "Writing this to a file again.\n";
  myfile.close();
  
  return 0;
}

