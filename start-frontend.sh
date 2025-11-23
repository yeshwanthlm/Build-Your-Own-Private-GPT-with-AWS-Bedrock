#!/bin/bash

echo "🚀 Starting AWS SAP-C02 Chat Frontend..."
echo ""
echo "Opening browser at http://localhost:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

cd frontend
python3 -m http.server 8000
