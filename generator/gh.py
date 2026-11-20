CUR = 'You can also put the cursor on a line and press Enter to pick it.'
PG = 'F7 and F8 page backward and forward through a long list.'
F4U = 'F4 opens a list of enrolled users to pick from.'
def H(rec, title, *lines): HELP[rec] = (title, list(lines))
H('MNUREC', 'Main menu', 'Type the number of an option and press Enter.', CUR, '',
  ' 1  Calendar: appointments, meetings, rooms, holidays and shared calendars.',
  ' 2  Mail, messages and chat: a menu of the three ways to reach people.',
  ' 3  Notes, tasks and phone book: a menu of your own organizer.',
  ' 4  Documents and spreadsheets, and the printed output they make.',
  ' 5  Search everything: one search across all of your office items.',
  ' 6  Office directory: who is enrolled.',
  ' 7  Games and the office cat.',
  ' 8  Printed output: everything you printed with a Print key.',
  ' 9  Settings: your name and phone, pop-ups, animations and more.',
  '10  Administration: for office administrators only.', '',
  'The counts beside the options show what is waiting for you.',
  'F3 or 90 leaves the office.  F5 refreshes the counts.')
H('SUBM', 'Menu', 'Type the number of an option and press Enter, or put the cursor on it', 'and press Enter.', '',
  'The counts show new mail and messages, and open tasks.', 'F12 goes back to the main menu.')
H('PROF', 'Settings', 'Name, department and phone: how others see you in the office directory.',
  'Pop-up messages: Y shows reminders, mail and chat requests at once.',
  'Time zone: your offset from UTC, such as -05:00.  New appointments use it',
  'and are stored in office time.  Blank means you are in office time.',
  'Week starts on: S or M, for every month on the screen.',
  'Working day: new appointments start at the start, and the week and month',
  'views are drawn around these hours.',
  'Units: I for 12-hour clock and M/D/YYYY, M for 24-hour and D.M.YYYY.',
  'Animations: N stops everything that moves by itself.  Character is shown',
  'on the calendar.  Screen saver: idle minutes, 0 never.  Chat refresh: A',
  'shows new lines as they arrive, M only when you press F5.')
H('LKWIN', 'Office directory', 'Everyone enrolled in OfficeVibes, with department and phone.', '',
  'Type part of a name, user ID or department in Find and press Enter to',
  'narrow the list.  Type any letter beside a person, or put the cursor on',
  'the line, and press Enter to choose them.  F7 and F8 page.',
  'F12 goes back without choosing.')
H('MLIST', 'Message Center', 'Short messages sent to you, newest first.  Unread ones are bright and',
  'marked with a star.  The tabs show whether you are looking at your inbox',
  'or the messages you have sent.  F10 switches between them.', '',
  'Options: 4 deletes, 5 shows the message in the box at the bottom, R replies.', CUR, '',
  'F6 sends a new message.  F9 sends one to everybody.', 'F4 searches all of your office items.', PG)
H('MSEND', 'Send a message', 'Type who it is for and one line of text, then press Enter.', '',
  'To can be a user ID, the name of a distribution group, or ALL for everyone.', F4U, '',
  'The person also gets a system message telling them it has arrived.')
H('LLIST', 'Mailbox', 'Memos sent to you, newest first.  Unread ones are bright, with a star.',
  'F10 switches between your mailbox and the mail you have sent.', '', 'Options: 4 deletes, 5 opens the memo.', CUR, '',
  'F6 writes a new memo.  F4 searches all of your office items.', PG)
H('LCOMP', 'Compose mail', 'Fill in who it is for, a subject and up to eight lines, then press Enter.', '',
  'To can be a user ID, the name of a distribution group, or ALL for everyone.', F4U, '', 'F12 leaves without sending.')
H('LREAD', 'Read mail', 'F6 replies to the sender.', 'F9 forwards the memo to someone else, with the text copied in.',
  'F10 prints the memo.  Find it under Printed output on the main menu.', 'Enter or F12 goes back to the list.')
