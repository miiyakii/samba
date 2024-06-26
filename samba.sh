adduser -S -D -H -h /storage -s /sbin/nologin -u $UID $USER
echo -e "$PASS\n$PASS" | smbpasswd -a -s "$USER"
echo "sss"
exec smbd 
