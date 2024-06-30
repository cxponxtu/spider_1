#include <stdio.h>
// For this example, I have taken four types of resources and four incoming processes
#define total_process 4
#define rsc_types 4

int main()
{
    int availresrc[rsc_types], sequence[total_process], i, j, k, count=0, deadlock;

    // Total avalible resources of for types
    int totalresrc[rsc_types]            =              {9, 10, 8, 7};

    // Resources allotted for process
    int process_alloted[total_process][rsc_types]= {    {0, 1, 2, 1},
                                                        {1, 1, 0, 2},
                                                        {2, 1, 0, 1},
                                                        {0, 2, 0, 0}  };

    // Resources required for process
    int process_required[total_process][rsc_types]= {   {0, 6, 2, 1},
                                                        {1, 6, 0, 2},
                                                        {2, 1, 0, 1},
                                                        {0, 8, 0, 3}  };

    // Available resources
    for ( i=0; i<rsc_types; i++)
    {
        availresrc[i] = totalresrc[i];
        for(j=0; j<total_process; j++)
        {
            availresrc[i]-=process_alloted[j][i];
        }
    }

    // Checking for possibiltiy of deadlock
    for(i=0; i<total_process; i++)
    {
        if(i==0)
        {
            deadlock=1;
        }
        if(process_alloted[i][0] != -1)
        {
            k=0;
            for(j=0; j<rsc_types; j++)
            {
                if (availresrc[j] >=  process_required[i][j])
                {
                    k++;
                }
            }
            if(k==rsc_types)
            {
                deadlock=0;
                sequence[count]=i;
                count++;
                for(j=0; j<rsc_types; j++)
                {
                    availresrc[j]+=process_alloted[i][j];
                }
                process_alloted[i][0]=-1;
            }
        }
        if(i==(total_process-1) && deadlock == 0)
        {
            i=-1;
        }
    }

    // Printing possibility
    if(count==total_process)
    {
        printf("Deadlock can be avoided. One of the posssible sequence is ");
        for(i=0;i<total_process;i++)
        {
            printf("%d",sequence[i]+1);
            if(i!=(total_process-1))
            {
                printf("-->");
            }
        }
    }
    else
    {
        printf("Deadlock cannot be avoided");
    }
}