LEX=flex
CC=gcc
TARGET=chef_lexer
LEX_OUT=lex.yy.c
LEX_FILE=chef.l

all: $(TARGET)

$(TARGET): $(LEX_FILE)
	$(LEX) $(LEX_FILE)
	$(CC) -o $(TARGET) $(LEX_OUT) -lfl

run: $(TARGET)
	./$(TARGET) exampleprog1.chef

clean:
	rm -f $(TARGET) $(LEX_OUT)