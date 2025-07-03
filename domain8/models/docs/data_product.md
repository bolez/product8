{% docs data_product %}


# Data Contract Summary: customer_nation

## Data Product Description

This data product combines customer details with their respective nation information, providing a comprehensive view of customer demographics and geographical distribution.

## Owner

-   Name: John Doe
-   Email: gauravbole2@gmail.com

## Data Refresh

-   Frequency: daily
-   Refresh Method: incremental
-   Schedule: `0 2 * * *`

## Schema

| Column Name | Type    | Description                          | PII   | Constraints                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| :---------- | :------ | :----------------------------------- | :---- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| c_custkeys  | number  | Customer unique key                | false | `primary_key: true`, `unique: true`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| c_name      | number  | Customer name                        | false | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| c_address   | varchar | Customer address                     | true  | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| c_nationkey | number  | Nation key associated with the customer | false | `primary_key: false`, `unique: false`, `foreign_key_detailes: {table: nation, column: n_nationkey}`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| c_phone     | varchar | Customer phone number                | true  | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| c_acctbal   | number  | Customer account balance             | false | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| c_comments  | varchar | Customer comments                    | false | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| n_names     | varchar | Nation name                          | false | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

## Service Level Agreement (SLA)

-   Freshness: daily
-   Delivery Window: 04:00 UTC
-   Availability: null
-   Max Null Rate: 0.01
-   Incident Response: null

## Retention Policy

-   Type: time-based
-   Duration: 1 year

## Allowed Operations

-   read
-   write

## Contract Approval

-   Approved: true
-   Approved By: jane.doe@example.com

## Tags

-   customer
-   nation
-   demographics
-   geography

## Data Quality Rules

### Column: c_custkeys

-   expect_column_values_to_not_be_null
    -   Type: expect_column_values_to_not_be_null
-   expect_column_values_to_be_unique
    -   Type: expect_column_values_to_be_unique

### Column: c_name

-   expect_column_values_to_not_be_null
    -   Type: expect_column_values_to_not_be_null

### Column: c_address

-   expect_column_values_to_not_be_null
    -   Type: expect_column_values_to_not_be_null

### Column: c_nationkey

-   expect_column_values_to_not_be_null
    -   Type: expect_column_values_to_not_be_null

### Column: c_phone

-   expect_column_values_to_match_regex
    -   Type: expect_column_values_to_match_regex
    -   Pattern: `^\+?[1-9]\d{1,14}$`

### Column: c_acctbal

-   expect_column_values_to_be_between
    -   Type: expect_column_values_to_be_between
    -   Min: -999999999.0
    -   Max: 999999999.0

### Column: c_comments

-   expect_column_value_lengths_to_be_between
    -   Type: expect_column_value_lengths_to_be_between
    -   Min: 10.0
    -   Max: 200.0

### Column: n_names

-   expect_column_values_to_be_in_set
    -   Type: expect_column_values_to_be_in_set
    -   Enum: `['ALGERIA', 'ARGENTINA', 'BRAZIL', 'CANADA', 'EGYPT', 'ETHIOPIA', 'FRANCE', 'GERMANY', 'INDIA', 'INDONESIA', 'IRAN', 'IRAQ', 'ITALY', 'JAPAN', 'JORDAN', 'KENYA', 'LIBYA', 'MEXICO', 'MOROCCO', 'MOZAMBIQUE', 'PERU', 'CHINA', 'ROMANIA', 'RUSSIA', 'SAUDI ARABIA', 'SPAIN', 'VIETNAM', 'UNITED KINGDOM', 'UNITED STATES']`
{% enddocs %}
