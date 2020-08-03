SHELL := bash
all: compile_all

# コマンドの評価:
# 	- コードの読み込み: (Makefile読み込み時) ifdefとかはここ
# 	- 変数展開
# 	- make式の評価:
# 	- コマンドの実行

# $(call strip-program,file)
define strip-program
	strip $1
endef

complex_script:
	-$(CC) $^ -o $@
ifdef STRIP # Makefileが読み込まれた時評価
	$(call strip-program,$@)
else
	$(warning else)
endif
	$(if $(PACK), upx --best $@)
	$(warning Final size: $(shell ls -s $@))

# コマンドラインの制限
#		shopt -s nullglob: 空パターン展開をしない
#	大きなプロジェクトではファイル数が多くなり, コマンドラインの制限を超えうるため, 一度ファイルに落とすなどする
JAVA := java
FILE_LIST = java_srcs
source_dirs ?= src dummy
compile_all: $(FILE_LIST)
	$(JAVA) @$<

.INTERMEDIATE: $(FILE_LIST)
$(FILE_LIST):
	shopt -s nullglob; \
	for d in $(source_dirs); \
	do \
		echo $$d/*.java; \
	done > $@

# ファイルリスト作成
# $(call collect-names, root-dir, dir-list, suffix1-opt, suffix2-opt)
# 	foreach で dir-list のdir1 dir2 ... を 'dir1' 'dir2'... のように変換
comma := , # make構文解析をパスするため変数にして使う
define collect-names
	echo Making $@ from directory lst...
	cd $1; \
	shopt -s nullglob; \
	for f in $(foreach file,$2,'$(file)'); do \
		files=( $$f$(if $3,/*.{$3$(if $4,$(comma)$4)}) ); \
		if (( $${#files[@]} > 0 )); then \
			printf '"%s"\n' $${files[@]}; \
		else :; fi
	done
endef
