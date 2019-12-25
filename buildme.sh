#!/bin/bash

pandoc --toc metadata.yaml README  */*md *md -o recetario.pdf

