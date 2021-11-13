#################################
# Config
#################################
TARGET=sample_exe

BIN_DIR=./bin
SRC_DIR=./src
INC_DIR=./inc

SRCS=$(filter $(SRC_DIR)/main.c, $(wildcard $(SRC_DIR)/*.c))
SRCS+=$(filter-out $(SRC_DIR)/main.c, $(wildcard $(SRC_DIR)/*.c))
OBJS=$(SRCS:.c=.o)

LDFLAGS=
CFLAGS=-g -Wall
INCLUDES=-I$(INC_DIR)

.PHONY: all clean install run

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o $(TARGET) $(OBJS)

install: $(TARGET)
	@mv $(TARGET) $(BIN_DIR)/

$(OBJS): $(SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $(@:.o=.c)

clean:
	$(RM) $(BIN_DIR)/$(TARGET) $(OBJS)

run: install
	$(BIN_DIR)/$(TARGET)

#################################
# References
#################################

## サブディレクトリをmakeする綺麗な方法
# http://cyocho.blog109.fc2.com/blog-entry-52.html

