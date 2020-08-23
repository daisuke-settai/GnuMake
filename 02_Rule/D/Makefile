VPATH = src include
# built-inルールは変数を変更することでカスタマイズ可能.
CPPFLAGS = -I include # 既存の設定を上書きしてる？ -> A.未定義で参照のみ.

.PHONY : all
all : count_words
# .INTERMEDIATE : counter.o lexer.o count_words.o # OK! delete *.o
# .INTERMEDIATE : *.o # BAD! makefile解釈時これらのファイルは存在しない

# .o は .c から, 実行ファイルは.oから作られることは暗黙のルールである(サフィックス)
# 下記のようなbuilt-inルールが存在
# %.o : %.c
# 	$(COMPILE.c) $(OUTPUT_OPTION) $<
# lexer.oはlexer.cを必要とするが, .cがない. lexer.lの存在からlexer.cを生成.
count_words : counter.o lexer.o -lfl
count_words.o : counter.h
counter.o : counter.h lexer.h
lexer.o : lexer.h

# 時には下記のように直接ファイルリストを指定したほうが楽な場合もある
# $(OBJECTS) : %.o : %.c
# 	$(CC) -c $(CFLAGS) $< -o $@

.PHONY : clean
clean :
	rm -f *.o lexer.c count_words

$(OBJECTS) : %.o : %.c # OBJECTS にリストされている要素に対してのみルールを適用
		$(CC) -c $(CFLAGS) $< -o $@ 

.SUFFIXES: .out .a .ln .o .c .cc .C .cpp .p .f .F .r .y .l  # default
.SUFFIXES: .pdf .fo .html .xml # 独自の追加サフィックス
.SUFFIXES: #デフォルトサフィックスの無効化
.c(.o) :  # %(.o) : %.c と同義
	$(COMPILE.c) $(OUTPUT_OPTION) $<

# 特殊ターゲット
# 	.INTERMEDIATE prerequisite を中間ファイルとして扱う. (make 終了時削除される)
#		.SECONDARY 中間ファイルとして扱うが, 削除はしない. (アーカイブに追加したオブジェクトファイルなどに使う)
#		.PRECIOUS make が途中終了 (シグナルのみ) した場合でも作業途中のファイルを削除しない
#		.DELETE_ON_ERROR コマンドエラーによって中断してもファイルを削除する. 通常 make はシグナルで中断された場合のみターゲットを削除する.
