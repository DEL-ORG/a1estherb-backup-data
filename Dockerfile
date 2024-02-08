# Use an official PostgreSQL client image as base
FROM postgres

# Install required dependencies
RUN apt-get update && apt-get install -y \
    postgresql-client \
    curl \
    python3 \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI using apt-get
RUN apt-get update && apt-get install -y \
    groff \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip
WORKDIR /backup
COPY . .
RUN chmod +x backup.sh
# Set up AWS credentials and S3 bucket name as environment variables
ENV AWS_ACCESS_KEY_ID=AKIAZI2LE2Z6CLDSGQZ7
ENV AWS_SECRET_ACCESS_KEY=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
ENV AWS_DEFAULT_REGION=us-east-1
ENV AWS_S3_BUCKET_NAME=s3://del-db-backup/S6/a1estherb/

# Verify installation and configuration
RUN aws --version && psql --version

# Define entrypoint without quotes
CMD ["bash"]
#set postgress connection strings
ENV DB_USER=doadmin
ENV DB_NAME=s6-user
ENV DB_HOST=db-postgresql-nyc3-26515-do-user-12198957-0.c.db.ondigitalocean.com
ENV DB_PORT=25060

ENV DB_PASSWORD=AVNS_HkmaatXJL1QfH60HmnZ 
