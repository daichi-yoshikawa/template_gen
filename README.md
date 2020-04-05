template_gen
============

## Requisites
As far as you can use bash, you can use this.

## What is this?
Shell script to generate template of cpp or python library/package to get started project immediately. No more manual copying or referring to your own past project dirs and files.

* Make directories in standard way(Eg. cpp project has src, include/<proj> directories under root dir)
* Copy templates of CMakeLists.txt, setup.cfg, setup.py, etc.

If directory with the same name as project name you set exists, template_gen immediately stops and never overwrites the existing directory.

## Usage
Call scripts/template_gen_***.sh <project name> <relative path>.

```
$ cd <some directory>
$ git clone https://github.com/daichi-yoshikawa/template_gen
$ cd template_gen
```
If you start cpp project,
```
$ ./scripts/template_gen_cpp.sh <project name> <relative path>
```
Eg.
```
$ ./scripts/template_gen_cpp.sh robot_dynamics ..
```

If you start python project,
```
$ ./scripts/template_gen_python.sh <project name> <relative path>
```
Eg.
```
$ ./scripts/template_gen_python.sh neuralnet ..
```

## Template of C++
* project dir: <relative path>/<proj-name>
* src dir: <proj-name>/src
* header dir: <proj-name>/include/<proj-name>
* test dir: <proj-name>/test
* build dir: <proj-name>/build
* CMakeLists.txt templates: <proj-name>/CMakeLists.txt, <proj-name>/test/CMakeLists.txt
* .gitignore: <proj-name>/.gitignore
* test_main.cpp: <proj-name>/test/test_main.cpp <- Hello, world is implemented.
* license doc: <proj-name>/LICENSE <- Only BSD3 is supposed now.
* empty README: <proj-name>/README.md

## Template of Python
* project dir: <relative path>/<proj-name>
* script dir: <proj-name>/<proj-name> <- You're supposed to create .py files under this dir.
* test dir: <proj-name>/tests
* setup.cfg with default implementation: <proj-name>/setup.cfg
* setup.py with default implementation: <proj-name>/setup.py
* MANIFEST.in: <proj-name>/MANIFEST.in
* __init__.py with default import: <proj-name>/<proj-name>/__init__.py, <proj-name>/tests/__init__.py
* .gitignore: <proj-name>/.gitignore
* license doc: <proj-name>/LICENSE <- Only BSD3 is supposed now.
* empty README: <proj-name> README.md