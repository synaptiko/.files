#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function checkDependency {
	repository=`echo $1 | cut -d'/' -f1`
	dependencyName=`echo $1 | cut -d'/' -f2`
	dependency=$dependencyName

	if [ $repository == "aur" ]; then
		repository=" (aur)";
	elif [ $repository == "synaptiko" ]; then
		repository=" (synaptiko)";
		dependency="synaptiko-$dependency";
	else
		repository="";
	fi

	if pacman -Qs $dependency &> /dev/null; then
		echo -e "  \e[32m✓\e[0m $dependency$repository"
		return 0
	else
		echo -e "  \e[31m✖\e[0m $dependency$repository"
		return 1
	fi
}

mkdir -p $DIR/.logs

for moduleDir in `find $DIR/*/ -maxdepth 1 -type d | sort`; do
	module=`basename $moduleDir`
	failedDependenciesCount=0
	
	if [ ! -f ${moduleDir}install.sh ]; then
		continue
	fi

	echo -e "\e[1m$module\e[0m module:"

	if [ -f $module/dependencies ] && [ `wc -l $module/dependencies | cut -d' ' -f1` != "0" ]; then
		echo "- checking dependencies:"
		moduleDependencies=$(<$moduleDir/dependencies)

		for dependency in $moduleDependencies; do
			if ! checkDependency $dependency; then
				((failedDependenciesCount+=1))
			fi
		done
	fi

	if [ $failedDependenciesCount -gt	0 ]; then
		(>&2 echo "  Missing dependencies ($failedDependenciesCount) => skipping installation")
	else
		# for some modules sudo access is required; authorize now
		sudo true

		echo -n "- installing: "
		if ${moduleDir}install.sh >& $DIR/.logs/$module; then
			echo -e "\e[32m✓\e[0m"
		else
			echo -e "\e[31m✖"
			sed -E 's/^/  /' $DIR/.logs/$module
			echo -en "\e[0m"
		fi

		if [ -f ${moduleDir}install-under-root ]; then
			echo -n "- installing for root user: "

			if sudo ${moduleDir}install.sh >& $DIR/.logs/$module-root; then
				echo -e "\e[32m✓\e[0m"
			else
				echo -e "\e[31m✖"
				sed -E 's/^/  /' $DIR/.logs/$module-root
				echo -en "\e[0m"
			fi
		fi
	fi

	echo
done

for moduleDir in `find $DIR/*/ -maxdepth 1 -type d`; do
	# execute post-install scripts if any
	if [ -f ${moduleDir}post-install.sh ]; then
		echo -e "\e[1m$module\e[0m module post-install script found, executing…"
		${moduleDir}post-install.sh
	fi
done
