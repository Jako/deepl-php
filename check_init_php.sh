#!/usr/bin/env sh

# Usage: ./check_init_php.sh
# This will check that the `init.php` file is correctly loading all source PHP files in `src/`

php_files=$(find src -type f -name "*.php")
init_contents=$(cat init.php)
missing_files=""

for file in $php_files; do
    if ! echo "$init_contents" | grep -q "$file"; then
        missing_files="$missing_files $file"
    fi
done

if [[ -z "$missing_files" ]]; then
    echo "init.php verified";
    (exit 0);
else
    echo "init.php is invalid, following files are missing:";
    printf '%s\n' "${missing_files[@]}"
    (exit 1);
fi