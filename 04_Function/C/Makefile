# $(if condition,then-part,else-part): condが何か含んでいればthen-partマクロ. 何もなければelse-partマクロが実行
PATH_SEP := $(if $(COMSPEC),;,:)

# $(error ...): メッセージを表示して終了
version_check = $(if $(filter $(MAKE_VERSION),3.80),,\
	$(error This makefile requires GNU make version 3.80.))

all: find-words

# $(call assert,condition,message)
define assert
	$(if $1,,$(error Assertion failed: $2))
endef
# $(call assert-file-exists,wildcard-patter)
define assert-file-exists
	$(call assert,$(wildcard $1),$1 does not exist)
endef
# $(call assert-not-null,make-variable)
define assert-not-null
	$(call assert,$($1),The variable "$1" is null)
endef
error-exit:
	$(call assert-not-null,NON_EXISTENT)

# $(foreach variable,list,body): listの要素を使いながらbodyを実行
VARIABLE_LIST := SOURCES OBJECTS HOME
$(foreach i,$(VARIABLE_LIST),\
	$(if $($i),,\
		$(shell echo $i has no value > /dev/stderr)))

# $(call grep-string,search-string,word-list)
define grep-string
	$(strip\
		$(foreach w,$2,\
			$(if $(findstring $1,$w),\
				$w)))
endef
words := count_words.c counter.c lexer.l lexer.h counter.h
find-words:
	@echo $(call grep-string,un,$(words))

# $(strip text): text前後の空白を取り除き, 間のスペースを1つにする
# $(origin variable): 変数の出自を返す. (undefined, default(組込のもの), environment,
# 	environment override, file(makefileで定義), command line, override, automatic(makeの自動変数))
