SRC_BASE_PATH=/mnt/d/work/code/paxos-dev/trunk/phxpaxos-1.1.3

all:sub_dir

include $(SRC_BASE_PATH)/makefile.mk

SUBDIRS=algorithm benchmark checkpoint comm communicate config logstorage master node sm-base test tools ut utils

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