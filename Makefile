CC=llvm-g++
SRC=main.cpp
HDR=$(SRC:.cpp=.h)
OBJ=$(SRC:.cpp=.o) 
BIN=window
ANUVAD_SRC=anuvad-0.11/src
ANUVAD_LIB=anuvad-0.11/lib
CPPFLAGS=
CFLAGS=-Wall -Wextra -pipe -O2 -msse4.2 -mssse3 -mfpmath=sse -march=core2
#LDFLAGS=-Wl,-O1,-hash-style=gnu
LDFLAGS=-L$(ANUVAD_LIB)
LDLIBS=-loasis -lmisc -lz
CSCOPEFILES=cscope.files cscope.out cscope.po.out
CSCOPE=/usr/local/bin/cscope

main: $(OBJ)
	@echo "Making project..."
	$(CC) $(LDFLAGS) -o $(BIN) $(OBJ) $(LDLIBS)
# test if cscope is installed
	@if test -f $(CSCOPE); then \
		make tags; \
	fi

all: main
	@echo "Making all..."

%.o: %.cpp  %.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -I$(ANUVAD_SRC) -c $<  -o $@

tags: $(SRC) $(HDR) main.cpp 
	@echo "Generating tags..."
	@find . -maxdepth 1 -name "*.h" -o -name "*.c" \
		-o -name "*.cpp" > cscope.files
	@cscope -bkq -i cscope.files
	@ctags -L cscope.files --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q


.PHONY : clean
clean:
	@echo "Cleaning all..."
	rm -rf *.o $(OBJ) $(DBG) $(BIN) tags $(CSCOPEFILES)
