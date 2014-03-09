#################################
# Config
#################################
TARGET=

BIN_DIR=./bin
SRC_DIR=./src
INC_DIR=./inc

SRCS=$(wildcard $(SRC_DIR)/*.c)
OBJS=$(SRCS:.c=.o)

INCLUDES=-I$(INC_DIR)

.PHONY: all clean


all: $(TARGET)


$(TARGET): $(OBJS)
$(CC) $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o $(TARGET) $(OBJS)
@mv $(TARGET) $(BIN_DIR)/

$(OBJS): $(SRCS)
$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

clean:
$(RM) $(BIN_DIR)/$(TARGET) $(SRC_DIR)/$(OBJS)


#################################
# References
#################################

## サブディレクトリをmakeする綺麗な方法
# http://cyocho.blog109.fc2.com/blog-entry-52.html

