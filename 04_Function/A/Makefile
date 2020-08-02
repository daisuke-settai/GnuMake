# 関数はマクロのように見えるが, 引数を持つことができ, 変数かマクロに格納される
# arg間のスペースには注意すること
# $(func-name arg1[,argn]) 参照は $1, ..., $n. 組み込み関数実行
# $(call func-name,arg1,...,argn) 関数実行. 引数なしなら$(func-name)でいい.
# filter, filter-out, findstring: リストから条件にあったファイルを選択する関数
# 	$(filter pattern...,text) : textを空白で区切られた単語の列とし, patternと一致したものを返す

all: filter filter-out findstring subst patsubst words word firstword wordlist sort shell

# filter: 完全一致
words := he the hen other the%
filter:
	@echo he matches: $(filter he,$(words))
	@echo %he matches: $(filter %he,$(words))
	@echo he% matches: $(filter he%,$(words))
	@echo %は1つのみしか使えない. 最初の%以外はただの文字として扱われる
	@echo %he% matches: $(filter %he%,$(words))

# filter-out: 一致しなかった単語
all_source := count_words.c counter.c lexer.l counter.h lexer.h
to_compile := $(filter-out %.h,$(all_source))
filter-out:
	@echo $(to_compile)

# $(findstring string,text): text中にstringがあればstringを返す. %不可. ifと併用するのが便利
# 現在のディレクトリがどのツリーにいるか調べられる
PWD := /test/book/out/ch03-findstring-1
findstring:
	# $(findstring /test/book/admin,$(PWD))
	# $(findstring /test/book/bin,$(PWD))
	# $(findstring /test/book/dblite_0.5,$(PWD))
	# $(findstring /test/book/examples,$(PWD))
	# $(findstring /test/book/out,$(PWD))
	# $(findstring /test/book/text,$(PWD))

# 検索, 置換
# $(subst search-string,replace-string,text) ワイルドカード使用不可
sources := count_words.c counter.c lexer.c
objects := $(subst .c,.o,$(sources))
subst:
	@echo $(objects)

# $(patsubst search-pattern,replace). ワイルドカード使用可能
# 最後の/のみを取り除く
# $(variable:search=replace)でも同様
directry-path := /A/B/C/
patsubst:
	@echo patsubst: $(patsubst %/,%,$(directry-path))
	@echo var-replace: $(directry-path:/=)

# $(words text) text中の単語数
CURRENT_PATH := $(subst /, ,$(HOME))
words:
	@echo HOME: $(CURRENT_PATH)
	@echo My HOME path has $(words $(CURRENT_PATH)) directories.

# $(wrod n,text): textからn番目の単語を返す.
version_list := $(subst ., ,$(MAKE_VERSION))
minor_version := $(word 2,$(version_list))
# 現在処理中のmakefile取得
current := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
word:
	@echo version_list: $(version_list)
	@echo minor_version: $(minor_version)

# $(firstword text): $(word 1,text)
firstword:
	@echo major_version: $(firstword $(version_list))

# $(wordlist start,end,text)
# $(call uid_gid,user-name)
uid_gid = $(wordlist 3,4,$(subst :, ,$(shell grep "^$1:" /etc/passwd)))
wordlist:
	@echo uid_gid: $(call uid_gid,root)

# $(sort list) 重複を取り除きソート. listの前後の空白を取り除く
sort:
	@echo sort: =$(sort   de da b s d t   )=
	@echo sort: =$(sort あ い a b ア イ 1 2)=

# $(shell command) サブシェルでcommandを実行. 標準出力は戻り値として返される. 改行はスペースとなる
#		エラー出力とexitステータスは返されない
stdout := $(shell echo normal message)
stderr := $(shell echo error message 1>$2)
shell:
	# $(stdout): expect(normal message)
	# $(stderr): expect()
