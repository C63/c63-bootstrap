{% load_yaml as ami %}
  'eu-central-1':
    ubuntu:
      id: 'ami-5aee2235'
    debian:
      id: 'ami-5900cc36'
    nat:
      id: 'ami-7d0ec112'
    openbsd:
      id: 'ami-07c61168'
{% endload %}

{% from 'vpc/public_constants.sls' import vpc_region %}
ami: {{ ami[vpc_region] }}
