local_lib  := $(addprefix $(subdirectory)/,libcodec.a)
local_src  := $(wildcard $(subdirectory)/*.c)
include_dirs += xxx

$(eval $(call make-library, $(local_lib), $(local_src)))
