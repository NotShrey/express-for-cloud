# #Base image
# FROM ubuntu

# #install the node js in my image
# RUN apt-get update
# RUN apt install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
# RUN bash /tmp/nodesource_setup.sh
# RUN apt install -y nodejs


###################################################
# as the above code will take more memory to optimize it we are not installing ubuntu

# #ready-made / predefined custom image
# FROM node:20.17.0-alpine3.19


# #copying the source code to docker image
# COPY index.js /home/app/index.js
# COPY package-lock.json /home/app/package-lock.json
# COPY package.json /home/app/package.json 

# WORKDIR /home/app/

# RUN npm install

# CMD [ "npm","start" ]


##################################@###############
#more optimized version

#ready-made / predefined custom image
FROM node:20.17.0-alpine3.19

WORKDIR /home/app/

#copying the source code to docker image
#any change will not affect these so they are cached
COPY package-lock.json package-lock.json
COPY package.json package.json 
RUN npm install


#changes made to this 
COPY index.js index.js
COPY Dockerfile Dockerfile

EXPOSE 8000

CMD [ "npm","start" ]



#starting should be static files
#next should be constantly changing files