#!/bin/bash

function define_langwise_params {
    source $2/scripts/params_common.sh
    define_common_params $1 $2 $3 $4
    CMAKELISTS_DIR=$LANG_DIR/CMakeLists
    TEMPLATES_DIR=$LANG_DIR/templates

    DIRS_TO_MAKE=(include/$PROJECT_NAME src test build)

    FILES_SRC=($CMAKELISTS_DIR/CMakeLists.root.default
               $CMAKELISTS_DIR/CMakeLists.test.default
               $TEMPLATES_DIR/test_main.cpp
               $LANG_DIR/dot.gitignore
               $LICENSES_DIR/LICENSE
               $COMMON_DIR/README.md.default)
    FILES_DST=($PROJECT_DIR/CMakeLists.txt
               $PROJECT_DIR/test/CMakeLists.txt
               $PROJECT_DIR/test/test_main.cpp
               $PROJECT_DIR/.gitignore
               $PROJECT_DIR/LICENSE
               $PROJECT_DIR/README.md)
}
