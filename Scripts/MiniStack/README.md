# MiniStack

MiniStack is a lightweight Docker-based development environment that provides a local AWS-compatible stack for rapid application development and testing.

## Features

- **AWS-compatible environment**: Provides local AWS service emulation on a single port
- **Lightweight**: Minimal footprint with essential tools only
- **Docker-based**: Fully containerized for consistency across environments
- **Easy Setup**: Quick initialization and configuration
- **Portable**: Works across Windows, macOS, and Linux

## What it offers

MiniStack exposes a local AWS endpoint (usually `http://localhost:4566`) for services such as S3, SQS, SNS, DynamoDB, Lambda, IAM, and more.

It allows you to develop and test AWS workflows locally without needing an AWS account or cloud access.

## Getting Started

1. Install Docker Desktop
2. Clone the repository
3. Navigate to the MiniStack directory
4. Run `docker-compose up` to start the environment

## Usage

Configure your environment variables in `.env` file before deployment.

Point your AWS SDK or CLI at the local endpoint, for example:

```bash
# BASH
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1

aws --endpoint-url=http://localhost:4566 s3 ls
```

```bat
REM BAT
set AWS_ACCESS_KEY_ID=test
set AWS_SECRET_ACCESS_KEY=test
set AWS_DEFAULT_REGION=us-east-1

aws --endpoint-url=http://localhost:4566 s3 ls
```

## Documentation

For detailed setup and configuration instructions, see the project documentation.
