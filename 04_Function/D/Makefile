# ユーザ定義関数とはただの文字列を格納している変数に過ぎない
# 	変数展開やcall関数によって意味を持つ
.PHONY: all trace-macro show-variables clean
all: trace-macro show-variables

# デバッグ用トレースマクロ
# $(debug-enter)
debug-enter = $(if $(debug_trace),\
								$(warning Entering $0($(echo-args))))

# $(debug-leave)
debug-leave = $(if $(debug_trace),\
								$(warning Leaving $0))

comma := ,
echo-args = $(subst ' ','$(comma) ',\
							$(foreach a,1 2 3 4 5 6 7 8 9,'$($a)'))

debug_trace = 1

define a
	$(debug-enter)
	@echo $1 $2 $3
	$(debug-leave)
endef

define b
	$(debug-enter)
	$(call a,$1,$2,hi)
	$(debug-leave)
endef

trace-macro:
	$(call b,5,$(MAKE))

# eval関数と値
# eval: 引数をまず変数が展開され, その文字列がmakefileに書かれていたかのように構文解析と評価が行われる
# 	最初のmakefile解析時に実行されるため, evalで使うマクロなどはevalより前に定義する
define program-variables
	# $$()とするもしくは, この変数定義もeval化して先に評価を行う
  $1_sources = $(filter %.c,$2) # $(eval $1_sources = $(filter %.c,$2))
	$1_headers = $(filter %.h,$2)
	$1_objects = $(subst .c,.o,$(filter %.c,$2))

	programs += $1
	objects += $$($1_objects)
  $1: $$($1_objects)

	# 変数展開のタイミングで $1_objectsはまだ未評価=>$$()とすることで, makeによるeval引数変数展開時に $$を$に変換
	# 	evalによる解決時に$()となり正しく展開可能
  $$($1_objects): $$($1_headers)
endef

# $(call program-variables, variable-prefix, file-list)
# 複数行に展開されるマクロはエラーとなる
# $(call program-variables,ls,ls.c ls.h glob.c glob.h)
$(eval $(call program-variables,ls,ls.c ls.h glob.c glob.h))

all: $(programs)

# $(ls_objects)の展開はeval評価後でないとダメ
# ls: $(ls_objects) => program-variables中へ

show-variables:
	# $(ls_sources)
	# $(ls_headers)
	# $(ls_objects)

# 関数のフック
# $(call build-library-hook,object-files)
define build-library
	$(AR) $(ARFLAGS) $@ $1
	$(call build-library-hook,$@)
endef
# $(bar_lib): build-library-hook = $(CHMOD) 444 $1
# $(bar_lib): $(bar_objects)
# 	$(call build-library,$^)

# 関数への値渡し
# 	4つ方法がある.
# 	- callによる引数 $1, $2
# 	- 関数外定義変数
# 	- 自動変数
# 	- ターゲット固有変数

# cmdは実行時解釈のためどこに記述しても良い
clean:
	rm -f $(programs) $(objects)
