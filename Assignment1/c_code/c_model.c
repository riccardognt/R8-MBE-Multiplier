#include<stdio.h>
#include<stdint.h>

int main ()
{
  union u_num {
    float xf;
    uint32_t xi;
  } num;

  FILE *fd;
  fd = fopen("results_c.txt", "w");
  int i;
  float a[10] = {15.0, 204.0, 1024.0, -15.0, -204.0, -1024.0, 3.0, -69.75, 575.345, 27.0 };
  float b[10] = {204.0, 1024.0, -15.0, -204.0, -1024.0, 15.0, 6.5, -49.7, 623.8, -152.0 };
  //uint32_t hex_tmp;

  if(fd==NULL){
    perror("can't open the file");
    exit(1);
  }

  for(i=0; i<10;i++){
    num.xf = (a[i]*b[i]);
    //hex_tmp = num.xi;

    fprintf(fd,"%i\n", num.xi);
  }

  fclose(fd);


  return 0;
}

