#!/usr/bin/env python3

# Check version info in changelog and info.json and zip it up for release

import argparse
import json
from pathlib import Path
from sys import stderr
import zipfile as zf
import os

os.chdir(Path(__file__).resolve().parent)

mod_name = "kittycat"
mod_path = Path(mod_name)

parser = argparse.ArgumentParser(
    description="Zip up this mod, making sure the version is consistent. If no version is given,"
        " it will be taken from 'info.json'.")
parser.add_argument('ver', nargs='?', metavar="VERSION", help="version of the mod to make")

version = parser.parse_args().ver

# Read info.json
with open(mod_path/'info.json', 'r') as f:
    info_ver = json.load(f)['version']

# Read changelog.txt
with open(mod_path/'changelog.txt', 'r') as f:
    # We expect very precise syntax here already, so lets just assume it
    f.readline()
    change_ver = f.readline()[9:].strip()

# Check for version inconsistencies
if info_ver != change_ver or (version is not None and version != info_ver):
    print("Version mismatch:")
    if version is not None:
        print(f"Given:\t\t{version}")
    print(f"info.json:\t{info_ver}")
    print(f"changelog.txt:\t{change_ver}")
    exit(1)
version = info_ver

# Ask if overwriting
zf_path = Path(mod_name + '_' + version + '.zip')
if zf_path.exists():
    if not input(f"'{zf_path}' already exists. Are you sure you want to replace it? [y/n] ")\
            .lower().startswith('y'):
        print("Aborted.")
        exit(2)

# I find it wild that doing this recursively is not a built-in method in the zipfile module
compression = zf.ZIP_STORED
with zf.ZipFile(zf_path, 'w', compression) as zfile:
    for dirpath, dirnames, filenames in mod_path.walk():
        for fn in filenames:
            zfile.write(dirpath/fn)

print(f"Wrote: {zf_path}")
