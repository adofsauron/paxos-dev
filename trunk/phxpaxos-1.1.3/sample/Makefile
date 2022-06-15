SRC_BASE_PATH=/root/work/paxos-dev/trunk/phxpaxos-1.1.3

all:sub_dir

include $(SRC_BASE_PATH)/makefile.mk

SUBDIRS=phxecho phxelection phxkv

.PHONY:sub_dir
sub_dir:$(SUBDIRS)
	@for sub_dir in $^; do \
	make -C $$sub_dir; \
	done

.PHONY:clean
clean:$(SUBDIRS)
	@for sub_dir in $^; do \
	make -C $$sub_dir clean;\
	done
	rm -rf *.o *.pb.*  