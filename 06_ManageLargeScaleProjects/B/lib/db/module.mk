local_lib  := $(addprefix $(subdirectory)/,libdb.a)
local_src  := $(wildcard $(subdirectory)/*.[ly])


$(eval $(call make-library, $(local_lib), $(local_src)))

.SECONDARY: $(call generated-source, $(local_src))
