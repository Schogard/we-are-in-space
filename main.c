#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fin;
    fin = fopen("Pixmap.bin", "rb");
    if(fin==NULL) perror("erreur ouverture \n");

    int n=0; //total number of pixels
    int histo[257]={0};
    //histogram fait
    while(!feof(fin))
    {
        unsigned char b[1];
        size_t r=fread(b, sizeof b[0], 1, fin);
        histo[b[0]]++;
        n++;
    }
    fclose(fin);


    //determine colours, control points
    unsigned char colours[256]={0}, colour_control_points;
    int j=0;
    //to do: test so j doesnt overflow colours[]
    for(int i=0; i<256; i++)
    {
        if(50<=histo[i] && histo[i]<=300)
        {
            colours[j]=i;
            j++;
        }
        if(histo[i]==4) colour_control_points=i;
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
    for(i=0; i<j; i++)
    {
        printf("%d %d \n", colours[i], histo[colours[i]]);
    }
    //at this point we have a vector of colours in decreasing order of number of pixels and the colour of the control points
    return 0;
}
