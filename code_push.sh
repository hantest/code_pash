# clone存放地址
CLONE_ADDRESS="/d/test2"

# 检测clone存放地址是否存在
if [ -e $CLONE_ADDRESS ]
then
    rm -rf $CLONE_ADDRESS
else
    mkdir $CLONE_ADDRESS
fi

echo -n "请输入clone地址："
read PERSON
CLONE_DRESS=$PERSON

i=0
echo -n "请输入并发次数："
read TIMES
t=$TIMES

while :
do
  if [ $i -lt $TIMES ]
  then
    echo *************git clone $i****************
    git clone $CLONE_DRESS $CLONE_ADDRESS/$i
	
	echo ***********git push************
	# push 开始时间
	SHOW_TIME=`date +%s`
	cd $CLONE_ADDRESS/$i
	echo "aaaaaa">>a.txt
	echo "#jjjjjjj">>b.rb
	git add .
	git commit -m "a"
	git push -u origin master
	
	# push结束时间
	END_TIME=`date +%s`
	# 时间结果存入数组
	var[$i]=`expr $END_TIME - $SHOW_TIME`
	echo "push耗时：" ${var[i]} "秒"
	
	# 判断文件是否存在
	if [ -e $CLONE_ADDRESS/$i ]
	then
	  let i++
	else
	  break
	fi 
  else
    sum=0
	# @或*获取所有数组的值
    for a in "${var[@]}"
	do
	  sum=`expr $a + $sum`
	done
	echo "总共耗时：" $sum "秒"
    break
  fi
done
