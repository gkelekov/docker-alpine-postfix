# docker-alpine-postfix

Simple postfix relay host for your Docker containers. Based on Alpine Linux.

Description
This server side image allows you to run POSTFIX internally inside your docker cloud/swarm installation to centralise outgoing email sending. 
The embedded postfix enables you to either send messages directly or relay them to your company's main server. 
That is why it should not be used with any clinet-side security featuers (it should support them if properly configurated, but it is not images main purpose, and has not been tested in those conditions) 

Image exposes standard port 25 for incoming messages. If any other port needed, change it in Dockerfile and it will work fine.

To run the container, you first need to build image and then run it
```
docker build -t alpine-postfix .
```

And then to run it:
```
docker run -p 25:25 --name postfix  alpine-postfix
```

You can now send emails by using localhost:25 as your SMTP server address.
You can test it via telnet. (just don't forget "." at the end)

```
telnet localhost 25 
MAIL FROM: goran.kelekovic@gmail.com
RCPT TO: goran.kelekovic@gmail.com
data
SUBJECT: Postfix Test
Hi,
Postfix test mail.
Admin
.
```

