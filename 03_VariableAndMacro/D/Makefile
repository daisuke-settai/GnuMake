vpath %.mk mk

# foo.mk がターゲットを含む場合デフォルトターゲットが変わってしまうため
all:

# includeターゲットが更新される場合, makeを初めからやり直す
include foo.mk
$(warning Finished include)

all:
	$(warning default target)

foo.mk: bar.mk
	m4 --define=FILENAME=$@ $< > $@

.PHONY: clean
clean:
	rm -f foo.mk
