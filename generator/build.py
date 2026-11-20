#!/usr/bin/env python3
"""Regenerate every OS/400 source file in ../src from the generator modules.

Run from this folder:   python3 build.py
Set OV_OUT to write somewhere else, for example:   OV_OUT=/tmp/out/ python3 build.py
"""
import os
ORDER = ['g1.py', 'gh.py', 'gl.py', 'g2.py', 'g3.py', 'gcal.py', 'gcal2.py', 'g4.py', 'g5.py', 'g6.py', 'g7.py']
here = os.path.dirname(os.path.abspath(__file__))
os.chdir(here)
ns = {}
for f in ORDER:
    exec(compile(open(f).read(), f, 'exec'), ns)
os.makedirs(ns['OUT'], exist_ok=True)
ns['flush']()
print(len(ns['SRC']), 'files,', sum(len(v) for v in ns['SRC'].values()), 'lines written to', ns['OUT'])
