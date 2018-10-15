docker: Dockerfile
	docker build --build-arg BUILD_UID=`id -u` --build-arg BUILD_GID=`id -g` -t espbuild:latest .

buildenv: docker
	docker run --user `id -u`:`id -g` --rm -it -v $(IDF_PATH):/esp/esp-idf -v `pwd`:/esp/project espbuild
