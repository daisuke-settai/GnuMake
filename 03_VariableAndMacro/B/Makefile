OUTPUT_DIR := /tmp

# 1st step でfree-space変数はデータベースに登録. ルールも登録. コマンドは処理せずそのまま保存.
# 2nd stepでルールに基づきコマンドを実行. 実行時に$(free-space)が評価されるためOK.
$(OUTPUT_DIR)/very_big_file :
	$(free-space)

# マクロの中身は遅延評価
define free-space
  $(PRINTF) "Free disk space\n"
	$(DF) . | $(AWK) 'NR == 2 { print $$4 }'
endef


BIN := /usr/bin
PRINTF := $(BIN)/printf
DF := $(BIN)/df
AWK := $(BIN)/awk
