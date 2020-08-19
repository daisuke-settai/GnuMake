local_lib  := $(addprefix $(subdirectory)/,libui.a)
local_src  := $(wildcard $(subdirectory)/*.c)


$(eval $(call make-library, $(local_lib), $(local_src)))

$(subdirectory)/ui.d: lib/db/playlist.h
