for f in $(find /mnt/vfat/pacific_renewal -name server_settings.cfm); do
  n=`echo $f | sed s#mnt/vfat#var/www#`
  cp $f $n;
done;
