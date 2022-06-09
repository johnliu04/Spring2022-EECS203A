#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define ROWS		480
#define COLUMNS		640

#define sqr(x)		((x)*(x))

void Histogram_Equalization(unsigned char image[ROWS][COLUMNS], unsigned char HE_image[ROWS][COLUMNS]){
    unsigned long size = ROWS * COLUMNS;
    unsigned char data[size];
    unsigned long hist[256] = {0};
    unsigned long EQhist[256] = {0};
    int index = 0;
    for(int i = 0; i < ROWS; i++){
        for(int j = 0; j < COLUMNS; j++){
            data[index] = image[i][j];
            index++;
        }
    }
    for(int i = 0; i < size; i++){
        hist[data[i]] += 1;
    }
    int value = 0;
    for(int i = 0; i < 256; i++){
        value += hist[i];
    }
    printf("%d\n",value);
    unsigned long val = 0;
    for(int i = 0; i < 256; i++){
        val += 256 * (hist[i] << 16) / size;
        EQhist[i] = (val >> 16) & 0xff;
    }
    for(int i = 0; i < size; i++){
        data[i] = EQhist[data[i]] & 0xff;
    }
    for(int i = 0; i < ROWS; i++){
        for(int j = 0; j < COLUMNS; j++){
            HE_image[i][j] = data[i * COLUMNS + j];
        }
    }
}

int main( int argc, char **argv )
{

	int		i;
	FILE		*fp;
	char		*ifile, *ofile;
	unsigned char	image[ROWS][COLUMNS];

	if ( argc != 3 )
	{
	    fprintf( stderr, "usage: %s input output\n", argv[0] );
	    exit( 1 );
	}

	ifile = argv[1];
	ofile = argv[2];

	if (( fp = fopen( ifile, "rb" )) == NULL )
	{
	  fprintf( stderr, "error: couldn't open %s\n", ifile );
	  exit( 1 );
	}			

	for ( i = 0; i < ROWS ; i++ )
	  if ( fread( image[i], 1, COLUMNS, fp ) != COLUMNS )
	  {
	    fprintf( stderr, "error: couldn't read enough stuff\n" );
	    exit( 1 );
	  }
	fclose( fp );

	unsigned char HE_image[ROWS][COLUMNS];
    Histogram_Equalization(image, HE_image);


	if (( fp = fopen( ofile, "wb" )) == NULL )
	{
	  fprintf( stderr, "error: could not open %s\n", ofile );
	  exit( 1 );
	}
	for ( i = 0 ; i < ROWS ; i++ ) fwrite( HE_image[i], 1, COLUMNS, fp );
	fclose( fp );

	return 0;
}

