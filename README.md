# README

#### Tasks

1. Create a website which shows 3 different product categories and an address input field
2. After selecting the category and submitting the address, the server should return the approximate delivery cost and show the nearest 3 product names
3. Products are delivered by a hauling truck. Depending on the weight of the product, the hauler needs to choose a different truck, which results in different cost. Products < 5t cost 75 €/h and Products >= 5t cost 90 €/h
4. Trucks need to be paid for the way to the construction site and also back, because they always drive back empty

#### Setup

```bash
rails db:creates
rails db:migrate
bundle install
```

#### Database schema

```sql
CREATE TABLE categories (
    id bigint NOT NULL,
    name character varying(20) NOT NULL
);

CREATE TABLE products (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    category_id bigint NOT NULL,
    station_id bigint NOT NULL,
    weight bigint NOT NULL
);

CREATE TABLE stations (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);
```