H('NLIST', 'Notepad', 'Your own notes, oldest first, on a yellow pad.  Nobody else can see them.', '',
  'Type a word in Find and press Enter to show only the notes that contain it.', 'Options: 2 changes a note, 4 deletes it.', CUR, '',
  'F6 writes a new note.  F9 prints all of your notes.', PG)
H('NEDIT', 'Write a note', 'Type the note and press Enter to save it.  F12 leaves without saving.')
H('TLIST', 'To-do list', 'Your to-do list.  [X] marks a finished task.  The letter is the priority:',
  'H high, M medium, L low.  Finished tasks are blue, overdue ones red.',
  'The progress bar shows how much of the list is done.', '',
  'Options: 2 marks a task done, 9 reopens it, 4 deletes it.', 'Cursor on a task and Enter marks it done.', '',
  'F6 adds a task.  F9 prints the list.  F11 removes every finished task.', PG)
H('TADD', 'Add a task', 'Type what needs doing.  The due date and priority are optional.', '',
  'Due date: month/day, such as 3/15, or month/day/year.', 'Priority: H, M or L.  Anything else is taken as M.')
H('PLIST', 'Phone book', 'Your own contacts, in name order.  The card on the right shows one entry.', '',
  'Type part of a name, number or note in Find and press Enter to search.',
  'Put the cursor on a letter of the alphabet line and press Enter to list',
  'only names starting with it.  The * at the end shows every name again.', '',
  'Options: 5 shows the card, 2 changes an entry, 4 deletes it.',
  'Cursor on a name and Enter also shows its card.', '', 'F6 adds an entry.  F9 prints the phone book.', PG)
H('PADD', 'Phone book entry', 'Only the name is required.  Press Enter to save, F12 to leave unchanged.')
H('CMAIN', 'Calendar', 'The top of the screen shows one month.  > marks the day you are looking at',
  'and * marks days that have appointments.  The lower half lists that day.', '',
  'To open another day, put the cursor on it and press Enter, or type a date',
  'such as 3/15 in the Date field and press Enter.',
  'Type 2 beside an appointment to change it, or 4 to delete it.', '',
  'F6 adds an appointment.      F7 and F8 show the previous and next month.',
  'F10 goes back to today.      F11 shows more when a day has over six.',
  'F9 prints the day.           F4 searches all of your office items.', '',
  'The character beside the month moves about once a second.  F5 changes it:',
  'coffee, cat, dog, robot, fish, then none.  Choose none if it gets in the',
  'way of typing.  If the reminder service is running, you get a message 15',
  'minutes before each appointment that has a time.')
H('CADD', 'Add or change an appointment', 'Date: 3/15 or 3/15/2027, or with dots day first: 15.3.2027.',
  'Last day: for something that lasts several days, such as a trip, type the',
  'last day too.  The appointment is added to every day in between, each',
  'marked with its day number, such as (2/5).  Up to 31 days.  Each day can',
  'then be changed or deleted on its own.', '',
  'Time: hours and minutes on the 24-hour clock, such as 9:00 or 14:30.',
  'Leave the time blank for something that lasts all day.  00:00 means',
  'midnight, not all day.',
  'Time zone: the zone the time is in.  It is changed to office time, which',
  'is what everyone sees, and the message says the office time.',
  'Type what it is and press Enter to save.  F12 leaves without saving.')
H('DLIST', 'Documents', 'Each line is one of your documents, fourteen to a page.  A document', 'holds up to 500 lines of text.', '',
  'Type an option beside a document:',
  '2 opens the editor, 6 prints the document, 4 deletes it.',
  'Or put the cursor on its line and press Enter to open it.', '', 'F6 creates a new document.', PG)
H('DNEW', 'New document', 'Give the document a short name and a title, then press Enter.', 'The editor opens straight away.')
H('DEDIT', 'Document editor', 'Type on any of the fifteen lines.  What you type is kept when you press',
  'Enter or any function key, but it is only stored when you press F10.', '',
  'F7 and F8 move up and down through the document, fifteen lines at a time.',
  'F6 inserts an empty line where the cursor is.', 'F9 deletes the line where the cursor is.',
  'F10 saves the document.  F11 prints it.', '', 'F3 leaves.  If there are unsaved changes you are warned once first.')
