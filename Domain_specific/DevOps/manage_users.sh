#!/bin/bash

addinguser() 
{       
        detail=()
        detail[0]=$1
        detail[1]=$2
        detail[2]=$3

        # Adding group
        sudo groupadd ${detail[1]} 2>/dev/null
        if [ $? -eq 0 ]
        then
            echo -e "`date +'%d-%m-%y %H:%M:%S'` \t Added group ${detail[1]}" >> manage_users.log
        fi

        # Adding user
        error="`sudo useradd -md /home/${detail[0]} -g ${detail[1]} ${detail[0]} 2>&1`"
        if [ $? -eq 0 ]
        then
            echo -e "`date +'%d-%m-%y %H:%M:%S'` \t User added username:${detail[0]}--group:${detail[1]}" >> manage_users.log
        else
            echo -e "`date +'%d-%m-%y %H:%M:%S'` \t $error" >> manage_users.log
        fi

        # Adding permisssion
        error="`sudo chmod -R ${detail[2]} /home/${detail[0]} 2>&1`"
        if [ $? -eq 0 ]
        then
            echo -e "`date +'%d-%m-%y %H:%M:%S'` \t User permissions added username:${detail[0]}--permission:${detail[2]}" >> manage_users.log
        else
            echo -e "`date +'%d-%m-%y %H:%M:%S'` \t $error" >> manage_users.log
        fi

        # Creating project directory
        sudo mkdir /home/${detail[0]}/projects 2>/dev/null

        # Adding intro message
        sudo bash -c "echo \"Welcome, ${detail[0]}! some intro message here.\" >/home/${detail[0]}/projects/README.md"
}

select option in Add Modify Delete
do
    case $option in
        Add)
            select option2 in "By file usernames.csv" "Manual"
            do
                case $option2 in
                    "By file usernames.csv")
                        while IFS="," read -ra detail 
                        do
                            addinguser ${detail[0]} ${detail[1]} ${detail[2]}
                        done < usernames.csv
                        break 2 ;;
                    "Manual")
                        IFS="," read -p "Enter details in following format [username,group,permissions] : " -ra manual
                        addinguser ${manual[0]} ${manual[1]} ${manual[2]}
                        break 2 ;;
                esac
            done ;;
        
        Modify)
            IFS="," read -p "Enter details in following format [username,group,permissions] : " -ra modify

            # Adding group
            sudo groupadd ${modify[1]} 2>/dev/null
            if [ $? -eq 0 ]
            then
                echo -e "`date +'%d-%m-%y %H:%M:%S'` \t Added group ${modify[1]}" >> manage_users.log
            fi

            # Modifing user group
            error="`sudo usermod -G ${modify[1]} ${modify[0]} 2>&1`" 
            if [ $? -eq 0 ]
            then
                echo -e "`date +'%d-%m-%y %H:%M:%S'` \t User group modified username:${modify[0]}--group:${modify[1]}" >> manage_users.log
            else
                echo -e "`date +'%d-%m-%y %H:%M:%S'` \t $error" >> manage_users.log
            fi 

            # Modifing permissions
            error="`sudo chmod -R ${modify[2]} /home/${modify[0]} 2>&1`"
             if [ $? -eq 0 ]
            then
                echo -e "`date +'%d-%m-%y %H:%M:%S'` \t User permissions modified username:${modify[0]}--permission:${modify[2]}" >> manage_users.log
            else
                echo -e "`date +'%d-%m-%y %H:%M:%S'` \t $error" >> manage_users.log
            fi 
            break ;;

        Delete)
            read -p "Enter username : " del
            error="`sudo userdel -r $del 2>&1`"
            if [ $? -eq 0 ]
            then
                echo -e "`date +'%d-%m-%y %H:%M:%S'` \t User deleted $del" >> manage_users.log
            else
                echo -e "`date +'%d-%m-%y %H:%M:%S'` \t $error" >> manage_users.log
            fi
            break ;;

    esac
done



