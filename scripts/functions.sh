#!/bin/bash

TRUE=0
FALSE=1

<< COMMENT
   Usage: print_usage <language>
   Return: None
   Eg.) print_usage cpp
        print_usage python
COMMENT
function print_usage {
    echo "Usage: ./scripts/template_gen_${1}.sh <project name> <relative path to dir where to create project dir>"
    echo "Eg.) ./scripts/template_gen_${1}.sh webapp .."
    echo "     where <project name> = webapp and create project directory under parent directory of current directory(Usually should be root dir of template_gen)."
}

<< COMMENT
   Usage: make_dirs <root_dir> <list of dirs to make>
   Return: $TRUE or $FALSE
   Eg.)
   make_dirs $PROJECT_DIR ${dirs[@]}
   success=$?
   if [ $success != $TRUE ]; then
       ...
COMMENT
function make_dirs {
    project_dir=$1
    shift
    dirs=($@)
    for val in ${dirs[@]}; do
        echo "    - Make ${project_dir}/${val}"
	mkdir -p $project_dir/$val
	echo "    - Done."
    done

    for val in ${dirs[@]}; do
	if [ ! -d "${project_dir}/${val}" ]; then
        echo "    - Could not find ${project_dir}/${val} dir."
	    return $FALSE
	fi
    done
    return $TRUE
}

<< COMMENT
   Usage: copy_files <src files> <dst files>
   Return: $TRUE or $FALSE
   Eg.)
   copy_files ${files_src[@]} ${files_dst[@]}
   success=$?
   if [ $success != $TRUE ]; then
       ...
COMMENT
function copy_files {
    files=($@)
    n_files=${#files[@]}

    if [ $(($n_files % 2)) != 0 ]; then
	echo "    - Invalid number of files."
	echo "    - n_files_src + n_files_dst is ${n_files}."
	return $FALSE
    fi

    n_files_cp=$(($n_files / 2))
    files_src=(${files[@]:0:$n_files_cp})
    files_dst=(${files[@]: -$n_files_cp:$n_files_cp})
    for i in `seq 1 $n_files_cp`; do
	echo "    - Copy ${files_src[$i-1]} to ${files_dst[$i-1]}."
	cp ${files_src[$i-1]} ${files_dst[$i-1]}
	echo "    - Done."
    done

    for i in `seq 1 $n_files_cp`; do
	if [ ! -f "${files_dst[$i-1]}" ]; then
	    echo "    - Could not find ${files_dst[$i-1]}."
	    return $FALSE
	fi
    done
    return $TRUE
}
