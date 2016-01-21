#!/bin/bash

if [[ -z $DBUS_SESSION_BUS_ADDRESS ]]; then
  dbus_file=/home/bindel/.dbus/session-bus/$(dbus-uuidgen --get)-0
  if [[ -f $dbus_file ]]; then
    source $dbus_file
    export DBUS_SESSION_BUS_ADDRESS
  fi
fi

cd /home/bindel/work/siam
( cd siagla ; git ls-remote origin | grep "HEAD" > ../lastpull.txt )
if diff remote.txt lastpull.txt ; then
  echo "No updates!"
else
  echo "Apply update!"
  cd /home/bindel/work/class/cs4220-s16/web
  git pull origin
  rake deploy
fi
cp lastpull.txt remote.txt

#!/bin/bash

