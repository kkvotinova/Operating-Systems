#!bin/bash
echo -e "\n				###[ SMART CALCULATOR ]###"

checkOperation()
{
  if [[ "$1" = plu* ]] || [[ "$1" = *lus ]] || [[ "$1" = pl*s ]]; then
    echo +
  elif [[ "$1" = min** ]] || [[ "$1" = *inus ]] || [[ "$1" = m*n*s ]]; then
    echo -
  elif [[ "$1" = m*lt ]] || [[ "$1" = *ult ]] || [[ "$1" = mu** ]]; then
    echo 1
  elif [[ "$1" = d*v ]] || [[ "$1" = *iv ]] || [[ "$1" = di* ]]; then
    echo /
  elif [[ "$1" = exit ]]; then
    echo 0
  else
    echo 404
  fi
}

checkNumber()
{
	case $1 in
		n*ll | n*l | nu*)
			echo 0
			;;
		on* | *ne | o*e)
			echo 1
			;;
		*wo | t*o | tw*)
			echo 2
			;;
		th*** | t*r** | **ree)
			echo 3
			;;
		fo** | *our | f**r)
			echo 4
			;;
		f*ve | f**e | *i*e)
			echo 5
			;;
		s*x | si* | *ix)
			echo 6
			;;
		se*** | s*v*n | ***en)
			echo 7
			;;
		ei*** | ei*** | e***t)
			echo 8
			;;
		ni** | n**e | **ne)
			echo 9
			;;
		*)
			echo 404
			;;
		esac
}

while true; do
  echo " "
  
  rem=true
  while $rem; do
    echo "1st num:"; read num1
    num1=$(checkNumber $num1)
    if [[ "$num1" -ne 404 ]]; then
      rem=false
    fi
  done
  
  rem=true
  while $rem; do
    echo "2d num:"; read num2
    num2=$(checkNumber $num2)
    if [[ "$num2" -ne 404 ]]; then
      rem=false
    fi
  done
  
  rem=true
  while $rem; do
    echo "operation:"; read operation
    operation=$(checkOperation $operation)
    if [[ "$operation" != 404 ]]; then
      rem=false
    fi
  done

  if [[ "$operation" = 1 ]]; then
  	echo $num1 "*" $num2 "=" $(($num1*$num2))
  elif [[ "$operation" = 0 ]]; then
  	echo -e "Goodbye! \n"
  	exit
  else
    echo $num1 $operation $num2 = $(($num1 $operation $num2))
  fi
done
