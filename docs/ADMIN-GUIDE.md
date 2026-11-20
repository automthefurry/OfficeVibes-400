# Administrator guide

## Who is an administrator

The first person to open OfficeVibes/400 becomes an administrator, and QSECOFR is made one when it enrolls. Administrators can make others administrators under **Users**.

**Administration** is option 10 on the main menu.

| Option | Does |
|---|---|
| 1 | **Users**: enroll, change, disable, enable and remove users |
| 2 | **Groups**: distribution lists for mail and messages |
| 3 | **Activity log**: who did what and when; filter and print it |
| 4 | **Statistics**: how much is stored, and the most active users |
| 5 | **Clean up**: delete old *read* messages, mail and log entries |
| 6 | **Notice**: a break message to every display |
| 7 to 11 | System status, active jobs, disk status, all spooled files, and QSYSOPR messages |
| 12, 13 | Start and stop the **reminder service** |

## Users

Everyone is enrolled automatically the first time they open the suite. To add someone in advance, press **F6**. If you also set **Create sign-on** to Y and type a password, the OS/400 user profile is created too, with `OFFICE/OFFICE` as its first menu. Creating sign-ons needs `*SECADM` special authority. The password is never logged.

**Disabling** a user (option 5) keeps their data but stops them opening the suite. You cannot disable or remove yourself.

## Groups

A group is a name, such as `SALES`, with members. Mail or a message sent to the group name goes to every member. Group names cannot be `ALL`.

## Conference rooms and holidays

On the calendar's Process Calendars menu:

- **Option 3, Conference rooms**: administrators add rooms with **F6**, giving a code (such as `ROOM1`), a name and seats. Each room gets a shared calendar, `#ROOM1`, that anyone can book.
- **Option 13, Company holidays**: administrators add holidays with **F6**. They appear on every calendar.

## The reminder service

Option 12 submits a batch job, **OVREMIND**, that sends each user a message 15 minutes before every appointment that has a time. Start it once; it runs until you stop it with option 13, or the system is ended.

- It is submitted to job queue **QSYSNOMAX** if that exists, otherwise to your default job queue. If that queue allows only one active job, as **QBATCH** often does, the service will hold it, so a queue like QSYSNOMAX is better.
- `WRKACTJOB` shows it as `OVREMIND`.
- Restart it after an IPL.

Whether a reminder pops up or waits in the user's message queue depends on their **Pop-up messages** setting under Settings.

## Authority

The build gives `*PUBLIC *CHANGE` authority to every object in `OFFICE`, so all users can use the suite. Some functions need more:

| Function | Needs |
|---|---|
| Creating sign-ons | `*SECADM` |
| Notice to every display | `*JOBCTL` |
| System status, active jobs and similar options | The authority those commands normally need |

## Where the data lives

All data is in library `OFFICE`:

| File | Holds |
|---|---|
| OVUSERP | Enrolled users |
| OVMSGP, OVMAILP | Messages and mail |
| OVCHATP | Chat lines (never purged) |
| OVCALP | Appointments; room calendars use owners starting with `#` |
| OVCAUTP, OVROOMP, OVHOLP | Calendar sharing, rooms and holidays |
| OVNOTEP, OVTASKP, OVPHONP | Notes, tasks and contacts |
| OVDOCP, OVDOCLP | Documents and their lines |
| OVSHTP, OVSHCP | Spreadsheets and their cells |
| OVGRPP, OVLOGP | Groups and the activity log |
| OVCATP, OVSCORP, OVPREFP | Cats, game scores and preferences |

Back them up with the library: `SAVLIB LIB(OFFICE)`.
