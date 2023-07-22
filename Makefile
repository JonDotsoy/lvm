
USER=user

lvm: make_image make_bin

make_image:
	docker build --build-arg USER=$(USER) -t lvm --platform linux/amd64 .
	docker create --name lvm --volume "./$(USER):/home/$(USER)" lvm

make_bin:
	touch lvm.sh
	echo "#/usr/bin/env bash\n\ndocker start lvm && docker exec -it lvm bash" > lvm.sh
	chmod +x lvm.sh

clean:
	docker stop lvm -t 0
	docker rm lvm
