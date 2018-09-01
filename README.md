# Docker

## Instructions for Docker file
* **.dockerignore** - Before the docker CLI sends the context to the docker daemon, it looks for a file named .dockerignore in the root directory of the context. If this file exists, the CLI modifies the context to exclude files and directories that match patterns in it. This helps to avoid unnecessarily sending large or sensitive files and directories to the daemon and potentially adding them to images using ADD or COPY.
```
If a line in .dockerignore file starts with # in column 1, then this line is considered as a comment and is ignored before interpreted by the CLI.

Here is an example .dockerignore file:

# comment
*/temp*
*/*/temp*
temp?
```
* **FROM** - Sets the Base Image for subsequent instructions.
```
FROM ubuntu:15.04
```
* **MAINTAINER** - (deprecated - use LABEL instead) Set the Author field of the generated images.
```
LABEL com.example.version="0.0.1-beta"
LABEL vendor1="ACME Incorporated"
LABEL vendor2=ZENITH\ Incorporated
LABEL com.example.release-date="2015-02-12"
LABEL com.example.version.is-production=""
```
* **RUN** - execute any commands in a new layer on top of the current image and commit the results.
```
RUN apt-get update && apt-get install -y \
        package-bar \
        package-baz \
        package-foo
```
* **CMD** - provide defaults for an executing container.
```
CMD ["perl", "-de0"], CMD ["python"], or CMD [“php”, “-a”]. Using this form means that when you execute something like docker run -it python, you’ll get dropped into a usable shell, ready to go.
```
* **EXPOSE** - informs Docker that the container listens on the specified network ports at runtime. NOTE: does not actually make ports accessible.
```
EXPOSE 8080
```
* **ENV** - sets environment variable.
```
ENV no_proxy=10.0.0.0
ENV https_proxy=something.com:80
```
* **ADD** - copies new files, directories or remote file to container. Invalidates caches. Avoid ADD and use COPY instead.
```
ADD http://example.com/big.tar.xz /usr/src/things/
```
* **COPY** - copies new files or directories to container. Note that this only copies as root, so you have to chown manually regardless of your USER / WORKDIR setting.
```
COPY requirements.txt /tmp/
```
* **ENTRYPOINT** - configures a container that will run as an executable.
```
The best use for ENTRYPOINT is to set the image’s main command, allowing that image to be run as though it was that command (and then use CMD as the default flags)
ENTRYPOINT ["s3cmd"]
CMD ["--help"]
```
* **VOLUME** - creates a mount point for externally mounted volumes or other containers.The VOLUME instruction should be used to expose any database storage area, configuration storage, or files/folders created by your docker container. You are strongly encouraged to use VOLUME for any mutable and/or user-serviceable parts of your image.
```
FROM ubuntu
RUN mkdir /myvol
RUN echo "hello world" > /myvol/greeting
VOLUME /myvol
```
* **USER** - sets the user name for following RUN / CMD / ENTRYPOINT commands.
* **WORKDIR** - sets the working directory.The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile.
```
WORKDIR /path/to/workdir
RUN pwd
```
* **ARG** - defines a build-time variable.The ARG instruction defines a variable that users can pass at build-time to the builder with the docker build command using the --build-arg <varname>=<value> flag. If a user specifies a build argument that was not defined in the Dockerfile, the build outputs a warning.
```
FROM busybox
ARG user1
ARG buildno
```
* **ONBUILD** - adds a trigger instruction when the image is used as the base for another build.The ONBUILD instruction adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build. The trigger will be executed in the context of the downstream build, as if it had been inserted immediately after the FROM instruction in the downstream Dockerfile.
Any build instruction can be registered as a trigger.
```
ONBUILD ADD . /app/src
ONBUILD RUN /usr/local/bin/python-build --dir /app/src
```
* **STOPSIGNAL** - sets the system call signal that will be sent to the container to exit. This signal can be a valid unsigned number that matches a position in the kernel’s syscall table, for instance 9, or a signal name in the format SIGNAME, for instance SIGKILL.
```
STOPSIGNAL signal
```
* **SHELL** - The SHELL instruction allows the default shell used for the shell form of commands to be overridden. The default shell on Linux is ["/bin/sh", "-c"], and on Windows is ["cmd", "/S", "/C"].
```
SHELL ["executable", "parameters"]
```
* **LABEL** - apply key/value metadata to your images, containers, or daemons.
