#!/usr/bin/python

import argparse
import os
from random import random
import math

MPV ="/home/will/.config/xwinwrap/wallpaper-live"
FIRST_SUFFIX="first.mp4"
SECOND_SUFFIX="second.mp4"

def run_random(res, dir):
    first, second = [], []

    if dir[-1] == "/":
        dir = dir[:-1]

    for file in os.listdir(dir):
        if file.endswith(FIRST_SUFFIX):
            first.append(file[:-len(FIRST_SUFFIX)])
        if file.endswith(SECOND_SUFFIX):
            second.append(file[:-len(SECOND_SUFFIX)])

    if not len(first): 
        return

    rand = math.floor(random() * len(first))
    [x_res, _] = res.split("x")
    file = first[rand]

    first_file = f"{dir}/{file}{FIRST_SUFFIX}"
    second_file = f"{dir}/{file}{SECOND_SUFFIX}"

    run_wallpaper(res, first_file)
    run_wallpaper(res, second_file, x_res)

def run_wallpaper(res, path, offset_x=0):
    print(f"xwinwrap -g {res}+{offset_x}+0 -un -fdt -ni -b -nf -ov \
            -- {MPV} WID {path} &")
    os.system(f"xwinwrap -g {res}+{offset_x}+0 -un -fdt -ni -b -nf -ov \
            -- {MPV} WID {path} &")


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("-d", "--dimension", nargs=1,
                    help="the wallpaper dimension", required=True)
    parser.add_argument("-w", "--wallpaper", nargs="+",
                    help="the file path(s)", action="append")
    parser.add_argument("-r", "--random", nargs=1, type=str,
                    help="the directory path", required=False)

    args = parser.parse_args()
    os.system("killall -9 xwinwrap")

    if args.random and args.wallpaper:
        exit("Must provide either a set of selections, " + 
             "or a random directory. Not both")

    res = args.dimension[0]
    [x_res, _] = res.split("x")
    if args.random:
        run_random(res, args.random[0])
        return

    for i, path in enumerate(args.wallpaper[0]):
        run_wallpaper(x_res, path, x_res if i > 0 else 0)

if __name__ == "__main__":
    main()
