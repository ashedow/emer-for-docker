# emer-for-docker

Dockerfile and config for start emercoin docker

## How to use

* Enshure that you installed docker-ce, git and so on

* Clone this repo
`git clone https://github.com/ya-0/emer-for-docker.git`

* Change the active directory
`cd emer-for-docker`

* Create image
`docker build -t you_image_name .`

* Start container (see at config for set the right port and dir)
`docker run -d --name you_container_name --restart=always -p 9081:9081 -v /var/lib/emcmain:/data/emercoin you_image_name`
