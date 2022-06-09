#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define ROWS		480
#define COLUMNS		640

#define sqr(x)		((x)*(x))

void GLT(float gamma, unsigned char image[ROWS][COLUMNS], unsigned char GLT_image[ROWS][COLUMNS]){
	float c = 255.0 / pow(255.0, gamma);
	for(int i = 0; i < ROWS; i++){
		for(int j = 0; j < COLUMNS; j++){
			GLT_image[i][j] = (int)(c * pow(image[i][j], gamma));
		}
	}
}

int main( int argc, char **argv )
{

	int		i;
	float		gamma;
	FILE		*fp;
	char		*ifile, *ofile;
	unsigned char	image[ROWS][COLUMNS];

	if ( argc != 4 )
	{
	    fprintf( stderr, "usage: %s input output gamma\n", argv[0] );
	    exit( 1 );
	}

	ifile = argv[1];
	ofile = argv[2];
	gamma = atof(argv[3]);

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

	unsigned char GLT_image[ROWS][COLUMNS];
	GLT(gamma, image, GLT_image);

	if (( fp = fopen( ofile, "wb" )) == NULL )
	{
	  fprintf( stderr, "error: could not open %s\n", ofile );
	  exit( 1 );
	}
	for ( i = 0 ; i < ROWS ; i++ ) fwrite( GLT_image[i], 1, COLUMNS, fp );
	fclose( fp );

	return 0;
}

