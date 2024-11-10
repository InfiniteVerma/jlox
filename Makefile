# Define directories and filenames
SRC_DIR = com/craftinginterpreters/lox
SRC_FILE = $(SRC_DIR)/Lox.java
CLASS_FILE = $(SRC_DIR)/Lox.class

# Compiler options
JAVAC = javac
JAVA = java

# Targets
all: $(CLASS_FILE)

# Rule to compile Java file
$(CLASS_FILE): $(SRC_FILE)
	$(JAVAC) $(SRC_FILE)

# Rule to run the program
run: $(CLASS_FILE)
	$(JAVA) com.craftinginterpreters.lox.Lox

# Clean up generated class files
clean:
	rm -f $(SRC_DIR)/*.class

# Rule to help with usage
help:
	@echo "Makefile for compiling and running the Lox Java program."
	@echo "Usage:"
	@echo "  make            - Compiles the Lox.java file."
	@echo "  make run        - Compiles and runs the Lox program."
	@echo "  make clean      - Removes compiled class files."
	@echo "  make help       - Displays this help message."

.PHONY: all run clean help

