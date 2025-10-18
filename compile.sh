#!/bin/bash

SRC_DIR="src/main/java"
LIB_DIR="lib"
BUILD_DIR="build"

echo "Building project..."

# Clean
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

# Find libraries and build classpath
CLASSPATH="$BUILD_DIR"
if [ -d "$LIB_DIR" ]; then
    for jar in $(find $LIB_DIR -name "*.jar"); do
        CLASSPATH="$CLASSPATH:$jar"
    done
fi

echo "Classpath: $CLASSPATH"

# Compile
find $SRC_DIR -name "*.java" | xargs javac -d $BUILD_DIR -cp $CLASSPATH

if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo "Classes compiled to: $BUILD_DIR"
    
    # Run with proper classpath
    echo "Running application..."
    java -cp "$CLASSPATH" com.exemple.main.Main
else
    echo "Build failed!"
    exit 1
fi