H('AMENU', 'Administration', 'Type a number and press Enter, or put the cursor on a line and press Enter.', '',
  ' 1  Users: enroll, change, disable and remove office users.', ' 2  Groups: distribution lists for messages and mail.',
  ' 3  Activity log: who did what, and when.', ' 4  Statistics: how much is stored, and who is most active.',
  ' 5  Clean up: delete old read messages, mail and log entries.', ' 6  Notice: a break message to every display.',
  ' 7 to 11  Operating system displays.  These need system authority.', '',
  '12  Start the reminder service.  This runs as a batch job called OVREMIND',
  '    and sends each user a message 15 minutes before every timed',
  '    appointment.  Start it once; it keeps running until you stop it.',
  '13  Stop the reminder service.')
H('APURGE', 'Clean up old items', 'Deletes read messages and read mail older than the first number of days,',
  'and activity log entries older than the second, for every user.', '', 'Unread items are never deleted.  This cannot be undone.')
H('ANOTE', 'Notice to every display', 'The text is sent as a break message to every display station.', 'You need *JOBCTL special authority for this to work.')
H('ULIST', 'Users', 'Everyone enrolled in the office.', '', 'Type part of a name, ID or department in Find and press Enter to search.',
  'Options: 2 changes a user, 5 disables or enables, 4 removes.', CUR, '',
  'A disabled user cannot open the office.  You cannot disable yourself.', 'F6 enrolls a new user.', PG)
H('UEDIT', 'Enroll or change a user', 'User ID is the OS/400 user profile name.  It cannot be changed later.',
  'Administrator: Y lets the user into the Administration menu.', '',
  'For a new user, Create sign-on Y also creates the OS/400 user profile with',
  'the password you type, and makes the office menu the first thing they see.',
  'That needs *SECADM special authority.  The password is never logged.')
H('GLIST', 'Groups', 'Each line is one member of one group.', '',
  'Mail or a message addressed to a group name goes to every member.', 'Type 4 beside a line and press Enter to remove that member.', 'F6 adds a member, and creates the group if it is new.', PG)
H('GADD', 'Add a group member', 'Type the group name and the user to add, then press Enter.', F4U, 'You can keep adding members.  F12 goes back to the list.')
H('VLIST', 'Activity log', 'Newest entries first, like a terminal.  Each line shows when, who, where,',
  'the action and a short detail.', '', 'Type part of a user, area or action in Find and press Enter to filter.', 'F9 prints what is listed.', PG)
H('SSTAT', 'Statistics', 'The upper bars show how many items of each kind are stored.',
  'The lower bars show the users with the most activity log entries.', 'Press Enter to go back.')
H('CATSCR', 'The office cat', 'Every user has a cat.  It gets hungrier and less happy as the hours pass.', '',
  'F5 pets it.  F6 feeds it.  F7 plays with it.', 'Type a new name and press Enter to rename it.')
H('GMENU', 'Games', 'Type 1, 2 or 3 and press Enter, or put the cursor on a game and press',
  'Enter.  Your record for each game is shown below the list.')
H('GGUESS', 'Guess the number', 'Type a number from 1 to 100 and press Enter.  You are told whether the',
  'secret number is higher or lower.  Fewer tries is better.  F12 gives up.')
H('GTTT', 'Tic-tac-toe', 'You are X and move first.  Put the cursor on an empty square and press',
  'Enter, or type the number of the square.  The computer answers as O.', '',
  'The computer plays perfectly, so the best you can do is a draw.  It will',
  'win if you make a mistake.', '', 'F5 starts a new game.  F12 goes back.')
H('FLIST', 'Search everything', 'Type a word or part of one in Find and press Enter.', '',
  'The search looks through your messages, mail, calendar, notes, tasks,', 'phone book and documents, and the office directory.',
  'It only finds items that are yours, or were sent to or by you.', '',
  'Type 5 beside a result, or put the cursor on it, and press Enter to see', 'the whole item below the list.', PG)

