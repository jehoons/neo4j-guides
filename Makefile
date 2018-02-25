SRCS=$(wildcard html-source/standb-guides/*.adoc)
OBJS=$(SRCS:.adoc=.html)

all: $(OBJS)

install: 
	rm -rf /var/www/html
	cp -r html-source /var/www/html

%.html : %.adoc
	if [ -z ${STANDB_IPADDR+x} ]; then \
	export STANDB_IPADDR=localhost; \
	fi
	./run.sh $< $@
	sed -i 's/%STANDB_IPADDR%/${STANDB_IPADDR}/g' $@

clean: 
	rm -rf $(OBJS)

