#!/bin/env bash

tso 'alloc da(demo.h) recfm(f b) lrecl(80) blksize(0) dir(1) track space(2 2)'
tso 'alloc da(demo.c) recfm(f b) lrecl(80) blksize(0) dir(1) track space(2 2)'
tso 'alloc da(demo.txt) recfm(v b) lrecl(259) blksize(0) dir(1) track space(2 2)'
