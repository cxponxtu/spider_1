#include<stdio.h>

int main()
{
    // Getting no. of processes
    int n;
    printf("Enter no. of processes : ");
    scanf("%d",&n);

    // Declaring variables
    int at[n], bt[n], wt[n], tat[n], id[n], k, ct, r=0;
    float awt, atat;

    // Getting arrival and burst time of each process
    printf("Enter the details in the following format (at,bt)\n");
    for ( int i = 0; i < n; i++ )
    {
        id[i]=-1;
        printf("Arrival and Burst time for process %d : ",i+1);
        scanf("%d,%d",&at[i],&bt[i]);
    }

    // Sorting processes by arrival time
    for (int i = 0; i < n; i++)
    {
        k=0,r=0;
        for (int j=0; j < n ; j++)
        {
            if(at[i]>at[j])
            {
                k++;
            }
        }
        while(id[k+r]!=-1)
        {
            r++;
        }
        id[k+r] = i;
    }

    // Calculating waiting and turn-around time
    ct = at[id[0]];
    for(int i=0; i  < n; i++)
    {
        wt[id[i]] = ct - at[id[i]];
        ct+=bt[id[i]];
        tat[id[i]] = bt[id[i]] + wt[id[i]];
    }

    // Calculating average of waiting and ti=urn-around time
    for(int i = 0; i < n; i++)
    {
        awt += wt[i];
        atat += tat[i];
    }
    printf("\nAverage waitng and turn-around times are %f and %f respectively",awt/n,atat/n);
    
}