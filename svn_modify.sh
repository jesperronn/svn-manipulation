#!/usr/bin/env bash
#
# We have 10 commits in a repository. Lets set commit dates to May 1st, 1981-1990
#
# set -x

START_FOLDER=$(pwd)
WD=working2


cd "$START_FOLDER"
cd "$WD"

for i in 1 2 3 4 5 6 7 8 9 10
do
  YEAR=$(echo "1980 + $i" | bc )
  svn propset --revprop -r $i  svn:date "$YEAR-05-01T10:00:00.000000Z"
done

svn update
