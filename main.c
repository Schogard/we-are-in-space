#include <stdio.h>
#include <stdlib.h>
/**
Name
descr

Revisions
*/
int main()
{
    FILE *fin;
    fin = fopen("Pixmap.bin", "rb");//opening the file in byte mode
    if(fin==NULL) perror("erreur ouverture \n"); //error management

    //read prof, larg, haut like on slide 27, the file pointer should move by itself
    unsigned short height=343, length=370;

    //make the Pixmap in a tableau dynamique
    unsigned char *Pixmap;
    Pixmap=calloc(height*length, sizeof(unsigned char));
    size_t read=fread(Pixmap, sizeof(unsigned char), height*length, fin);

    //construct the histogram
    int *histo;
    histo=calloc(256, sizeof(int)); //declare the histogram, use of calloc instead of malloc to initiallise all to 0
    int i;
    for(i=0; i<height*length; i++)
    {
        histo[Pixmap[i]]++;
    }


    fclose(fin); //closing file


    //determine colours, control points
    unsigned char *colours, colour_control_points;
    int j=0;
    colours=calloc(256, sizeof(unsigned char));
    //to do: test so j doesnt overflow colours[]
    for(int i=0; i<256; i++)
    {
        if(50<=histo[i] && histo[i]<=300) //traces
        {
            colours[j]=i;
            j++;
        }
        if(histo[i]==4) colour_control_points=i; //control points
    }

    for(int i=0; i<256; i++)
    {
        if(histo[i]!=0) printf("%d %d \n", i, histo[i]);
    }



    //sort colours to find the 5 largest ones
    //here j will be the total number of traces
    int k;
    for(i=0; i<j; i++)
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
    for(i=0; i<j; i++)
    {
        printf("%d %d \n", colours[i], histo[colours[i]]);
    }
    //at this point we have a vector of colours in decreasing order of number of pixels and the colour of the control points


    //finding x and y for each colour
    fin = fopen("Pixmap.bin", "rb"); //opening files
    FILE *fout;
    fout = fopen("Traces.txt", "w"); //this one in write mode
    if(fin==NULL) perror("erreur ouverture \n"); //error management
    if(fout==NULL) perror("erreur ouverture \n");
    for(k=0; k<4; k++)//the first 4 colours
    {
        if(colours[k]!=0)
        {
            fprintf(fout, "%d \n", colours[k]);
            for(i=0; i<height*length; i++)
            {
                unsigned short x, y; //the coords to compute
                x=i%length-1;
                y=i/length; //ask Dragos for maths
                if(Pixmap[i]==colours[k]) fprintf(fout, "%d %d \n", x, y);
            }
        }
    }



    //construct the Idx
    //in the Idx we will return the colour codes of all traces [50-300], borders [300-...] and the control points (only 4)
    //we will assume that the greatest number of pixels will be the background (white or otherwise), the second largest number of pixels should be the borders
    free(colours);
    free(histo);
    free(Pixmap);
    return 0;
}
