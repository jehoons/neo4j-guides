SRCS=$(wildcard *.adoc)
OBJS=$(SRCS:.adoc=.html)

all: $(OBJS)

%.html : %.adoc
	make_guide $< $@
	sed -i 's/%STANDB_IPADDR%/${STANDB_IPADDR}/g' $@

clean:
	rm -f hello.html test.html
