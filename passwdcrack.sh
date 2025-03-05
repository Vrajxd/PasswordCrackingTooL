#!/bin/bash
office_use(){
read -p "Enter Your File Name with Extension: " filename
    echo ""
    echo "Warning: Don't enter '.' when entering your extension.."
    echo ""
    read -p "Enter Your File Extension (doc,docx,xls,xlsx,ppt,pptx,txt): " extension
    read -p "Enter Your wordlist path here: " wordlist
    if [ -f "$filename" ]; then
        echo "File Found"
        if [[ "$extension" == "pdf" || "$extension" == "doc" || "$extension" == "docx" || "$extension" == "xls" || "$extension" == "xlsx" || "$extension" == "ppt" || "$extension" == "pptx" || "$extension" == "txt" ]]; then 
            office2john "$filename" > "$filename".txt
            john --wordlist = wordlist "$filename".txt
        else
            echo "Enter a valid extension for the file "
        fi
    else
        echo "File not found"
    fi
}
wordlist_use(){
read -p "Enter Your File Name with Extension: " filename
    echo ""
    echo "Warning: Don't enter '.' when entering your extension.."
    echo ""
    read -p "Enter Your File Extension (pdf, 7z, zip, rar): " extension
    read -p "Enter Your wordlist path here: " wordlist
    if [ -f "$filename" ]; then
        echo "File Found"
        if [[ "$extension" == "pdf" || "$extension" == "7z" || "$extension" == "zip" || "$extension" == "rar" ]]; then 
            "$extension"2john "$filename" > "$filename".txt
            john --wordlist = wordlist "$filename".txt
        else
            echo "Enter a valid extension for the file (doc,docx,xls,xlsx,ppt,pptx,txt)"
        fi
    else
        echo "File not found"
    fi
}
fileforcracking() {

    read -p "Enter Your File Name with Extension: " filename
    echo ""
    echo "Warning: Don't enter '.' when entering your extension.."
    echo ""
    read -p "Enter Your File Extension (pdf, 7z, zip, rar): " extension

    if [ -f "$filename" ]; then
        echo "File Found"
        if [[ "$extension" == "pdf" || "$extension" == "7z" || "$extension" == "zip" || "$extension" == "rar" ]]; then 
            "$extension"2john "$filename" > "$filename".txt
            john "$filename".txt
        else
            echo "Enter a valid extension for the file (pdf, 7z, zip, rar)"
        fi
    else
        echo "File not found"
    fi
}

while true; do
    clear
    figlet "Vraj ' s  Team  : )"
    echo "Created by Vraj's team :)"
    echo "This tool is used to crack the password of the following file types: 1) pdf 2) 7z 3) zip 4) rar"
    echo "This tool  is also  use to  crack this microsoft files also (doc,docx,xls,xlsx,ppt,pptx,txt)"
    echo "Make sure that file you want to crack is in same directory where this tool is install :)"
    echo " "
    echo " " 
    echo "Password Cracking Tool"
    echo "=========================="
    echo "1. Select The File For Cracking The Password(Default wordlist):"
    echo "2. Select The File For Cracking The Password (Custom Wordlist): "
    echo "3. Select If  The File Type Is  MicrosoftOffice :"
    echo "4. Exit"
    read -p "Choose an option [1-4]: " choice

    case $choice in
        1)
            fileforcracking
            ;;
        2) 
            wordlist_use
            ;;
        3)
            office_use
            ;;
        4)
            echo "Exiting the tool...."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose between 1 and 2."
            ;;
    esac

    # Pause to let the user see the result
    read -p "Press Enter to continue..."
done


