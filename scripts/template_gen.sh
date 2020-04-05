#!/bin/bash

function template_gen_impl {
    ### Define variables.
    CURRENT_DIR=$(pwd)
    LANGUAGE=$1
    source $CURRENT_DIR/scripts/functions.sh
    source $CURRENT_DIR/scripts/params_$LANGUAGE.sh

    shift
    if [ $# != 2 ]; then
	echo "Invalid argument."
	print_usage $LANGUAGE
	exit 1
    fi
    PROJECT_NAME=$1
    RELATIVE_PATH_TO_ROOT=$2

    define_langwise_params $LANGUAGE $CURRENT_DIR $PROJECT_NAME $RELATIVE_PATH_TO_ROOT

    ### Start creating project.
    echo "Generate template of ${LANGUAGE} project for ${PROJECT_NAME} as ${PROJECT_DIR}."
    if [ -d "${PROJECT_DIR}" ]; then
        echo "  - Already project exists. Rename it or use different project name."
        echo "Generating template failed."
        exit 1
    fi

    ### Make directories.
    echo "  - Make directories."
    make_dirs $PROJECT_DIR ${DIRS_TO_MAKE[@]}
    if [ $? != $TRUE ]; then
        echo "Making directories failed."
        echo "Generating template failed."
        exit 1
    else
        echo "  - Making directories all succeeded."
    fi

    ### Copy files.
    echo "  - Copy files."
    copy_files ${FILES_SRC[@]} ${FILES_DST[@]}
    if [ $? != $TRUE ]; then
        echo "Copying files failed."
        echo "Generating template failed."
        exit 1
    else
        echo "  - Copying files all succeeded."
    fi

    echo "Generated template of ${LANGUAGE} project successfully."
}
