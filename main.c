#include <stdio.h>
#include <stdlib.h>
#pragma warning(disable : 4996)
/** Team: Dragos, Manuel, Theo
Extract.exe - the program that is required to build the histogram, save the pixels in a dynamic array and constructs the Idx and writes in the target file the points of the traces and the control points.
The program takes as arguments the paths to the Pixmap.bin and to the Traces.txt files, as strings.
The program returns the Idx string of the colour of the traces and the control points and writes in the target file the points of the traces and the control points.

Revisions
29/09/2024 changed everything to use pointers and the program now constructs a primitive, not MatLab compatible Traces.txt(Dragos)
30/09/2024 the program now reads the height and length of the image (Manuel), the program now takes as arguments the paths to the Pixmap.bin and Traces.txt (Dragos)
07/10/2024 The Idx should in theory work (Theo), and added the pragma (idk if it messes with you guys)
Added the following error codes (based on slide 52 in the project presentation):
pas assez de pixels returns -1
profondeur pas 8 returns -2
erreur ouverture fichier d'entree returns -3
largeur/hauteur en dehors de bornes returns -4
pas le bon nombre de parametres returns -5
erreur ouverture fichier de sortie returns -6
pas de traces returns -7
pas de corners returns -8
The program continues if trop de pixels or plus de 5 traces.

Fixed bug that only the first 4 colours were printed (Dragos)
Tested all the examples on moodle, all of them work with no bugs. (Dragos)

*/

//this function takes the position in the pixmap vector and the largeur of the image, and outputs the corresponding x and y coordinates
//counted from the top right corner (0, 0)
void calc_coords(int i, unsigned short largeur, unsigned short *x, unsigned short *y)
{
    *x=i%largeur;
    *y=i/largeur; //maths in the documentation
}
int main(int argc, const char * argv[])
{
    FILE *fin;
    if(argc!=3)
    {
        perror("pas le bon nombre de parametres"); //error management if the number of arguments isnt good
        return -5;
    }
    fin = fopen(argv[1], "rb");//opening the file in byte mode, opens the path to Pixmap.bin

    if(fin==NULL)
    {
        perror("erreur ouverture \n"); //error management if failed to open the file
        return -3;
    }


    //read prof, larg, haut like on slide 27, the file pointer should move by itself
    //read the first 3 bytes, size of the image, width in pixels, height in pixels
    unsigned short *proflarghaut; //profondeur largeur hauteur
    proflarghaut = malloc(3*sizeof(unsigned short)); // what about big files
    size_t errf3b=fread(proflarghaut, sizeof(unsigned short), 3, fin); //read proflarghaut

    unsigned short profondeur = proflarghaut[0]; //assign the read values to variables
    unsigned short largeur = proflarghaut[1];
    unsigned short hauteur = proflarghaut[2];

    /*debug: print size, width and hight of the binfile
        printf("Profondeur= %d \nLargeur= %d \nHauteur= %d \n", profondeur, largeur, hauteur);
    */
    if(profondeur!=8)
    {
        perror("profondeur pas 8"); //error management if the depth isnt 8
        return -2;
    }
    if(hauteur<=100 || 1000<=hauteur || largeur<=100 || 1000<=largeur)
    {
        perror("largeur/hauteur en dehors de bornes"); //error management if the size of the image is outside the limits
        return -4;
    }
    int size=hauteur*largeur;
    //make the Pixmap in a tableau dynamique
    unsigned char *Pixmap;
    Pixmap=calloc(size, sizeof(unsigned char));
    size_t read=fread(Pixmap, sizeof(unsigned char), size, fin);
    if(read<size)
    {
        perror("pas assez de pixels"); //error if the number of pixels read is less than the size
        return -1;
    }
    //construct the histogram
    int *histo;
    histo=calloc(256, sizeof(int)); //declare the histogram, use of calloc instead of malloc to initiallise all to 0
    int i;
    for(i=0; i<hauteur*largeur; i++) //build the histogram
    {
        histo[Pixmap[i]]++;
    }


    fclose(fin); //closing pixmap file


    //determine colours of the traces and of the control points
    unsigned char *colours, colour_control_points;
    int found_corner=0; //will turn to 1 if we find a corner, used for error management
    int j=0; //start at the first element in colours
    colours=calloc(256, sizeof(unsigned char));
    //after this code runs, in the variable j will store the number of traces found
    for(int i=0; i<256; i++)
    {
        if(50<=histo[i] && histo[i]<=300) //traces
        {
            colours[j]=i;
            j++; //move the current position in the stack (colours)
        }
        if(histo[i]==4)
        {
             colour_control_points=i; //control points
             found_corner=1; //we found the control points
        }

    }
    if(found_corner==0) //we didnt find any control points, so error
    {
        perror("pas de corners");
        return -8;
    }
    /*
    debug: print the histogram
    for(int i=0; i<256; i++)
    {
        if(histo[i]!=0) printf("%d %d \n", i, histo[i]);
    }
    */


    //sort colours to find the 5 largest ones
    //here j has become the total number of traces

    if(j==0) //check if there are no traces
    {
        perror("pas de traces");
        return -7;
    }

    int k;
    for(i=0; i<j; i++) //bubble sort the colours
       for(k=i; k<j; k++)
    {
        if(histo[colours[i]]<histo[colours[k]]) //sort them in function of the histogram
        {
            unsigned char aux;
            aux=colours[i];
            colours[i]=colours[k];
            colours[k]=aux;
        }
    }

    /*
    debug: print the colours and the number of pixels
    for(i=0; i<j; i++)
    {
        printf("%d %d \n", colours[i], histo[colours[i]]);
    }
    */

    //at this point we have a vector of colours in decreasing order of number of pixels and the colour of the control points
    //finding x and y for each colour
    FILE *fout;
    fout = fopen(argv[2], "w"); //this one in write mode, will open the path to Traces.txt
    if(fout==NULL)
    {
        perror("erreur ouverture fichier de sortie");
        return -6;
    }

    for(k=0; k<5; k++)//the first 5 colours
    {
        if(colours[k]!=0)
        {
            fprintf(fout, "%d \n", colours[k]);
            for(i=0; i<hauteur*largeur; i++)
            {
                unsigned short x, y; //the coords to compute
                calc_coords(i, largeur, &x, &y);
                if(Pixmap[i]==colours[k]) fprintf(fout, "%d %d \n", x, y); //this makes the primitive Traces.txt, todo make it matlab compatible
            }
        }
    }

    // Constructing the Idx (colours[i]: traces, colour_control_points: control points, 2nd largest # pixels: borders)

    fprintf(stdout, "C: %d\nT: ", colour_control_points); //maybe add border as well?
    for (i = 0; i < 5; i++)
    {
        if (colours[i] != 0)
        {
            fprintf(stdout, "%d ", colours[i]);
        }
    }

    //todo construct the Idx
    //in the Idx we will return the colour codes of all traces [50-300], borders [300-...] and the control points (only 4)
    //we will assume that the greatest number of pixels will be the background (white or otherwise), the second largest number of pixels should be the borders
    free(colours);
    free(histo);
    free(Pixmap);
    return 0;
}
