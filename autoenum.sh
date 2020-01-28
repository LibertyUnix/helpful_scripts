if [ -z "$1" ]; then
    echo "Usage: $0 smb.txt"
        exit 0
fi
    echo "Running enum4linux\n"
    echo "Scanning: $1"
    echo "\n"
    for ip in $(cat $1);do
        echo "Scanning $ip..."
        enum4linux $ip > $ip"_enum4" &
    done
