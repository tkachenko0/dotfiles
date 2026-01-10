# API Testing Framework

Simple curl-based API testing framework.

## Structure

```
example-api/
├── environments/
│   └── demo.env         # Environment variables
├── get-posts/
│   └── run.sh           # GET request script
└── create-post/
    ├── run.sh           # POST request script
    └── body.json        # JSON request body
```

## Usage

```bash
api-gun get-posts --env demo
api-gun create-post --env demo
```
