#!/usr/bin/env bash
set -x
# script here will create new subversion repository (file based).
# then it will make 10 commits
# Then we will manipulate the commit dates of the ten commits

START_FOLDER=$(pwd)
REPO=repo02
WD=working2
HOOKFILE=$REPO/hooks/pre-revprop-change
# svn repository
svnadmin create $REPO

echo '#!/usr/bin/env bash' > $HOOKFILE
echo 'exit 0' >> $HOOKFILE
chmod +x $HOOKFILE


#checkout a working copy

cd "$START_FOLDER"

svn checkout "file://$START_FOLDER/$REPO" "$WD"
cd "$START_FOLDER"
cd "$WD"

touch README.txt
svn add README.txt

for i in 1 2 3 4 5 6 7 8 9 10
do
   echo "line $i" >> README.txt
   svn ci -m "commit number $i (originally created $(date +"%Y-%m-%d %T"))"
done

svn update
svn log
