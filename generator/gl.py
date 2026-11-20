# ---------------- one layout per application ----------------
HI = lambda b: (lambda i: [(' %02d' % (b + i + 1), 'DSPATR(HI)')])
def lay_msgs(s):
    s.lst2('MLIST', 'M', list(range(5, 15)), 7, 72, ttl=(3, 36, 42), col=(4, 3, 74), rowkw=HI(60))
    s.ctr(2, 'M E S S A G E   C E N T E R', 'DSPATR(HI)')
    s.f('MTB1', 18, 'O', 3, 3, 'COLOR(WHT)', ('N41', 'DSPATR(RI)')); s.f('MTB2', 10, 'O', 3, 23, 'COLOR(WHT)', (' 41', 'DSPATR(RI)'))
    s.frame(15, 3, 18, 78, 'COLOR(BLU)'); s.t(19, 7, '\\|', 'COLOR(BLU)')
    s.f('MINF', 72, 'O', 16, 5, 'DSPATR(HI)'); s.f('MIN2', 72, 'O', 17, 5)
def lay_mail(s):
    s.lst2('LLIST', 'L', list(range(9, 19)), 7, 72, ttl=(3, 24, 50), col=(8, 3, 74), rowkw=HI(60))
    for i, tx in enumerate(['+------------+', '|\\          /|', '|  \\      /  |', '|    \\__/    |', '+------------+']): s.t(2 + i, 4, tx, 'COLOR(YLW)')
    s.t(2, 24, 'M A I L B O X', 'DSPATR(HI)')
    s.f('LTB1', 10, 'O', 4, 24, 'COLOR(WHT)', ('N41', 'DSPATR(RI)')); s.f('LTB2', 8, 'O', 4, 36, 'COLOR(WHT)', (' 41', 'DSPATR(RI)'))
    s.t(4, 46, 'F10 switches folders', 'COLOR(BLU)'); s.t(5, 24, 'F6 writes a new memo.  Unread mail is bright.', 'COLOR(BLU)')
def lay_notes(s):
    s.lst2('NLIST', 'N', list(range(7, 17)), 9, 66, ocol=4, find=(3, 3, 30), ttl=(3, 50, 28), col=(4, 4, 74), lnkw=('COLOR(YLW)',))
    s.ctr(2, 'N O T E P A D', 'DSPATR(HI)')
    s.t(5, 5, ' o  ' * 18, 'COLOR(WHT)')
    s.frame(6, 2, 17, 77, 'COLOR(YLW)')
    for r in range(7, 17): s.t(r, 7, ':', 'COLOR(RED)')
    s.t(18, 3, '2=Change  4=Delete   Notes are private to you.', 'COLOR(BLU)')
def lay_tasks(s):
    rk = lambda i: [(' %02d' % (61 + i), 'COLOR(RED)'), (' %02d' % (71 + i), 'COLOR(BLU)')]
    s.lst2('TLIST', 'T', list(range(7, 17)), 7, 72, ttl=(3, 3, 50), col=(6, 3, 74), rowkw=rk)
    s.ctr(2, 'T O - D O   L I S T', 'DSPATR(HI)')
    s.t(4, 3, 'Progress'); s.f('TBAR', 32, 'O', 4, 13, 'COLOR(GRN)'); s.f('TPCT', 12, 'O', 4, 47, 'DSPATR(HI)')
    s.t(18, 3, '[ ] open', 'COLOR(GRN)'); s.t(18, 14, '[X] done', 'COLOR(BLU)'); s.t(18, 25, 'OVERDUE', 'COLOR(RED)')
    s.t(18, 35, 'H M L = priority', 'COLOR(WHT)')
def lay_phone(s):
    s.lst2('PLIST', 'P', list(range(6, 16)), 7, 32, find=(3, 3, 24), ttl=(3, 42, 36), col=(5, 3, 36))
    s.ctr(2, 'P H O N E   B O O K', 'DSPATR(HI)')
    s.t(4, 3, ' '.join('ABCDEFGHIJKLMNOPQRSTUVWXYZ') + ' *', 'COLOR(TRQ)'); s.t(4, 58, 'cursor + Enter jumps', 'COLOR(BLU)')
    s.frame(6, 41, 13, 78, 'COLOR(YLW)')
    s.f('PCNM', 34, 'O', 7, 43, 'DSPATR(HI)')
    s.t(9, 43, 'Phone', 'COLOR(BLU)'); s.f('PCPH', 20, 'O', 9, 50)
    s.t(10, 43, 'Mail', 'COLOR(BLU)'); s.f('PCML', 26, 'O', 10, 50)
    s.t(11, 43, 'Note', 'COLOR(BLU)'); s.f('PCNT', 26, 'O', 11, 50)
    s.t(14, 46, 'O', 'COLOR(YLW)'); s.t(14, 72, 'O', 'COLOR(YLW)')
    s.t(16, 41, '5 or the cursor shows a card', 'COLOR(BLU)')
