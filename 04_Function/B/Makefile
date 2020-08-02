START_TIME := $(shell date)
CURRENT_TIME = $(shell date)

.PHONY: has-duplicates mkdir

# word-listが重複を持てばnull以外を返す
# $(call has-duplicates, word-list)
has-duplicates = $(filter-out\
	$(words $1),\
	$(words $(sort $1)))
word_list ?= A A B C
has-duplicates:
	# $(word_list)
	# $(call has-duplicates,$(word_list))

# これらのディレクトリを生成する. 存在する場合は何もしない
REQUIRED_DIRS = A B C/D E
_MKDIRS = $(shell for d in $(REQUIRED_DIRS); \
	do	\
		test -d $$d || mkdir -p $$d;	\
	done;)
mkdir:
	$(_MKDIRS)

RELEASE_TAR := $(shell date +mpwm-%F.tar.gz)
$(warning 日付からファイル名を生成: $(RELEASE_TAR))

# A/B/C.java => A.B.C,
# $(call file-to-class-name,root-name,file-name)
# $1とかがあるため:=ではダメ. 評価時に存在しない
file-to-class-name = $(subst /,.,$(subst .java,,$(subst $1/,,$2)))
$(warning file-to-class-name: $(call file-to-class-name,com,com/wonka/CalibrateElevator.java))

# $(wildcard pattern...): パターンリストを展開する. ~,*,?,[...],[^...]のようなシェル展開文字が使える
# 条件にあったファイルがなければ空文字がかえる
sources := $(wildcard *.c *.h)
$(warning wildcard: $(sources))

# $(dir list...): listの各単語のディレクトリ部分を返す
source-dirs := \
	$(sort	\
		$(dir	\
			$(shell find . -name '*.c')))
$(warning dirs: $(source-dirs))

# $(notdir name...): ファイル名だけ取り出す
get-java-class-name = $(notdir $(subst .java,,$1))
$(warning notdir: $(call get-java-class-name,A/B/C/D.java))

# $(suffix name...): 各引数からサフィックスリストを作って返す
# 全てが同じサフィックスかチェック
same-suffix = $(filter 1,$(words $(sort $(suffix $1))))
file_list = A.C B.c C.h D.java E.java
$(warning suffix: $(suffix $(file_list)), $(call same-suffix,A.c B.c D.c))

# $(basename name...): ファイル名からサフィックスを取り除いた部分
file-to-class-name-basename = $(subst /,.,$(basename $(subst $1/,,$2)))
$(warning file-to-class-name-basename: $(call file-to-class-name-basename,com,com/wonka/CalibrateElevator.java))

# $(addsuffix suffix,name...): nameにsuffixをつける
# $(join prefix-list,suffix-lixt): prefix-list[i] + suffix-list[i]
$(warning addsuffix: $(addsuffix .java,sample))


clean:
	rm -rf A B C E
