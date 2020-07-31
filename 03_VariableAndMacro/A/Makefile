ECHO := echo
ECHO_SIMPLE := $(ECHO) $(HELLO)
ECHO_RECURSIVE = $(ECHO) $(HELLO)
# ?=, += には遅延評価しかない
HELLO ?= hello
HELLO ?= this is not assigned.
# HELLO += $(HELLO) # HELLOは遅延評価のため無限ループとなりエラー
#		HELLO := $(HELLO) append
ECHO_SIMPLE += APPEND

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
