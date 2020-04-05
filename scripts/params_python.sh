#!/bin/bash

function define_langwise_params {
    source $2/scripts/params_common.sh
    define_common_params $1 $2 $3 $4

    DIRS_TO_MAKE=($PROJECT_NAME tests)

    FILES_SRC=($LICENSES_DIR/LICENSE
               $COMMON_DIR/README.md.default
               $LANG_DIR/dot.gitignore
               $LANG_DIR/MANIFEST.in.default
               $LANG_DIR/setup.py.default
               $LANG_DIR/setup.cfg.default
               $LANG_DIR/__version__.py.default
               $LANG_DIR/__init__.py.default)
    FILES_DST=($PROJECT_DIR/LICENSE
               $PROJECT_DIR/README.md
               $PROJECT_DIR/.gitignore
               $PROJECT_DIR/MANIFEST.in
               $PROJECT_DIR/setup.py
               $PROJECT_DIR/setup.cfg
               $PROJECT_DIR/$PROJECT_NAME/__version__.py
               $PROJECT_DIR/$PROJECT_NAME/__init__.py)
}
