GET {{base_url}}/posts
Authorization: Bearer {{token}}
HTTP 200
[Captures]
first_post_id: jsonpath "$[0].id"
