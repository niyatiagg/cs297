#!/bin/bash
# Generate SUMO network for handover simulation
# Area: X[175m,1250m], Y[230m,830m]

NET_FILE="urban-scenario.net.xml"

echo "Generating SUMO network..."
echo "Area: X[175m,1250m], Y[230m,830m]"

# Create a grid network
netgenerate --grid \
  --grid.x-number=4 \
  --grid.y-number=3 \
  --grid.length=300 \
  --grid.length.total=false \
  --default.speed=60 \
  --default.lanenum=1 \
  --output-file=$NET_FILE \
  --begin=175 \
  --end=1250 \
  --begin=230 \
  --end=830 \
  --no-turnarounds=false \
  --no-left-connections=false

if [ $? -eq 0 ]; then
    echo "✓ Network generated: $NET_FILE"
    echo ""
    echo "To validate the network, run:"
    echo "  netconvert --xml-validation never -n $NET_FILE"
else
    echo "✗ Error generating network"
    exit 1
fi

