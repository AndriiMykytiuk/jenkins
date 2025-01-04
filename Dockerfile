# Use the official Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to root user to install additional tools if needed
USER root

# Install additional dependencies (Optional)
RUN apt-get update && apt-get install -y \
    git \
    vim \
    curl \
    unzip \
    && apt-get clean

# Expose Jenkins port
EXPOSE 8080
EXPOSE 50000

# Define the volume for Jenkins home directory
VOLUME /var/jenkins_home

# Switch back to Jenkins user
USER jenkins

# Set the default working directory
WORKDIR /var/jenkins_home

# Run Jenkins
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
