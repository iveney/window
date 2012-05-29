# Choose the version of GCC that we want to use
GCC_VERSION = 4.6.2
PREFIX = /home/utils/gcc-${GCC_VERSION}
CC = ${PREFIX}/bin/gcc
CPP = ${PREFIX}/bin/g++

# Make window exe
SRC=main.cpp
HDR=$(SRC:.cpp=.h)
OBJ=$(SRC:.cpp=.o) 
BIN=window

# Make creator example
CREATOR_SRC=creator_example.cpp
CREATOR_HDR=$(CREATOR_SRC:.cpp=.h)
CREATOR_OBJ=$(CREATOR_SRC:.cpp=.o)
CREATOR=creator_example

# Boost path
BOOST=/home/utils/boost-1.49.0/gcc-4.6.2-64/include

ANUVAD_SRC=anuvad-0.11/src
ANUVAD_LIB=anuvad-0.11/lib
CPPFLAGS=
CFLAGS=-Wall -Wextra -pipe -O2 -msse4.2 -mssse3 -mfpmath=sse -march=core2
#LDFLAGS=-Wl,-O1,-hash-style=gnu

# Note: hard-wire the library to the exe
LDFLAGS=-L$(ANUVAD_LIB) -Wl,-rpath,${PREFIX}/lib64
LDLIBS=-loasis -lmisc -lz

# cscope related
CSCOPEFILES=cscope.files cscope.out cscope.po.out
CSCOPE=/usr/local/bin/cscope

window: $(OBJ)
	@echo "Making project..."
	$(CPP) $(LDFLAGS) -o $(BIN) $(OBJ) $(LDLIBS)
# test if cscope is installed
	@if test -f $(CSCOPE); then \
		make tags; \
	fi

creator_example: $(CREATOR_OBJ)
	$(CPP) $(LDFLAGS) -o $(CREATOR) $(CREATOR_OBJ) $(LDLIBS)

all: window
	@echo "Making all..."

%.o: %.cpp  %.h
	$(CPP) $(CPPFLAGS) $(CFLAGS) -I$(ANUVAD_SRC) -I$(BOOST) -c $<  -o $@

tags: $(SRC) $(HDR)
	@echo "Generating tags..."
	@find . -maxdepth 1 -name "*.h" -o -name "*.c" \
		-o -name "*.cpp" > cscope.files
	@cscope -bkq -i cscope.files
	@ctags -L cscope.files --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q


.PHONY : clean
clean:
	@echo "Cleaning all..."
	rm -rf *.o $(OBJ) $(DBG) $(BIN) $(CREATOR_OBJ) $(CREATOR) tags $(CSCOPEFILES)
