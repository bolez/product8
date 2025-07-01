



{% macro list_product(object_schema, object_name, share_name) %}
    GRANT SELECT ON table  {{object_name}} TO SHARE {{ share_name }};
{% set full_account = target.account %}
{% set short_account = full_account.split('-')[-1] %}



  {% set object_name_str = object_name.render() %}
  {% set table_name = object_name_str.split('.')[-1] %}
    {% set sql %}
    -- GRANT SELECT ON TABLE DEVORGDB5.PUBLIC.TUTORIAL_TABLE TO SHARE ORG_SHARE5;
    --   GRANT USAGE ON SCHEMA {{ target.database }}.{{ view_schema }} TO SHARE {{ share_name }};
      GRANT SELECT ON TABLE {{ object_name }} TO SHARE {{ share_name }};
      CREATE ORGANIZATION LISTING {{share_name}}
      SHARE {{share_name}} AS
      $$
      title : '{{share_name}}'
      description: "Created using dbt and cookicutter {{share_name}}"
      organization_profile: INTERNAL
      organization_targets:
        discovery:
        - all_accounts : true 
        access:
        - account: {{ short_account }}
          roles:
          - {{target.role}}
      locations:
        access_regions:
        - name: "ALL"
      support_contact: "gauravbole2@gmail.com"
      approver_contact: "gauravbole2@gmail.com"
      data_dictionary:
        featured:
          database: "{{var('domain_database')}}"
          objects:
            - name: "{{table_name}}"
              schema: "{{object_schema}}"
              domain: "TABLE"

      data_attributes:
        refresh_rate: DAILY
        geography:
            geo_option: NOT_APPLICABLE
            time:
                granularity: MONTHLY
                time_range:
                    time_frame: LAST
                    unit: MONTHS
                    value: 6

      usage_examples:
        - title: "Return all {{object_name}} for the {{object_name}}"
          description: "Example of how to select {{object_name}} information"
          query: "select * from {{object_name}}"
      resources:
        documentation: https://www.example.com/documentation/
      $$;


    {% endset %}

    {% set table = run_query(sql) %}


{% endmacro %}

