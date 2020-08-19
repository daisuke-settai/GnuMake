local_pgm  := $(subdirectory)/play_mp3
# wildcatdでソースをひっかける方法はバージョン管理システムを使わない場合にはあまり適さない
local_src  := $(addprefix $(subdirectory)/,$(wildcard *.c))
local_objs := $(subst .c,.o,$(local_src))

programs   += $(local_pgm)
sources    += $(local_src)

$(local_pgm): $(local_objs) $(libraries)
