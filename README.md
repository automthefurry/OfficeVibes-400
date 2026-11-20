# OfficeVibes/400

**An office suite for the green screen.** Calendar, mail, messages, live chat, notes, tasks, a phone book, documents, spreadsheets, games and an office cat, written in ILE RPG IV for IBM AS/400 systems running OS/400 V5R1 or later.

OfficeVibes/400 is a hobby project inspired by IBM's OfficeVision. It runs on 5250 terminals and emulators, stores everything in ordinary database files, and builds from source with one command.

```
 OFCMAIN                         OfficeVibes/400                      11/19/2026
                         O F F I C E V I B E S / 4 0 0
                            Office Suite for OS/400
  Select one of the following:
                                                        November 2026
        1. Calendar                     2 today        Su Mo Tu We Th Fr Sa
        2. Mail, messages and chat      3 new            1  2  3  4  5  6  7
        3. Notes, tasks and phone book  4 open           8  9 10 11 12 13 14
        4. Documents and spreadsheets                   15 16 17 18>19 20 21
        5. Search everything                            22 23 24 25 26 27 28
        6. Office directory                             29 30
        7. Games and the office cat
        8. Printed output                                     /|_/|
        9. Settings                                          ( o.o )
       10. Administration                                     > w <
```

## Features

| Area | What you get |
|---|---|
| **Calendar** | A "Process Calendars" menu in the OfficeVision style; day, N-day, business-week, boxed month and six-month views; appointments over several days; all-day events; meetings with clash checking; conference rooms; shared calendars with view and change rights; company holidays; calendar search; printing; reminders 15 minutes ahead |
| **Mail and messages** | Memos with subject and eight lines, one-line messages, inbox and sent views, reply, forward, distribution groups, `ALL`, unread counts, printing |
| **Live chat** | One-to-one or an office-wide room, refreshing by itself every two seconds |
| **Organizer** | Notes on a notepad, a to-do list with priorities, due dates and a progress bar, and a phone book with an A to Z strip and contact card |
| **Documents** | A full-screen editor for documents of up to 500 lines, with insert, delete, save and print |
| **Spreadsheets** | 8 columns by 99 rows, typing straight into the cells, Tab between cells, formulas with `+ - * /` and `SUM AVG MIN MAX COUNT`, bar charts, printing |
| **Search** | One search across messages, mail, events, notes, tasks, contacts, documents and the directory |
| **Fun** | Tetris, an unbeatable tic-tac-toe, guess the number, and an office cat to feed and pet. An animated character (coffee, cat, dog, robot or fish) sits beside the calendar |
| **Administration** | Enroll users (optionally creating their sign-on), groups, an activity log, statistics, clean-up of old items, break messages to every display, and the reminder service |
| **Everywhere** | Pick with the cursor, F1 help on every screen, F4 user lookup windows, and spooled printing |

## Requirements

- An AS/400 or iSeries running **OS/400 V5R1** or later
- **WebSphere Development Studio** (5722WDS), for the ILE RPG compiler, `CRTBNDRPG`
- TCP/IP with the **FTP server** running, or another way to put files in the IFS
- A user profile with `*ALLOBJ` authority (such as QSECOFR) to build it

## Quick install

Full details are in **[docs/INSTALL.md](docs/INSTALL.md)**.

1. On the AS/400, create the library and folders:
   ```
   MKDIR DIR('/home/office')
   CRTLIB OFFICE
   CRTSRCPF FILE(OFFICE/QCLSRC) RCDLEN(92)
   ```
2. Upload everything in [`src/`](src) to `/home/office` as **ASCII text**. An FTP script is in [`scripts/`](scripts).
3. Build:
   ```
   CPYFRMSTMF FROMSTMF('/home/office/BLDOFF.CLLE') TOMBR('/QSYS.LIB/OFFICE.LIB/QCLSRC.FILE/BLDOFF.MBR') MBROPT(*REPLACE)
   CRTBNDCL PGM(OFFICE/BLDOFF) SRCFILE(OFFICE/QCLSRC) SRCMBR(BLDOFF)
   CALL OFFICE/BLDOFF
   ```
4. Start it:
   ```
   GO OFFICE/OFFICE
   ```

The build takes a few minutes and ends with either **"OfficeVibes/400 built"** or a list of anything that failed. See [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) if it fails.

## Documentation

- [Installing and upgrading](docs/INSTALL.md)
- [User guide](docs/USER-GUIDE.md): every application and its keys
- [Administrator guide](docs/ADMIN-GUIDE.md): users, rooms, holidays, reminders and authority
- [Troubleshooting](docs/TROUBLESHOOTING.md)
- [Developing](docs/DEVELOPING.md): how the source is generated, and how to change it
- [Changes](CHANGELOG.md)

## Repository layout

```
src/         The OS/400 source: RPG IV programs, DDS screens and files, CL. Upload these.
generator/   Python that writes everything in src/. Change these, not src/.
docs/        Guides.
scripts/     An FTP upload script.
```

## Status

This is a hobby project, built and tested on a single V5R1 machine. The most recent calendar and games changes are the newest code, so build failures there are possible: [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) shows how to read the compiler listing. Back up anything you care about before running it on a system that matters.

## Not affiliated with IBM

OfficeVibes/400 is an independent project. It is not made, supported or endorsed by IBM. AS/400, iSeries, OS/400, OfficeVision and WebSphere are trademarks of IBM.
