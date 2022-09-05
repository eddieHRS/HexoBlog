#!/bin/bash - 
#===============================================================================
#
#          FILE: publish.sh
# 
#         USAGE: ./publish.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2022/09/04 19时47分33秒
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

hexo clean & hexo g & hexo d
