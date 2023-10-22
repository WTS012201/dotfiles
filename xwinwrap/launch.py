#!/usr/bin/python

import argparse
import os
from random import random
import math

MPV="/home/will/.config/xwinwrap/wallpaper-live"
MPV_FLIPPED ="/home/will/.config/xwinwrap/wallpaper-live-flipped"

def run_random(res, dir):
    if dir[-1] == "/":
        dir = dir[:-1]

    files = os.listdir(dir)
    if not len(files): 
        return

    rand = math.floor(random() * len(files))
    [x_res, _] = res.split("x")
    file = files[rand]

    selected_file = f"{dir}/{file}"

    run_wallpaper(res, selected_file)
    run_wallpaper(res, selected_file, x_res, MPV_FLIPPED)

def run_seq(res, dir):
    os.environ["XWINWRAP_INDEX"]

def run_wallpaper(res, path, offset_x=0, mpv=MPV):
    os.system(f"xwinwrap -g {res}+{offset_x}+0 -un -fdt -ni -b -nf -ov \
            -- {mpv} WID {path} &")


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("-d", "--dimension", nargs=1,
                    help="the wallpaper dimension", required=True)
    parser.add_argument("-w", "--wallpaper", nargs="+",
                    help="the file path", action="append")
    parser.add_argument("-r", "--random", nargs=1, type=str,
                    help="the directory path", required=False)
    parser.add_argument("-s", "--sequential", nargs=1, type=str,
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

    if args.sequential:
        run_seq(res, args.random[0])
        return

    for i, path in enumerate(args.wallpaper[0]):
        run_wallpaper(x_res, path, x_res if i > 0 else 0)

if __name__ == "__main__":
    main()
