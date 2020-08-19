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
endif

OUTPUT_DIR := $(OUTPUT_ROOT)/work/binaries
CC := $(GCC_HOME)/gcc

ifeq "$(MACHINE)" "hpux-hppa"
	# build-inコンパイルルールではこれを使う
	TARGET_ARCH := -mdisable-fpregs
endif

MV = mv $(MV_FLAGS)
ifeq "$(MACHINE)" "solaris-sparc"
	MV_FLAGS := -f
endif
$(warning $(MV))
