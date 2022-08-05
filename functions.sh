if [[ $OSTYPE == "darwin"* ]]; then
    OSTYPE=darwin
fi

dotfiles_file_backup() {
    for file in "$@"; do
        if [[ -f "$file" ]]; then
            cp -R "$file" "$file.backup"
        fi
    done
}

dotfiles_file_replace() {
    sed -i "s#$2#$3#g" "$1"
}
