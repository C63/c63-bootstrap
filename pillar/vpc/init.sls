{% from 'vpc/public_constants.sls' import cidr_prefix %}
{% from 'vpc/public_constants.sls' import vpc_name %}
{% set igw_name = vpc_name ~ '-igw' %}

include:
  - vpc.public_constants
  - vpc.secgroup
  - vpc.instances

vpc:
  gm_ip: {{ cidr_prefix }}.1.5
  cloud_key: c63-cloud-bootstrap
  igw_name: {{ igw_name }}
  cloud_key_location: /etc/salt/pki/c63-cloud-bootstrap.pem
  subnet:
    - name: public
      cidr_block: {{ cidr_prefix }}.0.0/24
    - name: private
      cidr_block: {{ cidr_prefix }}.1.0/24

