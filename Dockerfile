FROM ubuntu
RUN apt-get update \
	&& apt-get upgrade -yy \
	&& apt install -yy ffmpeg
RUN apt-get install -yy ca-certificates curl gnupg \
	&& mkdir -p /etc/apt/keyrings \
	&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
	&& echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
	&& apt-get update \
	&& apt-get install -y nodejs
RUN npm install -g @peertube/peertube-runner

CMD peertube-runner server
