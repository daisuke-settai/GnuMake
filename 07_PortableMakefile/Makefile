# ポータブルmakefile
# 	GNU makeが使えるシステム上で簡単な修正のみで実行できるmakefile
# 	新規システム向けに修正しても以前のプラットフォームに対して影響がない
# 		- カプセル化, 抽象化によって達成
# 		- 変数, ユーザ定義関数, 標準的なツールを使い, 特殊な機能を極力使わない
#		windows環境でlinux互換の環境がCygwinが最上. コンパイラなども包含
#			- ただ, windows用システムをCygwin上で開発する場合, 行末文字やpath名などの問題に注意
#				- Windows FS: CRLF(復帰, 改行) 2文字
#				- POSIX System: LF or newline 1文字
#				- CygwinはDOS形式ファイルを読み込む際にCRLF->LF, write時にLF->CRLF. (install or mount時に選択)
#				- /cygdrive/c/usr/cygwin or / <=> C:\user\cygwin
#				- /cygdrive/

ifdef COMSPEC
	OUTPUT_ROOT := d:
	GCC_HOME := c:/gnu/usr/bin
else
	OUTPUT_ROOT := $(HOME)
	GCC_HOME := /usr/bin
	PATH_SEPCHAR := /
endif

OUTPUT_DIR := $(OUTPUT_ROOT)/work/binaries
CC := $(GCC_HOME)/gcc

MACHINE := $(subst $(PATH_SEPCHAR),-,$(shell uname -smo | sed 's/ /-/g'))
include $(MACHINE)-defineds.mk

ifeq "$(MACHINE)" "hpux-hppa"
	# build-inコンパイルルールではこれを使う
	TARGET_ARCH := -mdisable-fpregs
endif

MV = mv $(MV_FLAGS)
ifeq "$(MACHINE)" "solaris-sparc"
	MV_FLAGS := -f
endif
$(warning $(MV))

# 空白を含むファイル名の扱い
space = $(empty) $(empty) # empty は未定義変数
# $(call space-to-question,filename)
space-to-question = $(subst $(space),?,$1) # ?は展開ワイルドカード文字

# $(call wildcard-spaces,file-name)
wildcard-spaces = $(wildcard $(call space-to-question,$1))

# $(call file-exists,file-name)
file-exists = $(strip \
								$(if $1,,$(warning $1 has no value)) \
									$(call wildcard-spaces,$1))

$(warning $(call file-exists,space$(space)end.txt))

# ポータビリティのため環境に応じたツールを使う場合は関数にまとめるのが良い. また内部にフックポイントをおくとなお良し
