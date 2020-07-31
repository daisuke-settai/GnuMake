ifdef COMSPEC # windows
	PATH_SEP := ;
	EXE_EXT := .exe
else
	PATH_SEP := :
	EXE_EXT :=
endif

# if :
# 	ifdef var これは$()で括らない
# 	ifndef var
# 	ifeq 'XXX' 'YYY'
# 	ifneq 'XXX' 'YYY'

ifeq '$(strip $(PATH_SEP))' ':'
	ECHO := @echo "not windows"
endif

ifneq '$(strip $(PATH_SEP))' ':'
	ECHO := @echo "windows"
endif

echo :
	$(ECHO)
