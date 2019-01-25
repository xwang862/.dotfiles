# Shorten command pandoc
pandoc2() {
    if [ "$#" -gt 1 ]; then
        echo "Only one argument is allowed!"
        return 1
    else
        filename=$1
        if [[ $filename == *.org ]]; then
            # strip file extension
            name=$(echo "${filename%.*}")
            # full command of pandoc
            pandoc -f org -t latex -o "$name".pdf "$name".org
        else
            echo "Only *.org file is allowed!"
            return 2
        fi
    fi
}
