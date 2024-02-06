# We can't specify a different save location, so we'll create a symbolic link at startup
ln -s /app/server/ShooterGame/Saved /app/saves

sed -i "/minfds=/c\minfds=$env:FILE_LIMIT" /etc/supervisord.conf

supervisord -nc /etc/supervisord.conf