{% from 'vpc/public_constants.sls' import cidr_prefix %}
{% from 'vpc/public_constants.sls' import vpc_region %}
{% from 'vpc/public_constants.sls' import vpc_name %}
{% from 'ami_ids.sls' import ami %}
{% set region_ami = ami[vpc_region] %}

vpc:
  instances:
    - name: {{ vpc_name }}-nat
      image_id: {{ region_ami.openbsd.id }}
      private_ip_address: {{ cidr_prefix }}.0.99
      size: t2.micro
      subnet: public
      secgroup:
        - {{ vpc_name }}-nat-egress
    - name: {{ vpc_name }}-salt-master
      image_id: {{ region_ami.debian.id }}
      private_ip_address: {{ cidr_prefix }}.1.5
      size: t2.micro
      subnet: private
      secgroup:
        - {{ vpc_name }}-default-internal
