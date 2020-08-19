local_lib  := $(addprefix $(subdirectory)/,libcodec.a)
local_src  := $(wildcard $(subdirectory)/*.c)

$(eval $(call make-library, $(local_lib), $(local_src)))
