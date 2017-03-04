{% set vpc_name = salt['pillar.get']('vpc:name') %}
{% set region = salt['pillar.get']('vpc:region') %}

Boot up core instances:
  cmd.run:
    - name: 'salt-cloud -l debug -y -m /etc/salt/cloud.map.d/map.conf -P'

Wait 60s for nat instance up:
  cmd.run:
    - name: 'sleep 60'
    - require:
      - cmd: Boot up core instances

Fix main route table:
  boto_vpc.route_table_present:
    - name: {{ vpc_name }}-default-table
    - vpc_name: {{ vpc_name }}
    - routes:
      - destination_cidr_block: 0.0.0.0/0
        instance_name: {{ vpc_name }}-nat
    - subnet_names:
      - public
    - region: {{ region }}
    - require:
      - cmd: Wait 60s for nat instance up

