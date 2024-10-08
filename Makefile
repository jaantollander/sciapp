CC := gcc
CFLAGS := -Wall -Werror
PREFIX := /usr/local

# Source directory
SRC_DIR := ./src

# Build directory
BUILD_DIR := ./build

# Name of the target application
TARGET := sciapp

# Link object files to create the executable
$(BUILD_DIR)/$(TARGET): $(BUILD_DIR)/main.o
	mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

# Compile source files into object files
$(BUILD_DIR)/main.o: $(SRC_DIR)/main.c
	mkdir -p $(dir $@)
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $^ -o $@

# Build all
.PHONY: all
all: $(BUILD_DIR)/$(TARGET)

# Install the program
.PHONY: install
install: $(BUILD_DIR)/$(TARGET)
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 775 $(BUILD_DIR)/$(TARGET) $(DESTDIR)$(PREFIX)/bin

# Clean up build artifacts
.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
