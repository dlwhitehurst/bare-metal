# Also needs to be updated in galaxy.yml
VERSION = 0.6.0

clean:
	rm -f dlwhitehurst-bare-metal-${VERSION}.tar.gz

build: clean
	ansible-galaxy collection build

install: build
	ansible-galaxy collection install --force-with-deps dlwhitehurst-bare-metal-${VERSION}.tar.gz

test:
	cd ~/.ansible/collections/ansible_collections/dlwhitehurst/bare-metal; ansible-test integration -v --color --continue-on-error --diff
