.PHONY: dev test build help

BASE_PATH := $(PWD)

dev:
	@tmux rename-window dev
	@tmux send-keys "cd $(BASE_PATH)/" C-m
	@tmux send-keys 'npm run dev'
	@tmux split-window -h
	@tmux send-keys "cd $(BASE_PATH)/" C-m

test:
	@echo "Running tests..."
	@npm test

build:
	@echo "Building project..."
	@npm run build

help:
	@echo "Available targets:"
	@echo "  dev   - Start development environment"
	@echo "  test  - Run tests"
	@echo "  build - Build project"