# Developing

## The source in `src/` is generated

RPG IV in fixed format and DDS are column-sensitive: one character out of place is a compile error. So every file in `src/` is written by the Python modules in `generator/`, which lay out the columns and check the result. **Change the generator, then regenerate.** Edits made directly to `src/` are overwritten the next time it runs.

Python 3.8 or later is enough; nothing else needs installing.

```
cd generator
python3 build.py
```

This rewrites all of `src/` and prints how many files and lines it wrote. Set `OV_OUT` to write somewhere else:

```
OV_OUT=/tmp/check/ python3 build.py
```

### Previewing screens without an AS/400

```
python3 preview.py OVCAL:PMENU OFFMNU:MNUREC
```

This prints each screen record as text. `#` marks an output field and `_` a field you can type in.

## What the generator checks

Before writing anything, it refuses to continue if:

- A line is longer than 80 characters, or contains anything other than plain ASCII.
- Two items on a screen overlap, counting the attribute byte in front of each one.
- A name is used in the RPG that is not defined anywhere.
- `IF`, `DO`, `SELECT` and their ends do not balance inside each subroutine.
- A name is defined twice, or is used for both a field and a subroutine.
- A screen record has no help page.

These catch most mistakes, but not all. The OS/400 compiler has the final say.

## The modules

| File | Contains |
|---|---|
| `g1.py` | The core: DDS and RPG writers, the checks, and the subroutines every program shares (header, dates, logging, printing, the user lookup) |
| `gh.py` | Help text for every screen |
| `gl.py` | The list layouts that give each application its own look |
| `g2.py` | Main menu, profile, Messages and Mail |
| `g3.py` | Notes, Tasks, Phone book and Documents |
| `gcal.py` | The calendar |
| `gcal2.py` | Conference rooms, calendar sharing, holidays, calendar search and meetings |
| `g4.py` | Administration, users, groups, log, statistics, the cat, games, the CL programs and the build script `BLDOFF` |
| `g5.py` | Search everything and Live chat |
| `g6.py` | Spreadsheets |
| `g7.py` | The reminder service |

They are run in the order listed in `build.py`.

## How the RPG is written

RPG is written as one statement per line:

```
EVAL MSG = 'Saved.'               free-form opcode: EVAL, IF, DOW, WHEN, ...
KEY1 | CHAIN | NOTEREC            fixed form: factor 1 | opcode | factor 2 | result | indicators
 | EXFMT | NLIST
* a comment
```

Long expressions are wrapped onto continuation lines automatically.

## Conventions

- Programs are compiled with `DFTACTGRP(*YES)`, so there are no subprocedures; shared logic is in subroutines.
- Indicators: 03 and 12 exit and cancel; 04 to 11 are function keys; 40 to 46 control screens (45 and 46 drive the timed refresh); 50 to 52 are call, read and timeout errors; 61 to 90 colour individual list rows.
- Every data file is created only if missing. **Changing an existing data file's layout** stops existing installations at level check CPF4131, so add a new file instead where you can.
- The display files `OVCAL`, `OVCHAT` and `OVGAME` are built with `WAITRCD` so that they can refresh by themselves.

## Adding an application

1. Add a screen with `Scr(...)` and its records.
2. Add a help entry with `H(...)` in `gh.py` for each record.
3. Write the program with `prog(...)`. For a list screen, `listmain(...)` provides paging, cursor selection and options.
4. Add the screen and program names to the `DSP` and `PG` lists in `g4.py`, and any new data file to `PFS`.
5. Add it to a menu in `g2.py`.
6. Run `python3 build.py`, upload, and build on the AS/400.
