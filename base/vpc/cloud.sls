{% set vpc_name = salt['pillar.get']('vpc:name') %}
{% set region = salt['pillar.get']('vpc:region') %}
{% set key_name = salt['pillar.get']('vpc:cloud_key') %}

{{ key_name }}:
  boto_ec2.key_present:
    - save_private: /etc/salt/pki/
    - region: {{ region }}

/etc/salt/cloud.providers.d/ec2.provider.conf:
  file.managed:
    - source: salt://vpc/files/cloud/ec2.provider.conf
    - template: jinja
    - replace: True
    - makedirs: True
    - create: True

/etc/salt/cloud.profiles.d/ec2.profile.conf:
  file.managed:
    - source: salt://vpc/files/cloud/ec2.profile.conf
    - template: jinja
    - replace: True
    - makedirs: True
    - create: True
    - require:
      - file: /etc/salt/cloud.providers.d/ec2.provider.conf

/etc/salt/cloud.map.d/map.conf:
  file.managed:
    - source: salt://vpc/files/cloud/map.conf
    - template: jinja
    - replace: True
    - makedirs: True
    - create: True