PARSZN = """
* ---- ZTX such as -05:00 into ZMIN minutes from UTC and ZOUT, or NERR
PARSZN | BEGSR
EVAL NERR = '0'
EVAL ZMIN = 0
EVAL ZH = 0
EVAL ZM = 0
EVAL ZSG = 1
EVAL ZT = %TRIM(ZTX)
EVAL CH = %SUBST(ZT:1:1)
IF CH = '+' OR CH = '-'
IF CH = '-'
EVAL ZSG = -1
ENDIF
EVAL ZT = %TRIM(%SUBST(ZT:2))
ENDIF
EVAL ZL = %LEN(%TRIMR(ZT))
EVAL P1 = %SCAN(':':ZT)
SELECT
WHEN ZL = 0 OR P1 = 1
EVAL NERR = '1'
WHEN P1 > 1
EVAL NSTR = %SUBST(ZT:1:P1-1)
EXSR TONUM
EVAL ZHV = NVAL
EVAL ZMV = 0
IF P1 < ZL
EVAL NSTR = %SUBST(ZT:P1+1:ZL-P1)
EXSR TONUM
EVAL ZMV = NVAL
ENDIF
WHEN ZL <= 2
EVAL NSTR = %SUBST(ZT:1:ZL)
EXSR TONUM
EVAL ZHV = NVAL
EVAL ZMV = 0
WHEN ZL = 4
EVAL NSTR = %SUBST(ZT:1:2)
EXSR TONUM
EVAL ZHV = NVAL
EVAL NSTR = %SUBST(ZT:3:2)
EXSR TONUM
EVAL ZMV = NVAL
OTHER
EVAL NERR = '1'
ENDSL
IF NERR = '0' AND (ZHV > 14 OR ZMV > 59)
EVAL NERR = '1'
ENDIF
IF NERR = '0'
EVAL ZH = ZHV
EVAL ZM = ZMV
EVAL ZMIN = ZSG * (ZHV * 60 + ZMV)
EVAL ZOUT = '+' + %EDITC(ZH:'X') + ':' + %EDITC(ZM:'X')
IF ZMIN < 0
EVAL ZOUT = '-' + %EDITC(ZH:'X') + ':' + %EDITC(ZM:'X')
ENDIF
ENDIF
 | ENDSR
"""
ZNVARS = [S('ZTX', 6), S('ZT', 6), S('ZOUT', 6), S('ZSG', 3, 0), S('ZL', 5, 0), S('ZH', 2, 0), S('ZM', 2, 0), S('ZHV', 9, 0), S('ZMV', 9, 0), S('ZMIN', 5, 0)]
PARSHM = """
* ---- TM holds HH:MM or blank: sets CLT (-1 is all day) or NERR ----
PARSTM | BEGSR
EVAL NERR = '0'
EVAL CLT = -1
EVAL TM = %TRIML(TM)
IF TM <> *BLANKS
EVAL P1 = %SCAN(':':TM)
IF P1 >= 2 AND P1 <= 3
EVAL NSTR = %SUBST(TM:1:P1-1)
EXSR TONUM
EVAL HH = NVAL
EVAL NSTR = %SUBST(TM:P1+1:2)
EXSR TONUM
EVAL MI = NVAL
ELSE
EVAL NERR = '1'
ENDIF
IF NERR = '0' AND (HH > 23 OR MI > 59)
EVAL NERR = '1'
ENDIF
IF NERR = '0'
EVAL CLT = HH * 100 + MI
ENDIF
ENDIF
 | ENDSR
"""
HMVARS = [S('TM', 5), S('HH', 5, 0), S('MI', 5, 0), S('CLT', 5, 0)]
pf('OVSETUP', 'SETREC', [A('STUSER', 10), A('STANIM', 1), N('STSAVE', 3), A('STCHAT', 1), A('STZONE', 6), A('STWEEK', 1),
    N('STDBEG', 4), N('STDEND', 4), A('STUNIT', 1)], ['STUSER'])
