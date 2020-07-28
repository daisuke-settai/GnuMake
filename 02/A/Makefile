# install libfl, flex
# -lfl: libfl.so, libfl.aを探す

.PHONY : all
all : count_words

# count_words : count_words.o lexer.o -lfl
# makefile パース時に lexer.c は存在しないため lexer.c が必要
count_words : *.c lexer.c -lfl
	$(CC) $^ -o $@

# count_words.o : count_words.c
#	gcc -c count_words.c

#lexer.o : lexer.c
#	gcc -c lexer.c

lexer.c : lexer.l
	flex -t lexer.l > lexer.c

# clean fileがあっても常に更新があったと判定させる
.PHONY : clean
clean :
	rm -f *.o lexer.c count_words
