#include <stdio.h>
#include <stdlib.h>

#define ROWS		480
#define COLUMNS		640

#define sqr(x)		((x)*(x))

void subsampling(int subsample_rate, unsigned char image[ROWS][COLUMNS], unsigned char subsampled_image[ROWS/subsample_rate][COLUMNS/subsample_rate]){
	for(int i = 0; i < ROWS/subsample_rate; i++){
		for(int j = 0; j < COLUMNS/subsample_rate; j++){
			subsampled_image[i][j] = image[i*subsample_rate][j*subsample_rate];
		}
	}
}

void nearest_neighbor_interpolation(int subsample_rate, unsigned char subsampled_image[ROWS/subsample_rate][COLUMNS/subsample_rate], unsigned char interpolated_image[ROWS][COLUMNS]){
	for(int i = 0; i < ROWS/subsample_rate; i++){
		for(int j = 0; j < COLUMNS/subsample_rate; j++){
			for(int m = 0; m<subsample_rate; ++m){
				for(int n = 0; n<subsample_rate; ++n){
					interpolated_image[i*subsample_rate + n][j*subsample_rate + m] = subsampled_image[i][j];
				}
			}
		} 
	}
}

int main( int argc, char **argv )
{

	int		i;
	int		threshold;
	FILE		*fp;
	char		*ifile, *ofile1, *ofile2;
	unsigned char	image[ROWS][COLUMNS];

	if ( argc != 5 )
	{
	    fprintf( stderr, "usage: %s input subsample_output interpolation_output subsample_rate\n", argv[0] );
	    exit( 1 );
	}

	ifile = argv[1];
	ofile1 = argv[2];
	ofile2 = argv[3];
	threshold = atoi(argv[4]);

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

	unsigned char subsampled_image[ROWS/threshold][COLUMNS/threshold];
	subsampling(threshold, image, subsampled_image);
	if (( fp = fopen( ofile1, "wb" )) == NULL )
	{
	  fprintf( stderr, "error: could not open %s\n", ofile1 );
	  exit( 1 );
	}
	int row = ROWS/threshold;
	int col = COLUMNS/threshold;
	for ( i = 0 ; i < row ; i++ ) fwrite( subsampled_image[i], 1, col, fp );
	fclose( fp );

	unsigned char interpolated_image[ROWS][COLUMNS];
	nearest_neighbor_interpolation(threshold, subsampled_image, interpolated_image);
	if (( fp = fopen( ofile2, "wb" )) == NULL )
	{
	  fprintf( stderr, "error: could not open %s\n", ofile2 );
	  exit( 1 );
	}
	for ( i = 0 ; i < ROWS ; i++ ) fwrite( interpolated_image[i], 1, COLUMNS, fp );
	fclose( fp );

	return 0;
}

