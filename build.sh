#!/bin/bash

rm -rf update.log
git pull | tee build.log
hexo clean && hexo g  | tee build.log
