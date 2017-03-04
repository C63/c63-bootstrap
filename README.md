This will run standalone salt-minion with salt-cloud to bootstrap a vpc

- Packages needed for Archlinux:
  - salt
  - python2-boto
  - python2-boto3
  - aws-cli: need to be configured with IAM user that has permissions for AWS EC2

Then just run `bootstrap.sh`
