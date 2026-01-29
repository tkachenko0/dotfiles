POST {{base_url}}/posts
Content-Type: application/json
Authorization: Bearer {{token}}
{
  "title": "{{post_title}}",
  "body": "{{post_body}}",
  "userId": {{user_id}}
}
