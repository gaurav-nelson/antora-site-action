#!/bin/sh

set -eu 
set -o pipefail 

echo "Using args:
 src: $INPUT_SITE_SOURCES_PATH
 playbook: $INPUT_ANTORA_PLAYBOOK
 generator: $INPUT_ANTORA_GENERATOR
 docsearch enabled: $INPUT_ANTORA_DOCSEARCH_ENABLED
 docsearch indexed version: $INPUT_ANTORA_DOCSEARCH_INDEX_VERSION
 "

cd $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH

ls -ltr $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH

NODE_PATH="$(npm -g root)" \
DOCSEARCH_ENABLED=$INPUT_ANTORA_DOCSEARCH_ENABLED \
DOCSEARCH_INDEX_VERSION=$INPUT_ANTORA_DOCSEARCH_INDEX_VERSION \
DOCSEARCH_ENGINE=lunr \
antora \
--generator $INPUT_ANTORA_GENERATOR \
--stacktrace $INPUT_ANTORA_PLAYBOOK
