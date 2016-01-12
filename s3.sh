#!/bin/bash
# Filename:s3.sh
# Description: S3 Long Run Test Script
# Run at X-terminal as root
# Copyright(C):2013-2015, John.Wang
# Version:2.0

#唤醒后，执行等待的秒数
WAIT_SECS=30
#下次唤醒间隔时间设置
WAKE_SECS=60

if [ $UID -ne 0 ];then
	echo "Superuser privileges are required to run this script."
	exit 1
fi

[ -e /var/log/s3.log ] && rm -f /var/log/s3.log
dat=$(date +%s -d "12 hour")
#  设置循环开始圈数i
i=0
while :
do
	tim=$(date +%s)
	if [ $tim -lt $dat ];then
		
		n=$WAIT_SECS
		while ((n>0))
		do
			n=`expr $n - 1`
			percentage=`expr 100 \/ $WAIT_SECS \* $n`
			echo $percentage
			sleep 1
		done | zenity --progress --text="已执行$i圈\n倒计时${WAIT_SECS}s进入下一轮..."  --auto-close --auto-kill #图形界面控制脚本停止
		
		echo "rtcwake S3 `date`" >>/var/log/s3.log
		rtcwake -m mem -s $WAKE_SECS

		i=$(($i + 1))
	else
		break
	fi
done
sleep 3600
sudo sh ./s4.sh

