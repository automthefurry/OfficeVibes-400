# Installing OfficeVibes/400

## Before you start

You need:

- OS/400 **V5R1** or later.
- The ILE RPG compiler. Type `CRTBNDRPG` and press **F4**. If a prompt screen appears, you have it. If it says the command is not found, install **5722WDS** (WebSphere Development Studio) first.
- A way to copy files into the IFS. These steps use FTP, so the FTP server must be running: `STRTCPSVR SERVER(*FTP)`.
- To sign on as **QSECOFR**, or another profile with `*ALLOBJ`, for the build.

Everything is installed into one library, **OFFICE**, and its source is kept in the IFS folder **/home/office**.

## 1. Create the library and folders

On the AS/400 command line, one at a time:

```
MKDIR DIR('/home/office')
```
```
CRTLIB OFFICE
```
```
CRTSRCPF FILE(OFFICE/QCLSRC) RCDLEN(92)
```

If any of these says the object already exists, carry on.

## 2. Upload the source

Copy **every file** in the `src/` folder of this repository to `/home/office`, in **ASCII (text) mode**. Binary mode will not work.

### With the FTP script (Windows)

1. Edit [`scripts/upload-ftp.txt`](../scripts/upload-ftp.txt): put in your system's address, user and password.
2. From the top folder of this repository, run:
   ```
   ftp -n -s:scripts\upload-ftp.txt
   ```
3. Delete the password from the script afterwards.

### By hand

```
ftp your.as400.address
(sign on)
quote site namefmt 1
ascii
cd /home/office
prompt
lcd src
mput *
quit
```

### With a graphical tool

Any tool that can reach the IFS works, such as the iSeries Navigator file browser or an SFTP/FTP client. Use text mode and put the files in `/home/office`.

## 3. Build

```
CPYFRMSTMF FROMSTMF('/home/office/BLDOFF.CLLE') TOMBR('/QSYS.LIB/OFFICE.LIB/QCLSRC.FILE/BLDOFF.MBR') MBROPT(*REPLACE)
```
```
CRTBNDCL PGM(OFFICE/BLDOFF) SRCFILE(OFFICE/QCLSRC) SRCMBR(BLDOFF)
```
```
CALL OFFICE/BLDOFF
```

`BLDOFF` copies the source into source files, creates the data files that don't exist yet, compiles every screen file and program, sets authorities and creates the `OFFICE` menu. It keeps going past a failure and reports everything that failed at the end:

- **OfficeVibes/400 built.  Type GO OFFICE/OFFICE**: done.
- **Build FAILED for: ...**: see [TROUBLESHOOTING.md](TROUBLESHOOTING.md). The message may be cut off at the edge of the screen. Put the cursor on it and press **F1** to read it all.

## 4. Start it

```
GO OFFICE/OFFICE
```

The first person to open it becomes an office **administrator**, and so does QSECOFR when it enrolls. Everyone else is enrolled as an ordinary user the first time they open it.

### Making it the first screen users see

```
CHGUSRPRF USRPRF(JSMITH) INLMNU(OFFICE/OFFICE)
```

Administrators can also create sign-ons from inside the suite (**Administration**, then **Users**, then F6), with the office menu already set as their first screen.

## Upgrading

1. Upload the new `src/` files to `/home/office`, replacing the old ones.
2. Make sure **nobody has OfficeVibes open**. A screen file that is in use cannot be replaced; the build reports it as `NAME(IN-USE)`.
3. Run the three build commands again.

Your data is kept. Data files are only created when they don't exist, so a rebuild never empties them.

> Upgrading from a build before version 3 (the first RPG IV suite): the first build of version 3 or later replaces the old data files once, because their layout changed. The data area `OFFICE/OVDBV3` records that this has been done.

## Uninstalling

```
DLTLIB LIB(OFFICE)
```

Then delete `/home/office` with `WRKLNK '/home/office'`, if you want the source gone too. If the reminder service is running, stop it first (**Administration**, option 13).
