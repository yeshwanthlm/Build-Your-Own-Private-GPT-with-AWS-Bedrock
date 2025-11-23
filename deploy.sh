#!/bin/bash

set -e

echo "🚀 Deploying AWS SAP-C02 Knowledge Base Chat Application"
echo ""

# Step 1: Package Lambda function
echo "📦 Packaging Lambda function..."
cd lambda
pip install -r requirements.txt -t .
zip -r ../terraform/lambda_function.zip . -x "*.pyc" -x "__pycache__/*"
cd ..

# Step 2: Initialize and apply Terraform
echo ""
echo "🏗️  Deploying infrastructure with Terraform..."
cd terraform
terraform init
terraform plan
terraform apply -auto-approve

# Step 3: Get API endpoint
echo ""
echo "✅ Deployment complete!"
echo ""
API_URL=$(terraform output -raw api_url)
echo "📍 API Endpoint: $API_URL"
echo ""
echo "⚠️  Next steps:"
echo "1. Update frontend/app.js with your API endpoint:"
echo "   const API_ENDPOINT = '$API_URL';"
echo ""
echo "2. Open frontend/index.html in your browser to use the chat interface"
echo ""
echo "3. Make sure your AWS credentials have permissions to access Bedrock Knowledge Base"
