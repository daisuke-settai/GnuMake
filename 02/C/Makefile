VPATH = src # search pathにsrcを追加
CPPFLAGS = -I include # 既存の設定を上書きしてる？

.PHONY : all
all : count_words

count_words : count_words.o counter.o lexer.o -lfl
	$(CC) $(CPPFLAGS) $^ -o $@

count_words.o : count_words.c include/counter.h
	$(CC) $(CPPFLAGS) -c $<

counter.o : counter.c include/counter.h include/lexer.h
	$(CC) $(CPPFLAGS) -c $<

lexer.o : lexer.c include/lexer.h
	$(CC) $(CPPFLAGS) -c $<

lexer.c : lexer.l
	flex -t $< > $@

.PHONY : clean
clean :
	rm -f *.o lexer.c count_words
