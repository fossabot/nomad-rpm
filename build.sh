#!/bin/bash -x
rm -rf ~/rpmbuild
rpmdev-setuptree
[ -L ~/rpmbuild/SPECS/nomad.spec ] || ln -s /opt/rpm/SPECS/nomad.spec ~/rpmbuild/SPECS/
for f in `find /opt/rpm/SOURCES -type f`; do
  [ -L ~/rpmbuild/SOURCES/`basename $f` ] || ln -s $f ~/rpmbuild/SOURCES/
done
spectool -g -R ~/rpmbuild/SPECS/nomad.spec
rpmbuild -ba ~/rpmbuild/SPECS/nomad.spec
cp ~/rpmbuild/RPMS/x86_64/nomad*.rpm /opt/rpm

