[ -e /usr/share/dae ] || mkdir /usr/share/dae

curl -o /usr/share/dae/geoip.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat
curl -o /usr/share/dae/geosite.dat https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat


# --logfile /var/log/dae.log --logfile-maxbackups 1 --logfile-maxsize 1
