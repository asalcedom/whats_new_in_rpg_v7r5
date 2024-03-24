
BIN_LIB=ASALCEDO1
LIBLIST=$(BIN_LIB)
SHELL=/QOpenSys/usr/bin/qsh

all: v7r5tr3r.rpgle charcount.rpgle foreach.rpgle left.rpgle right.rpgle sndmsg.rpgle split.rpgle upperlower.rpgle

v7r5tr3r.rpgle: v7r5tr3d.dspf

%.rpgle:
	system -s "CHGATR OBJ('./qrpglesrc/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTBNDRPG OBJ($(BIN_LIB)/$*) SRCSTMF('./qrpglesrc/$*.rpgle') DBGVIEW(*SOURCE) OPTION(*EVENTF)"

%.dspf:
	-system -qi "CRTSRCPF FILE($(BIN_LIB)/QDDSSRC) RCDLEN(112)"
	system "CPYFRMSTMF FROMSTMF('./qddssrc/$*.dspf') TOMBR('/QSYS.lib/$(BIN_LIB).lib/QDDSSRC.file/$*.mbr') MBROPT(*REPLACE)"
	system -s "CRTDSPF FILE($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/QDDSSRC) SRCMBR($*)"