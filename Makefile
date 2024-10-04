CC := gcc
CFLAGS := -Wall -Werror
PREFIX := /usr/local

BUILD_DIR := ./build
SRC_DIR := ./src
TARGET := sciapp

# Link object files to create the executable
$(BUILD_DIR)/$(TARGET): $(BUILD_DIR)/main.o
	mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

# Compile source files into object files
$(BUILD_DIR)/main.o: $(SRC_DIR)/main.c
	mkdir -p $(dir $@)
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $^ -o $@

# Install the program
.PHONY: install
install: $(BUILD_DIR)/$(TARGET)
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 775 $(BUILD_DIR)/$(TARGET) $(DESTDIR)$(PREFIX)/bin

# Clean up build artifacts
.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
