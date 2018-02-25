SRCS=$(wildcard html-source/standb-guides/*.adoc)
OBJS=$(SRCS:.adoc=.html)

all: $(OBJS)

install: 
	rm -rf /var/www/html
	cp -r html-source /var/www/html

%.html : %.adoc
	./run.sh $< $@
	sed -i 's/%STANDB_IPADDR%/${STANDB_IPADDR}/g' $@

clean: 
	rm -rf $(OBJS)

