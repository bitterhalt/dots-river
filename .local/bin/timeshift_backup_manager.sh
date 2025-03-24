#!/bin/bash
# Timeshift Backup Manager
warning='\033[0;31m' #Red
reset='\033[0m' #No Color
sucess='\033[0;32m' #Green
#info='\033[0;33m' #Yellow


timeshift_installed_check() {
    if ! command -v timeshift &> /dev/null
    then
        echo -e "${warning}Timeshift is not installed please install it first.${reset}"
        exit 1
    fi
}

sudo_check() {
    if [ "$EUID" -ne 0 ]
    then
    #Timeshift needs to be run as root
        echo -e "${warning}Please run this as root${reset}"
        exit 1
    fi
}

create_backup() {
    backup_type=$1
    timeshift_installed_check

    case $backup_type in
        "manual")
            timeshift --create --comments "Manual Backup created by Timeshift Backup Manager" 
            ;;
        "daily")
            timeshift --create --comments "Daily Backup created by Timeshift Backup Manager" --tags "D"
            ;;
        "weekly")
            timeshift --create --comments "Weekly Backup created by Timeshift Backup Manager" --tags "W"
            ;;
        "monthly")
            timeshift --create --comments "Monthly Backup created by Timeshift Backup Manager" --tags "M"
            ;;
        *)
            echo "Invalid backup type"
            backup_menu
            #exit 1
            ;;
    esac
    main_menu #Return to main menu
    
}

delete_backup() {
    timeshift_installed_check
    deletion_type=$1
    case $deletion_type in
        "manual")
            timeshift --delete #Only nuke a little bit 
            ;; 
        "all")
            timeshift --delete-all #Nuke it from orbit it's the only way to be sure 
            ;;

        *)
            echo -e "${warning}Invalid option ${reset}"
            exit 1
            ;;
    esac

    
}

get_backup_list() {
    timeshift_installed_check
    timeshift --list
    read -p "Press enter to contine"
}

restore_backup() {
    timeshift_installed_check
    timeshift --restore
}

main_menu(){
    echo "------------------------------------"
    echo -e "${sucess}Timeshift Backup Manager${reset}"
    echo "1. Create a backup"
    echo "2. List Backups"
    echo "3. Delete Backups"
    echo "4. Restore a Backup"
    echo -e "${warning}5. Exit${reset}"
    
    read -p "Enter your choice: " choice
    echo "------------------------------------"
    
    case $choice in
        1)
            backup_menu
            ;;
    
        2)
            get_backup_list
        
            ;;
            
        3)
            deletion_menu
            
            ;;
        4)
            restore_backup
            ;;
        5)
            exit 0
            ;;
        *)
        
            echo -e "${warning}Invalid option${reset}"
            main_menu
            ;;
    esac
    main_menu
}

backup_menu(){
    echo "------------------------------------"
    echo "1. Create a Daily Backup"
    echo "2. Create a Weekly Backup"
    echo "3. Create a Monthly Backup"
    echo "4. Create a Manual Backup"
    echo "5. Return to main menu"
    

    read -p "Enter your choice: " choice
    echo "------------------------------------"
    case $choice in
        1)
            create_backup "daily"
            ;;
        2)
            create_backup "weekly"
            ;;
        3)
            create_backup "monthly"
            ;;
        4)
            create_backup "manual"
            ;;
        5)
            main_menu
            ;;
        *)
            echo -e "${warning}Invalid option${reset}"
            backup_menu
            ;;
    esac
}

deletion_menu(){
    echo "------------------------------------"
    echo "1. Delete a Backup"
    echo "2. Delete all Backups"
    echo "3. Return to main menu"

    read -p "Enter your choice: " choice
    echo "------------------------------------"
    case $choice in
        1)
            delete_backup "manual"
            ;;
        2)
            read -p "Are you sure ? this is the point of no return [y/N]: " response #Nuke confirmation
            case $response in
                [yY][eE][sS]|[yY])
                    delete_backup "all"
                    ;;
                *)
                    main_menu
                    ;;
            esac
            ;;
        3)
            main_menu
            ;;
        *)
            echo -e "${warning}Invalid option${reset}"
            deletion_menu
            ;;
    esac
}

timeshift_installed_check
sudo_check
main_menu
