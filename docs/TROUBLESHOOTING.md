# Troubleshooting

## The build says "Build FAILED for: ..."

The build keeps going past failures and lists every one at the end. If the list is cut off at the edge of the screen, put the cursor on the message and press **F1**.

Each name in the list is one of these:

| Shown as | Means | What to do |
|---|---|---|
| `NAME(IN-USE)` | Someone had that screen open, so it could not be replaced | Leave OfficeVibes on every terminal, then build again. `WRKOBJLCK OBJ(OFFICE/NAME) OBJTYPE(*FILE)` shows who has it open |
| `NAME screens` | A screen file (DDS) did not compile | Read its listing, as below |
| `NAME` | A program did not compile | Read its listing. If its screen file also failed, fix that first; the program often fails only because of it |
| `NAME.DDS`, `.RPGLE`, `.CLLE` | That file could not be copied from `/home/office` | Check that it was uploaded, with that exact name |
| `OVxxxxP` | A data file could not be created | Read its listing |

### Reading a compiler listing

1. Run `WRKSPLF`.
2. Find the newest entry whose **File** is the failed name (it is near the bottom), type `5` beside it and press Enter.
3. Type `B` in the **Control** field and press Enter to go to the end.
4. Page up to the **Message Summary**. The messages marked severity 30 or higher are the real errors.
5. To find the lines they refer to, type `*ERROR` or the message ID (such as `RNF7030`) in **Find** and press **F16**.

## "Object not found" when copying a file

The library or source file does not exist yet. Run the setup commands in [INSTALL.md](INSTALL.md) step 1.

## A program stops with message CPF4131 (level check)

A data file has an older layout than the program expects. This only happens if a data file's layout changed between versions. Save the file if it holds anything you want, delete it with `DLTF OFFICE/name`, and build again to create it fresh.

## Characters look wrong, or a screen file fails for no clear reason

The source must be uploaded in **ASCII mode**, and the source files expect code page 37 (US English). If your system uses another language, add `DBFCCSID(37)` to the `CPYFRMSTMF` commands in `BLDOFF`. Never edit the source with a word processor: curly quotes and other non-ASCII characters break the DDS.

## The calendar character, chat or Tetris does not move by itself

These use timed reads, which need the screen file to be built with a wait time. The build does this. If your display cannot do it, the program says so and falls back to moving only when you press a key. In Tetris, press Enter to let time pass.

## "Program ... could not be run"

That program did not build. Run the build again and check its listing.

## The reminder service does not send anything

- Check that it is running: `WRKACTJOB` and look for **OVREMIND**.
- It only reminds about appointments that have a **time**, 15 minutes before.
- The message goes to the user's message queue. With **Pop-up messages** set to N, it waits there quietly.
