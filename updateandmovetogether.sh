#!/bin/bash
for file in ./*
do
echo $file
if test -d $file
then
cd ${file}
if test -e Cartfile
then
    carthage update --platform iOS
fi
cd ..
fi
done

mkdir framesworks
for file in ./*
do
if test -d ${file:2}  && test -e ${file:2}/Carthage
then
cp -R $file/Carthage/Build/iOS/${file:2}.framework framesworks/${file:2}.framework
fi
done
