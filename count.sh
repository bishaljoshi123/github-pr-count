#!/bin/bash
TOKEN=""

# List of Repositories
REPOS=(
  "Lolo-Legacy/lolo-frontend"
  "Lolo-Legacy/user-management-service"
  "Lolo-Legacy/finance-management-service"
  "Lolo-Legacy/asset-management-service"
  "Lolo-Legacy/secrets-management-service"
  "Lolo-Legacy/sms-service"
  "Lolo-Legacy/user-registration-cloud-function"
  "Lolo-Legacy/lolo-legacy-backend"
  "Lolo-Legacy/api-gateway-config"
)

# Base URL
BASE_URL="https://api.github.com/search/issues"

# Loop through each repository and fetch total count
for REPO in "${REPOS[@]}"; do
  RESPONSE=$(curl -s -H "Authorization: token $TOKEN" \
    "$BASE_URL?q=repo:$REPO+is:pr+is:merged+merged:>=2024-10-01")
  
  # Extract the total_count from the JSON response
  TOTAL_COUNT=$(echo "$RESPONSE" | jq -r '.total_count')
  
  # Print the repository name and total count
  echo "$REPO: $TOTAL_COUNT merged PRs"
done
