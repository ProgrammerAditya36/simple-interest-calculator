#!/bin/bash

# Simple Interest Calculator

echo "Simple Interest Calculator"
echo "-------------------------"

# Get input from the user
read -p "Enter the principal amount: " principal
read -p "Enter the annual interest rate (%): " rate
read -p "Enter the time period (in years): " time

# Validate input (basic validation)
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Principal amount must be a number."
  exit 1
fi

if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Interest rate must be a number."
  exit 1
fi

if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Time period must be a number."
  exit 1
fi

# Convert rate to decimal
rate_decimal=$(echo "scale=2; $rate / 100" | bc)

# Calculate simple interest
# Simple Interest = (Principal * Rate * Time) / 100
# Since we converted rate to decimal, it's just Principal * Rate * Time
simple_interest=$(echo "scale=2; $principal * $rate_decimal * $time" | bc)

# Display the result
echo "-------------------------"
echo "Principal: $principal"
echo "Annual Interest Rate: $rate%"
echo "Time Period: $time years"
echo "-------------------------"
echo "Simple Interest: $simple_interest"
