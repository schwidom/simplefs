
# CFLAGS = --std=c++11
# CXXFLAGS = --std=c++11

all:
	tar cvzf simplefs.tgz simplefs/
	R --verbose CMD INSTALL simplefs.tgz

check:
	tar cvzf simplefs.tgz simplefs/
	R --verbose CMD check simplefs.tgz


