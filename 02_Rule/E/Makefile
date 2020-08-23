# :=　単純転換変数. 読み込まれた際に全て展開される
#  =  再起展開変数. 参照ごとに評価される
# ?=  条件付き代入. 変数が未定義の場合のみ代入
# +=  アペンド. 変数にテキストを追加

VPATH = src include
CPPFLAGS = -I include

SOURCES = count_words.c	\
					lexer.c				\
					counter.c

.PHONY : all
all : count_words

# 依存関係の出力: 依存関係を変更した際にここの更新を忘れがち
# depend : count_words.c lexer.c counter.c
#		$(CC) -M $(CPPFLAGS) $^ > $@
# include depend

count_words : counter.o lexer.o -lfl
count_words.o : counter.h
counter.o : counter.h lexer.h
lexer.o : lexer.h

# $SOURCES に対して.cを.dに置換しinclude
include $(subst .c,.d,$(SOURCES))

# %.dファイルをincludeしようと記述すると個々の処理が効いてくる
# target.d.{pid} に依存関係を出力
# $*: ターゲットの%部分.o
# sed: 'target.o : ' => 'target.o target.d : 'に変更し%.dに出力
%.d:%.c
	$(CC) -M $(CPPFLAGS) $< > $@.$$$$;	\
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@;	\
	rm -f $@.$$$$

.PHONY : clean
clean :
	rm -f *.o lexer.c count_words *.d


