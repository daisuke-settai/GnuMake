# 非再帰的make: ディレクトリごとのmakefileをincludeする

# srcリストから .c -> .o, .y -> .o, .l -> .o に変換
# $(call source-to-object, source-file-list)
source-to-object = $(subst .c,.o,$(filter %.c,$1)) \
		   $(subst .y,.o,$(filter %.y,$1)) \
		   $(subst .l,.o,$(filter %.l,$1))

# MAKEFILE_LISTから処理中のmakefile pathを取得しmodule.mkを削る
# $(subdirectory)
subdirectory = $(patsubst %/module.mk,%,			\
		 $(word						\
		   $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))

# evalで使うため$をエスケープ
# $(call make-library, library-name, source-file-list)
define make-library
  libraries += $1
  sources   += $2

  $1: $(call source-to-object,$2)
	$(AR) $(ARFLAGS) $$@ $$^
endef

# 生成されるsrcファイル一覧. for clean: .y -> .c, .y -> .h, .l -> .c
# $(call generated-source, source-file-list)
generated-source = $(subst .y,.c,$(filter %.y,$1))	\
		   $(subst .y,.h,$(filter %.y,$1))	\
		   $(subst .l,.c,$(filter %.l,$1))

# Collect information from each module in these four variables.
# Initialize them here as simple variables.

# 初期化しないとデフォルトで再帰変数となる
# modules      := lib/codec lib/db lib/ui app/player
modules			 := $(subst /module.mk,,$(shell find . -name module.mk))
programs     :=
libraries    :=
sources      :=

objects      = $(call source-to-object,$(sources))
# srcの拡張子は.c, .y, .lだが, objの拡張子は.oで統一されている
dependencies = $(subst .o,.d,$(objects))

$(warning CPPFLAGS1: $(CPPFLAGS))
include_dirs := lib include
CPPFLAGS     += $(addprefix -I ,$(include_dirs))
vpath %.h $(include_dirs)
$(warning CPPFLAGS2: $(CPPFLAGS))

MV  := mv -f
RM  := rm -f
SED := sed

all:

include $(addsuffix /module.mk,$(modules))
$(warning CPPFLAGS3: $(CPPFLAGS))

.PHONY: all
all: $(programs)

.PHONY: libraries
libraries: $(libraries)

.PHONY: clean
clean:
	$(RM) $(objects) $(programs) $(libraries) $(dependencies) \
		$(call generated-source,$(sources))

ifneq "$(MAKECMDGOALS)" "clean"
  include $(dependencies)
endif

# $*: %部分
%.c %.h: %.y
	$(YACC.y) --defines $<
	$(MV) y.tab.c $*.c
	$(MV) y.tab.h $*.h

# makefileにcodec.hなどを書かずに済む
# sed: ui.o: lib/ui/ui.c include/ui/ui.h lib/db/playlist.h
# 	=> lib/ui/ui.o: ...
%.d: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -M $< | \
	$(SED) 's,\($(notdir $*)\.o\) *:,$(dir $@)\1 $@: ,' > $@.tmp
	$(MV) $@.tmp $@
