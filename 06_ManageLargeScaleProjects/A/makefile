# 再帰的make
# 	大きなプロジェクトではコンポーネントごとにmakefileを用意し, top level makefileで
# 	makeをする
lib_codec := lib/codec
lib_db    := lib/db
lib_ui 	  := lib/ui
libraries := $(lib_ui) $(lib_db) $(lib_codec)
player 	  := app/player

.PHONY: all $(player) $(libraries)
all: $(player)

$(player) $(libraries):
	$(MAKE) --directory=$@

# アプリとライブラリ間の依存関係
$(player): $(libraries)
$(lib_ui): $(lib_db) $(lib_codec)
