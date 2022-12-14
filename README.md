## Rails Take-Home Challenge

### Mission
* An endpoint to subscribe a customer to a tea subscription
* An endpoint to cancel a customer’s tea subscription
* An endpoint to see all of a customer’s subsciptions (active and cancelled)
* An endpoint to create a customer
* An endpoint to delete a customer
* An endpoint to update a customer

## API Endpoints

* POST "http://localhost:3000/api/v1/customers/1/tea_subscriptions?title=abc&price=123&status=active&frequency=monthly&tea_id=1&customer_id=1"

```JSON
{
    "data": {
        "id": "4",
        "type": "tea_subscription",
        "attributes": {
            "title": "abc",
            "price": "123",
            "status": "active",
            "frequency": "monthly",
            "tea_id": 1,
            "customer_id": 1
        }
    }
}
```

* DELETE "http://localhost:3000/api/v1/customers/1/customer_subscriptions/1"

```JSON
{
    "id": 1,
    "title": "test",
    "price": "23",
    "status": "active",
    "frequency": "never",
    "tea_id": 1,
    "customer_id": 1
}
status: accepted
```

* GET "http://localhost:3000/api/v1/customers/1/tea_subscriptions"
```JSON
{
    "data": [
        {
            "id": "1",
            "type": "tea_subscription",
            "attributes": {
                "title": "test",
                "price": "23",
                "status": "active",
                "frequency": "never",
                "tea_id": 1,
                "customer_id": 1
            }
        },
        {
            "id": "2",
            "type": "tea_subscription",
            "attributes": {
                "title": "delete_me",
                "price": "23",
                "status": "cancelled",
                "frequency": "never",
                "tea_id": 1,
                "customer_id": 1
            }
        }
    ]
}
```

* POST "http://localhost:3000/api/v1/customers?first_name=tee&last_name=caud&email=no&address=no"
```JSON
{
    "data": {
        "id": "3",
        "type": "customer",
        "attributes": {
            "id": 3,
            "first_name": "tee",
            "last_name": "caud",
            "email": "no",
            "address": "no"
        }
    }
}
```

* DELETE "http://localhost:3000/api/v1/customers/1"
```JSON
{
    "id": 1,
    "first_name": "a",
    "last_name": "b",
    "email": "c",
    "address": "d"
}
status: accepted
```

* PATCH "http://localhost:3000/api/v1/customers/1
```JSON
{
    "data": {
        "id": "1",
        "type": "customer",
        "attributes": {
            "id": 1,
            "first_name": "tee",
            "last_name": "b",
            "email": "c",
            "address": "d"
        }
    }
}
```

#### Contributors
Tyler Caudill
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tyler-caudill-75885b240/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/TeeCaud)
