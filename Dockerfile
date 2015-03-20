FROM mysql:5.7

# Install Deps
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apache2 php5 libapache2-mod-php5 curl git
    rm -rf /var/lib/apt/lists/*

# Download opsweekly
RUN mkdir -p /opt/ && \
    git clone https://github.com/etsy/opsweekly.git /opt/opsweekly/ && \
    ln -s /opt/opsweekly/ /var/www/

# Copy over configs
ADD config.php /opt/opsweekly/phplib/config.php
ADD sites-available/default /etc/apache2/sites-available/default
ADD init.sh /opt/opsweekly/init.sh

RUN chmod u+x /opt/opsweekly/init.sh && \
    rm /opt/opsweekly/phplib/config.php.example

ENTRYPOINT "/opt/opsweekly/init.sh"
