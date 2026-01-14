---
name: consulting-docs
description: This skill should be used when the user asks to "search docs", "look up documentation", "find docs for [library]", "get documentation for [package]", or when working with a library and needing up-to-date API reference. Uses the context7 MCP server to retrieve current documentation and code examples.
---

# Context7 Documentation Search

## Overview

Context7 provides access to up-to-date documentation and code examples for programming libraries. Use this skill when needing current documentation that may be beyond the model's knowledge cutoff.

## When to Use

- Looking up API documentation for a specific library
- Needing code examples for a library feature
- Verifying current library behavior (may have changed since training)
- Working with new library versions
- Researching unfamiliar libraries

## Two-Step Process

Documentation retrieval requires two steps:

### Step 1: Resolve Library ID

First, resolve the library/package name to a Context7-compatible library ID using `mcp__context7__resolve-library-id`.

**Parameters:**
- `libraryName` (required): The library name to search for (e.g., "react", "express", "next.js")
- `query` (required): The user's original question to rank results by relevance

**Example:**
```
libraryName: "react"
query: "How do I use the useEffect hook with cleanup?"
```

**Selection criteria when multiple results:**
1. Name similarity (exact matches prioritized)
2. Description relevance to query intent
3. Documentation coverage (higher code snippet counts preferred)
4. Source reputation (High/Medium more authoritative)
5. Benchmark Score (100 is highest quality)

### Step 2: Query Documentation

After obtaining the library ID, query the documentation using `mcp__context7__query-docs`.

**Parameters:**
- `libraryId` (required): The Context7 library ID from step 1 (format: `/org/project` or `/org/project/version`)
- `query` (required): Specific question about what to find in the docs

**Example:**
```
libraryId: "/facebook/react"
query: "useEffect cleanup function examples"
```

## Best Practices

- Be specific in queries - "How to set up authentication with JWT in Express.js" is better than "auth"
- Include relevant context in the query to get targeted results
- Limit to 3 calls per question - if not found after 3 attempts, use best available result
- Never include sensitive information (API keys, passwords) in queries

## Common Patterns

**Looking up a specific feature:**
1. Resolve: `libraryName: "express"`, `query: "middleware error handling"`
2. Query: `libraryId: "/expressjs/express"`, `query: "error handling middleware next function"`

**Comparing approaches:**
1. Resolve the library first
2. Query for each approach separately if needed

**Version-specific documentation:**
- If resolved library includes version info (`/org/project/version`), use it for version-specific docs
- Otherwise, docs default to latest/current version
