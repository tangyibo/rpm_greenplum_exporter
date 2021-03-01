.PHONY: clean build

build:
	if [ ! -d BUILDROOT/ ]; then mkdir BUILDROOT/ ; fi;
	if [ ! -d RPMS/ ]; then mkdir RPMS/ ; fi;
	if [ ! -d SOURCES/ ]; then mkdir SOURCES/ ; fi;
	if [ ! -d SRPMS/ ]; then mkdir SRPMS/ ; fi;
	rpmbuild -bb SPECS/greenplum_exporter.spec

clean:
	if [ ! -d RPMS/ ]; then mkdir RPMS/ ; fi;
	rm -rf RPMS/*
