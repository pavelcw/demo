FROM nginx:1.31.4
ADD index.html /opt
ADD site-nginx.conf /opt
ADD play.yml /opt
RUN apt-get update
RUN apt-get install -y ansible
RUN echo "[demohost]\nlocalhost ansible_connection=local" >> /etc/ansible/hosts
RUN ansible-playbook /opt/play.yml
EXPOSE "80:80"
