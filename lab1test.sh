#!/bin/bash



mkdir -p $1

cd $1

mkdir -p d1/d1.1 && touch d1/d1.1/t1.txt

mkdir -p d2/d2.1 && touch /d2/d2.1/f1.csv

mkdir -p d3.1 /d3.2 && touch /d3.2/f2.csv

mkdir -p Aa Bb Cc

cd d1
mv t1.txt d1.1/

cp $1/d2/d2.1/f1.csv $1/d1/
cd $1
mv Aa Aa1
ls -d *[12]/

du -h --max-depth=1 $1



