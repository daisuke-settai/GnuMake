# SHELL変数: 環境変数から受け継がず, 独自の変数として保持
# 	ユーザの環境によらずmakefileを動かすため
$(warning $(origin SHELL)) # file

# 先頭にtabがなければコマンド解析モードを終了
all: long-command file_list cd


# built-in関数はコマンド解析モードを終了させる
long-command:
	@echo Line 2: 空行が続く

	@echo Line 4: シェルのコメントが続く
	# シェルコメント
	@echo Line 6: makeコメントが続く
# make コメント
	@echo Line 8: 字下げしたmakeコメントが続く
 # makeコメント
  # makeコメント(space)
	@echo Line 11: 条件判断が続く
ifdef COMSPEC
	@echo Windowsで実行中
endif
	@echo Line 15: コマンドとしてのwarningが続く
	$(warning 警告)
	@echo Line 17: コマンドとしてのevalが続く
# shellはstdoutを返すため, 全てstderrに流さないと, evalによって文字列が発生する.
# 	ここで, $(eval)の前のtabは, built-inコマンド実行時に無視されているためtabは消えている
# 	有効なコマンドにするためshell returnの先頭に\tをつけるか, stdoutをなくすかしないといけない
	$(eval $(shell echo シェルのecho-stderr 1>&2))
	$(eval $(shell "echo シェルのecho")) #なぜecho シェルのechoが一つのcmdとして認識されるのか...
	$(eval $(shell 'echo シェルのecho')) # ', "で意味が違う？': make error, ": sh error


# cmdは別のサブシェルで実行されるため, 一連の流れが大切な場合は1行で書く
# マクロの各行はそれぞれtabが挿入され展開されるため, 同一のサブシェルで実行されることはない
.INTERMEDIATE: file_list
file_list:
	for d in login ui; \
		do \
			echo $$d/*.java; \
		done > $@

cd:
	cd ui && \
	pwd

# コマンド修飾子
#		@: 実行コマンドを非表示
#		-: エラーを無視. 通常終了ステータスが意外ならmakeは終了
#		+: --just-print時でも実行: 再起的なmakeを作る時に使う

# コマンド環境
# 	make自身の実行環境を引き継ぐ. cwd, fd, environments
# 	加えていくつのかの追加の環境変数
# 		- MAKEFLAGS: コマンドラインオプション
# 		- MFLAGS: MAKEFLAGSのコピー．歴史的な経緯
# 		- MAKELEVEL: 入れ子になったmakeの今の呼び出し回数
$(warning MAKEFLAGS: $(MAKEFLAGS))
$(warning MFLAGS: $(MFLAGS))
$(warning MAKELEVEL: $(MAKELEVEL))
DATA_FILE := stdin-test.data
RAW_DATA := stdin-test.raw
RAW_DATA_FILES ?= /dev/null # これがないとgrepはstdin空の入力を期待して止まってしまう
# もしくはgrep pattern $(RAW_DATA_FILES) /dev/null >@
$(DATA_FILE): $(RAW_DATA)
	grep pattern $(RAW_DATA_FILES) >@

clean:
	rm -f file_list
