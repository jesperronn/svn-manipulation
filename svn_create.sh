#!/usr/bin/env bash
set -x
# script here will create new subversion repository (file based).
# then it will make commits
# Then we will manipulate the commit dates of the ten commits

START_FOLDER=$(pwd)
REPO=repo02
WD=working2
HOOKFILE=$REPO/hooks/pre-revprop-change
# svn repository
svnadmin create $REPO

# ensure hook 'pre-revprop-change' exists
echo '#!/usr/bin/env bash' > $HOOKFILE
echo 'exit 0' >> $HOOKFILE
chmod +x $HOOKFILE


#checkout a working copy

cd "$START_FOLDER"

svn checkout "file://$START_FOLDER/$REPO" "$WD"
cd "$START_FOLDER"
cd "$WD"


FILES="fil_a.txt fil_b.txt fil_c.txt"
touch $FILES
svn add $FILES

for i in 1 2 3 4 5 # 6 7 8 9 10
do
  for f in $FILES
  do
    echo "linie $i" >> "$f"
  done
  svn ci -m "ændring nr. $i"
done

svn update
