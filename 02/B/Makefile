# install libfl, flex
# -lfl: libfl.so, libfl.aを探す

.PHONY : all
all : print count_words

# count_words : count_words.o lexer.o -lfl
# makefile パース時に lexer.c は存在しないため lexer.c が必要
count_words : *.c lexer.c -lfl
	$(CC) $^ -o $@

# count_words.o : count_words.c
#	gcc -c count_words.c

#lexer.o : lexer.c
#	gcc -c lexer.c

lexer.c : lexer.l
	flex -t $< > $@

.PHONY : make-documentation
make-documentation : df # 重い処理の前にディスク容量を表示する
	# javadoc ...

.PHONY : df
df : # $$はmakefileエスケープシーケンス
	df -k . | awk 'NR == 2 {printf("%d available\n", $$4) }'

# *.[hc]が更新された時のみ実行
# 空ファイルがないと擬似ターゲット化してしまい, 常に実行される
# 	空ファイルの作成時(前回実行時)より新しいもののみ表示
print : *.[hc]
	echo $?
	# lpr $?
	touch $@

# clean fileがあっても常に更新があったと判定させる
.PHONY : clean
clean :
	rm -f *.o lexer.c count_words print

.PHONY : install
install :

.PHONY : distclean
distclean :

.PHONY : TAGS
TAGS :

.PHONY : info
info :

.PHONY : check
check :
