## Rails Take-Home Challenge

### Mission
* An endpoint to subscribe a customer to a tea subscription
* An endpoint to cancel a customer’s tea subscription
* An endpoint to see all of a customer’s subsciptions (active and cancelled)

## API Endpoints

* POST "http://localhost:3000/api/v1/customers/#{customer.id}/subscriptions/create"

```JSON
{
    'title': 'abc',
    'price': '123',
    'status': 'active',
    'frequency': 'monthly',
    'tea_id': tea.id
}
```

* DELETE "http://localhost:3000/api/v1/customers/#{customer.id}/subscriptions/#{customer_subscription1.id}/destroy"

```JSON
{
    "id": 1,
    "customer_id": 1,
    "subscription_id": 1
} status: accepted
```

* GET "http://localhost:3000/api/v1/customers/1/subscriptions"
```JSON
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "test",
                "price": "23",
                "status": "active",
                "frequency": "never",
                "tea_id": 1
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "delete_me",
                "price": "23",
                "status": "cancelled",
                "frequency": "never",
                "tea_id": 1
            }
        }
    ]
}
```

#### Contributors
Tyler Caudill
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tyler-caudill-75885b240/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/TeeCaud)
