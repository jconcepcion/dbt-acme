# dbt models for Acme Co
Acme Co is a fictional client interested in modernizing their analytics stack.<br>
They want to use dbt to transform data in their warehouse, but need a better understanding<br>
of it’s capabilities before they can move forward.  

The client uses Snowflake as their warehouse and this dataset can be found in the SUBSCRIPTION.RAW schema.<br>
It represents 6 years of order data for Acme Co and is spread across 4 tables.<br> 
![Acme Co ERD](/docs/assets/acme_erd.png)

Account: Represents customers<br>

Order: Represents orders placed by customers<br>
Has 3 types ‘Create Subscription’, ‘Cancel Subscription’, ‘Change Subscription’.<br>
Has an ‘effective on’ date that represents when the order takes effect.<br>
Has a ‘booked on’ date that represents when the deal was closed.<br>

Product: Represents a product Acme Corp sells<br>
Products are either “One Time” (they not recurring and don’t impact annually recurring revenue)<br>
or “Recurring” (they do impact annually recurring revenue).<br>
Products have a “Rate” which is their unit price per time period.<br>
Products have a Unit Timing which defines the period for recurring products.<br>

Order-Product: Represents the changes in quantity for a specific product on an order<br>
Example: Develop License product with quantity change 4 means the customer added 4 develop licenses<br>
Churn Orders do not have product changes (they imply a loss of all annually recurring revenue)<br>
Renewal orders without product changes represent flat renewals<br>

