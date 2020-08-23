VPATH = src include
CPPFLAGS = -I include
# .LIBPATTERNSにライブラリとして扱う拡張子が入っている(-lで探す対象)

SOURCES = count_words.c	\
					lexer.c				\
					counter.c

.PHONY : all
all : count_words

# -lcounterと記述すると, make treeではなくシステムからlibcounterを探そうとするためエラーとなる
count_words : libcounter.a -lfl
count_words.o : counter.h
counter.o : counter.h lexer.h
lexer.o : lexer.h
libcounter.a : libcounter.a(lexer.o) libcounter.a(counter.o)
#	$(AR) $(ARFLAGS) $@ $?

.PHONY : clean
clean :
	rm -f *.o lexer.c count_words *.a

# 二重コロン
#   ある target のルールを複数記述すると必須項目が結合されれ 1 つのルールとして扱われるが ‘::’ を使うと別個のものとして扱われる (‘:’ or ‘::’ かで統一する必要がある)
# prereq1が変更されていればcommand1が実行.
# prereq2が変更されていればcommand2が実行.
# target :: prereq1
# 	command1
# target :: prereq2
#		command2
