//
//  main.c
//  Project C ba3
//
//  Created by Manuel Bruppacher on 26.09.24.
//

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
    fin = fopen("/Users/manuel/Documents/Programming_C/Project C ba3/Pixmap.bin", "rb");//opening the file in byte mode
    if(fin==NULL) perror("erreur ouverture \n"); //error management

    int n=0; //total number of pixels
    int histo[257]={0}; //todo, make the histogram a tableau dynamique
    //making the histogram
    //todo, read prof, larg, haut like on slide 27, the file pointer should move by itself
    //make the pixmap in a tableau dynamique
    
    
    //read the first 3 bites, size of the image, width in pixels, hight in pixels
    unsigned short *proflarghaut; //profondeur largeur hauteur
    proflarghaut = malloc(3*sizeof(unsigned short)); // what about big files
    size_t errf3b=fread(proflarghaut, sizeof(unsigned short), 3, fin); //read proflarghaut
    
    unsigned short profondeur = proflarghaut[0]; //assign the red values to variables
    unsigned short largeur = proflarghaut[1];
    unsigned short hauteur = proflarghaut[2];
    
    //print size, width and hight od the binfile
    printf("Profondeur= %d \nLargeur= %d \nHauteur= %d \n", profondeur, largeur, hauteur);
    
    while(!feof(fin))
    {
        unsigned char *b;
        b = malloc(sizeof(unsigned char));
        size_t r=fread(b, sizeof b[0], 1, fin); //todo: treat read errors
        histo[b[0]]++;
        n++;
    }
    fclose(fin); //closing file


    //determine colours, control points
    unsigned char colours[256]={0}, colour_control_points;
    int j=0;
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
    int i, k;
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
    
           
    // print histogramm
    for(i=0; i<j; i++)
    {
        printf("%d %d \n", colours[i], histo[colours[i]]);
    }
    //at this point we have a vector of colours in decreasing order of number of pixels and the colour of the control points


    //finding x and y for each colour
    fin = fopen("/Users/manuel/Documents/Programming_C/Project C ba3/Pixmap.bin", "rb"); //opening files
    FILE *fout;
    fout = fopen("Traces.txt", "w"); //this one in write mode
    if(fin==NULL) perror("erreur ouverture \n"); //error management
    if(fout==NULL) perror("erreur ouverture \n");


    //construct the Idx
    //in the Idx we will return the colour codes of all traces [50-300], borders [300-...] and the control points (only 4)
    //we will assume that the greatest number of pixels will be the background (white or otherwise), the second largest number of pixels should be the borders
    return 0;
}


