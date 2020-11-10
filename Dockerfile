FROM alpine:3.11
RUN apk add --no-cache openssh-client ansible git

COPY ./ansible /ansible

RUN ansible-galaxy install -r /ansible/requirements.yml --ignore-errors

WORKDIR /ansible

CMD [ "" ]
