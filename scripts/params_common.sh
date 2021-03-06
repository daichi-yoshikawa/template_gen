#!/bin/bash

function define_common_params {
    LANGUAGE=$1
    CURRENT_DIR=$2
    PROJECT_NAME=$3
    PROJECT_DIR=$CURRENT_DIR/$4/$PROJECT_NAME
    COMMON_DIR=$CURRENT_DIR/common
    LICENSES_DIR=$COMMON_DIR/LICENSES
    LANG_DIR=$CURRENT_DIR/$LANGUAGE
}