SETVARS = [S('ANIMON', 1), S('SAVMIN', 3, 0), S('CHATAU', 1)]
GETSET = '''
EVAL ANIMON = 'Y'
EVAL SAVMIN = 2
EVAL CHATAU = 'A'
PGMUSR | CHAIN(N) | SETREC
IF %FOUND(OVSETUP)
EVAL ANIMON = STANIM
EVAL SAVMIN = STSAVE
EVAL CHATAU = STCHAT
ENDIF
'''
pf('OVPREFP', 'PREFREC', [A('PRUSER', 10), A('PRMASC', 10)], ['PRUSER'])
pf('OVCTOPP', 'TOPREC', [A('TPROOM', 20), A('TPTOPC', 50), A('TPBY', 10), Z('TPSTMP'), A('TPOWN', 10)], ['TPROOM'])
pf('OVCHATP', 'CHATREC', [A('CHROOM', 20), Z('CHSTMP'), A('CHFROM', 10), A('CHTEXT', 60)], ['CHROOM', 'CHSTMP'])
ART = [('COF', ['  (  )  (', '   )  (  )', ' ________', '|        |__', '|        |_|', '(________)'],
               ['   )  (  )', '  (  )  (', ' ________', '|        |__', '|        |_|', '(________)']),
       ('CAT', ['', '  /|_/|', ' ( o.o )', '  > w <', ' /|   |__', '(_|___|__)~'],
               ['       z', '  /|_/|', ' ( -.- )', '  > w <', ' /|   |__', '(_|___|__)_']),
       ('DOG', ['', '   __', '  /  |____', ' ( o      )/', '  |  __  |', '  |_|  |_|'],
               ['', '   __', '  /  |____', ' ( o      )-', '  |  __  |', '   |_| |_|']),
       ('ROB', ['    _|_', '   [o o]', '  /[ = ]/', '   [___]', '    | |', '   _| |_'],
               ['    _|_', '   [- -]', '  -[ = ]-', '   [___]', '    | |', '   _| |_']),
       ('FIS', ['', '      o', '  ><(((">', '   o', '', '  ~~~~~~~~'],
               ['     o', '', '   ><(((">', '', '  o', '  ~ ~~~~ ~~'])]
def artdc(both=True):
    L = []
    for nm, fa, fb in ART:
        for suf, fr in (('A', fa), ('B', fb)) if both else (('A', fa),):
            for x in fr: assert len(x) <= 12, x
            L += DC('A' + nm + suf, ''.join(x.ljust(12) for x in fr))
    return L + DC('MNAMEL', 'COFFEE CAT    DOG    ROBOT  FISH   NONE   ')
def artsel(arr, both=True):
    t = "EVAL ART = *BLANKS\nSELECT\n"
    for i, (nm, fa, fb) in enumerate(ART):
        if both: t += "WHEN MIDX = %d AND FRAME = 0\nEVAL ART = A%sA\nWHEN MIDX = %d\nEVAL ART = A%sB\n" % (i + 1, nm, i + 1, nm)
        else: t += "WHEN MIDX = %d\nEVAL ART = A%sA\n" % (i + 1, nm)
    return t + "ENDSL\n1 | DO | 6 | I\nEVAL %s(I) = %%SUBST(ART:I*12-11:12)\n | ENDDO\n" % arr
GETPREF = """
EVAL MIDX = 1
PGMUSR | CHAIN(N) | PREFREC
IF %FOUND(OVPREFP)
1 | DO | 6 | I
IF PRMASC = %SUBST(MNAMEL:I*7-6:7)
EVAL MIDX = I
ENDIF
 | ENDDO
ENDIF
"""
H('SAVR', 'Screen saver', 'The calendar shows this after it has been left alone for a while.',
  'Press Enter, or any function key, to go back.', '',
  'Settings, on the main menu, changes how long it waits, or turns it off.')
H('CHWHO', 'Live chat - who with', 'Type the user ID of the person to chat with and press Enter.', F4U, '',
  'Type EVERYONE to join the office chat room, which all users share.')
