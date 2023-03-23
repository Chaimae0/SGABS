# the base image
FROM centos:7
RUN yum -y update && yum clean all

# Copy PostgreSQL RPM files to the image
COPY postgresql14*.rpm  /tmp/

# Install PostgreSQL from the RPM files
RUN yum install -y /tmp/postgresql14*.rpm
RUN rm /tmp/postgresql*.rpm

# Set environment variables for the PostgreSQL server
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD itseasy

RUN mkdir -p /usr/local/pgsql/data && chown postgres /usr/local/pgsql/data
USER postgres

RUN /usr/pgsql-14/bin/initdb -D /usr/local/pgsql/data


# Copy the SQL script that will be executed when the container is started
#COPY init.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432

# Start the PostgreSQL server when the container is started
CMD ["postgres", "-D", "/var/lib/postgresql/data"]
