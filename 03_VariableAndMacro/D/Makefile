vpath %.mk mk

# foo.mk がターゲットを含む場合デフォルトターゲットが変わってしまうため
all:

# includeターゲットが更新される場合, makeを初めからやり直す
# 	共通定義をmakeヘッダに定義し読み込むような使い方もできる
#		cwdになければ, --include-dir (-I) 指定の場所を探す. その後 make ビルド時に組み込まれたパスを見る
#
include foo.mk
$(warning Finished include)

all:
	$(warning default target)

foo.mk: bar.mk
	m4 --define=FILENAME=$@ $< > $@

.PHONY: clean
clean:
	rm -f foo.mk
