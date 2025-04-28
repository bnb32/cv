#!/bin/bash

rm rendercv_output/Brandon_N._Benton,_PhD_CV.pdf
rendercv render BrandonBenton_CV.yaml
mv rendercv_output/Brandon_N._Benton,_PhD_CV.md ./README.md
cp rendercv_output/Brandon_N._Benton,_PhD_CV.pdf ../bnb32.github.io/docs/cv.pdf
cd ../bnb32.github.io
git add docs/cv.pdf
git commit -m "updated cv"
git push
cd ../cv