def lay_docs(s):
    rk = lambda i: ['COLOR(TRQ)' if i % 2 else 'COLOR(GRN)']
    s.lst2('DLIST', 'D', list(range(6, 20)), 7, 72, ttl=(3, 3, 50), col=(5, 2, 77), rowkw=rk)
    s.ctr(2, 'D O C U M E N T S', 'DSPATR(HI)')
    s.t(3, 55, '[=] = one document', 'COLOR(YLW)')
def lay_sheets(s):
    rk = lambda i: ['COLOR(TRQ)' if i % 2 else 'COLOR(GRN)']
    s.lst2('SLIST', 'S', list(range(9, 19)), 7, 72, ttl=(3, 20, 50), col=(8, 3, 74), rowkw=rk)
    for i, tx in enumerate(['+---+---+---+', '|   | A | B |', '+---+---+---+', '| 1 | 4 |=A1|', '+---+---+---+']): s.t(2 + i, 3, tx, 'COLOR(GRN)')
    s.t(2, 20, 'S P R E A D S H E E T S', 'DSPATR(HI)')
    s.t(4, 20, 'Columns A to H, rows 1 to 99.  Formulas start with =', 'COLOR(BLU)')
    s.t(5, 20, 'F6 starts a new sheet.', 'COLOR(BLU)')
def lay_find(s):
    s.rec('FLIST'); s.f('FHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.ctr(2, 'S E A R C H', 'DSPATR(HI)')
    s.frame(3, 14, 5, 65, 'COLOR(BLU)'); s.t(4, 16, 'Look for'); s.f('FFND', 30, 'B', 4, 26, 'CHECK(LC)', 'DSPATR(UL)', 'DSPATR(PC)')
    s.f('FTTL', 50, 'O', 6, 3, 'DSPATR(HI)'); s.f('FCOL', 74, 'O', 7, 3, 'COLOR(BLU)')
    for i in range(1, 11): s.f('FOP%02d' % i, 2, 'I', 7 + i, 3, 'CHECK(LC)', 'DSPATR(UL)'); s.f('FLN%02d' % i, 72, 'O', 7 + i, 7)
    for i, n in enumerate(['FINF', 'FIN2', 'FIN3']): s.f(n, 74, 'O', 18 + i, 3, 'COLOR(TRQ)')
    s.f('FMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('FFK1', 78, 'O', 22, 2, 'COLOR(BLU)'); s.f('FFK2', 78, 'O', 23, 2, 'COLOR(BLU)')
def lay_users(s):
    rk = lambda i: [(' %02d' % (61 + i), 'COLOR(RED)'), (' %02d' % (71 + i), 'DSPATR(HI)')]
    s.lst2('ULIST', 'U', list(range(6, 16)), 8, 70, find=(3, 3, 30), ttl=(3, 47, 32), col=(5, 3, 74), rowkw=rk)
    s.ctr(2, 'O F F I C E   U S E R S', 'DSPATR(HI)')
    s.t(17, 3, 'Administrators are bright.', 'DSPATR(HI)'); s.t(17, 31, 'Disabled users are red.', 'COLOR(RED)')
def lay_groups(s):
    s.lst2('GLIST', 'G', list(range(6, 16)), 8, 70, ttl=(3, 3, 50), col=(5, 3, 74), lnkw=('COLOR(TRQ)',))
    s.ctr(2, 'D I S T R I B U T I O N   G R O U P S', 'DSPATR(HI)')
    s.t(17, 3, 'Address mail or a message to a group name to reach every member.', 'COLOR(BLU)')
def lay_log(s):
    s.lst2('VLIST', 'V', list(range(6, 16)), 3, 76, find=(3, 3, 30), ttl=(3, 47, 32), col=(5, 3, 76), colkw=('DSPATR(RI)',),
           noopt=True, lnkw=('COLOR(GRN)',))
    s.ctr(2, 'A C T I V I T Y   L O G', 'DSPATR(HI)')