H('CHLST', 'Live chat rooms', 'Group rooms are open to everyone in the office.  The room whose topic',
  'changed most recently is at the top, so you can see where people are.', '',
  'Type 1 beside a room, or put the cursor on it, and press Enter to join it.',
  'Type 4 to delete a room you made.  Administrators can delete any room',
  'except EVERYONE.  F6 makes a new room and asks for its topic.', '',
  'For a private chat, type a user ID in Private chat with, or press F4 to',
  'pick someone.  They get a message saying you are waiting.', PG)
H('CHNEW', 'New room', 'Give the room a one-word name and a topic.  The room appears at the top',
  'of the room list for everyone.  You join it straight away.')
H('CHTOPS', 'Room topic', 'Type the new topic and press Enter.  Everyone in the room sees a line',
  'saying you changed it, and the room moves to the top of the room list.')
H('CHATSCR', 'Live chat', 'The screen shows the latest fourteen lines of the conversation.', '',
  'New lines appear by themselves when they arrive.  Whatever you have typed',
  'is kept, but the cursor goes back to the start of the line, so press',
  'End or Field Exit to carry on typing.  Settings can turn this off, so that',
  'new lines only appear when you press F5.', '',
  'Type what you want to say and press Enter to send it.',
  'F6 goes back to the room list.  F9 changes the topic of a group room.',
  'F3 leaves the chat.', '',
  'The first time you write to someone in a session they get a system',
  'message telling them you are waiting, in case they are not in the chat.')

pf('OVSHTP', 'SHTREC', [A('SHUSER', 10), A('SHNAME', 10), A('SHTITL', 40), Z('SHSTMP')], ['SHUSER', 'SHNAME'])
pf('OVSHCP', 'SHCREC', [A('SXUSER', 10), A('SXNAME', 10), N('SXROW', 3), N('SXCOL', 2), A('SXTEXT', 30)], ['SXUSER', 'SXNAME', 'SXROW', 'SXCOL'])
H('SLIST', 'Spreadsheets', 'Your spreadsheets.  Each has columns A to H and rows 1 to 99.', '',
  'Options: 2 opens a sheet, 6 prints it, 4 deletes it.', CUR, '', 'F6 creates a new sheet.', PG)
H('SNEW', 'New spreadsheet', 'Give the sheet a short name and a title, then press Enter.', 'The sheet opens straight away.')
H('SGRID', 'Spreadsheet', 'Type straight into the cells.  Each cell shows eight characters.', '',
  'Moving around:  Tab moves to the next cell to the right, and on to the',
  'next row.  Backtab (Shift+Tab) moves left.  The arrow keys also work.',
  'Field Exit clears the rest of a cell and moves on, which is the quick way',
  'to type over a number.', '',
  'Enter stores everything you typed and moves down one cell, or right one',
  'cell.  F10 switches between down and right.  Cursor on a cell + Enter',
  'makes it the current cell: its row number and column letter light up.', '',
  'Yes, it does math.  Start a cell with = for a formula: =B2*C2+10',
  'Use + - * / with numbers and cells.  * and / come before + and -.',
  '=SUM(B2:B9) =AVG(B2:B9) =MIN(B2:B9) =MAX(B2:B9) =COUNT(B2:B9)', '',
  'A cell shows the result; the line below the grid shows the formula.',
  'For text or a formula longer than eight characters, use Contents.',
  'F6 empties the current cell, F9 prints, F11 charts the current column.')

H('TETRIS', 'Tetris', 'Fit the falling pieces together.  A full row disappears and scores:',
  '100 points for one row, 300 for two, 500 for three and 800 for four.', '',
  'F4 moves left, F5 moves right.  Enter or F6 turns the piece.',
  'F7 moves it down one row, F8 drops it to the bottom.', '',
  'A piece falls one row each second.  The game ends when there is no room',
  'for the next piece.  F9 starts a new game and F3 leaves.', '',
  'Your best score is kept and shown on the games menu.', '',
  'If pieces do not fall by themselves on your display, press Enter to let',
  'time pass.')
H('SCHART', 'Column chart', 'Each bar is one number from the current column, top to bottom, up to 15.',
  'The label is the text in column A of that row, when there is some.', '',
  'Bars are drawn to scale against the largest number.  Negative numbers',
  'are drawn with - instead of #.', '', 'Press Enter to go back to the sheet.')
