# Define directories and filenames
SRC_DIR_LOX = com/craftinginterpreters/lox
SRC_FILE_LOX = $(SRC_DIR_LOX)/Lox.java
CLASS_FILE_LOX = $(SRC_DIR_LOX)/Lox.class

SRC_DIR_TOOL = com/craftinginterpreters/tool
SRC_FILE_TOOL = $(SRC_DIR_TOOL)/GenerateAst.java
CLASS_FILE_TOOL = $(SRC_DIR_TOOL)/GenerateAst.class

# Output directory for GenerateAst (lox subdirectory)
OUTPUT_DIR = com/craftinginterpreters/lox

# Compiler options
JAVAC = javac
JAVA = java

# Targets
all: $(CLASS_FILE_LOX) $(CLASS_FILE_TOOL) generate_ast

# Rule to compile Lox.java
$(CLASS_FILE_LOX): $(SRC_FILE_LOX)
	$(JAVAC) $(SRC_FILE_LOX)

# Rule to compile GenerateAst.java
$(CLASS_FILE_TOOL): $(SRC_FILE_TOOL)
	$(JAVAC) $(SRC_FILE_TOOL)

# Rule to run the Lox program
run: $(CLASS_FILE_LOX)
	$(JAVA) com.craftinginterpreters.lox.Lox

# Rule to run GenerateAst program and output to lox subdirectory
generate_ast: $(CLASS_FILE_TOOL)
	#mkdir -p $(OUTPUT_DIR)
	$(JAVA) com.craftinginterpreters.tool.GenerateAst $(OUTPUT_DIR)

# Clean up generated class files
clean:
	rm -f $(SRC_DIR_LOX)/*.class
	rm -f $(SRC_DIR_TOOL)/*.class
	#rm $(SRC_DIR_LOX)/Expr.java
	#rm $(SRC_DIR_LOX)/Stmt.java

# Rule to help with usage
help:
	@echo "Makefile for compiling and running the Lox and GenerateAst Java programs."
	@echo "Usage:"
	@echo "  make            - Compiles the Lox.java and GenerateAst.java files."
	@echo "  make run        - Compiles and runs the Lox program."
	@echo "  make generate_ast - Compiles and runs the GenerateAst program, outputting to the lox subdirectory."
	@echo "  make clean      - Removes compiled class files."
	@echo "  make help       - Displays this help message."

.PHONY: all run generate_ast clean help

