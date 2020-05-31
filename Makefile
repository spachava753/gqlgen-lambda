# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
SAMPLE_BINARY_NAME=main
    
all: clean test build package
build:
	$(GOBUILD) -o $(SAMPLE_BINARY_NAME)
package:
	zip main.zip $(SAMPLE_BINARY_NAME)
test: 
	$(GOTEST) -v ./...
clean: 
	rm -f $(SAMPLE_BINARY_NAME)
	rm -f $(SAMPLE_BINARY_NAME).zip