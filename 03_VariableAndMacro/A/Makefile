ECHO := echo
ECHO_SIMPLE := $(ECHO) $(HELLO)
ECHO_RECURSIVE = $(ECHO) $(HELLO)
# ?=, += には遅延評価しかない
HELLO ?= hello
HELLO ?= this is not assigned.
# HELLO += $(HELLO) # HELLOは遅延評価のため無限ループとなりエラー
#		HELLO := $(HELLO) append
ECHO_SIMPLE += APPEND

# define : 慣用コマンド列 (canned sequence). マクロ.
#   改行を含むことのできる変数定義方法
#		変数と同様に展開されるが, コマンド行で使われると, 各行頭にtabがあるように扱われる
#		マクロ自体は遅延評価される

define hello-from-macro
  @echo hello-from-macro
	@echo 2nd line
endef

.PHONY : all
all : simple_var recursive_var_update_var recursive_var macro

.PHONY : simple_var recursive_var macro
simple_var :
	@$(ECHO_SIMPLE) : "expect(APPEND)"

recursive_var :
	@$(ECHO_RECURSIVE) : "expect(hello)"

# 特定のターゲット内でのみ有効な変数の定義
recursive_var_update_var : HELLO += update
recursive_var_update_var :
	@$(ECHO_RECURSIVE) : "expect(hello update)"

macro :
	$(hello-from-macro)

# ワイルドカード : ~ * ? […] [^…]
# 変数 : 一文字の場合は (), {} は不要. 変数名は:#=が使えない
# 自動変数
# 	$@	target
# 	$%	ライブラリの構成指定中の要素. ターゲットが `foo.a(foo.o)` の時, foo.o.
# 	$<	prerequisite の最初要素.
# 	$?	ターゲットより後で更新された必須項目全てのスペース区切りリスト
# 	$^	必須項目全てのスペース区切りリスト
# 	$+	必須項目全てのスペース区切りリスト(重複許可)
# 	$* 	ターゲットファイル名の一部(後述)
# 	D, F	ディレクトリ部分, ファイル名部分を表示. `$(@D), $(<F)`
