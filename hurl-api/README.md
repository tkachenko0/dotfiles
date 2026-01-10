# Hurl API Testing

Hurl is a command line tool that runs HTTP requests defined in a simple plain text format.

## Installation

```bash
brew install hurl
```

## Structure

```
hurl-api/
├── environments/
│   ├── demo.env         # Environment variables
│   └── staging.env      # Staging environment
└── requests/
    ├── get-posts.hurl   # GET request
    └── create-post.hurl # POST request
```

## Usage

```bash
# Execute requests
hurl --variables-file environments/demo.env requests/get-posts.hurl
hurl --variables-file environments/demo.env requests/create-post.hurl

# Multiple requests in sequence
hurl --variables-file environments/demo.env requests/*.hurl
```

## Request Examples

**GET Request** (`requests/get-posts.hurl`):

```hurl
GET {{base_url}}/posts
Authorization: Bearer {{token}}
HTTP 200
[Captures]
first_post_id: jsonpath "$[0].id"
```

**POST Request** (`requests/create-post.hurl`):

```hurl
POST {{base_url}}/posts
Content-Type: application/json
Authorization: Bearer {{token}}
{
  "title": "{{post_title}}",
  "body": "{{post_body}}",
  "userId": {{user_id}}
}
HTTP 201
[Asserts]
jsonpath "$.id" exists
```

## Environment Files

**Demo Environment** (`environments/demo.env`):

```
base_url=https://jsonplaceholder.typicode.com
token=
user_id=1
post_title=Test Post
post_body=This is a test post
```

## Advanced Features

**Tests and Assertions:**

```hurl
GET {{base_url}}/posts/1
HTTP 200
[Asserts]
jsonpath "$.id" == 1
jsonpath "$.title" exists
header "Content-Type" contains "application/json"
```

**Chaining Requests:**

```hurl
# Create post and capture ID
POST {{base_url}}/posts
{
  "title": "New Post"
}
HTTP 201
[Captures]
post_id: jsonpath "$.id"

# Get the created post
GET {{base_url}}/posts/{{post_id}}
HTTP 200
```
