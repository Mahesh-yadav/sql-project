# Inventory database schema

This database schema represents an inventory of mechanical parts. This schema will keep track of all the parts, their manufacturer, category, location in storeroom, available inventory, and other relevant information.

The schema also enforces several constraints to ensure that only valid data can be entered into the database.

## DBMS

PostgreSQL

## Tables

- parts
- locations
- manufacturers
- reorder_options

## Constraints

1. Each value in the **code** and **description** columns of **parts** table is unique and not empty.
2. **price_usd** and **quantity** columns in **reorder_options** table are not empty and positive.
3. Track only those parts in the **reorder_options** table whose price per unit is between 0.02 USD and 25.00 USD.
4. **reorder_options** table should track only those parts which are present in the **parts** table.
5. **qty** column in **locations** table should be > 0.
6. **locations** table records only one row for each combination of location and part.
7. **locations** table should track only those parts which are present in the **parts** table.
8. All parts in **parts** have a valid **manufacturer**.
