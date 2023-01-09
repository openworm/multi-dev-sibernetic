CC = g++ -std=c++11 -Wall -pedantic -pthread
TARGET:=sibernetic
TEST_TARGET:=stest
RM := rm -rf
TEST := test
SRC_DIR := src
INC_DIR := inc 
BUILD_DIR := bin
TEST_BIN_DIR := $(TEST)/bin
SRC_EXT := cpp
BINARY_DIR = $(BUILD_DIR)/obj


# OCL_INC  = -I/opt/AMDAPPSDK-3.0/include/
OCL_INC  = -I/usr/include/#/opt/shared/nvidia/cuda/include/
OCL_LIB  = -L/usr/lib/x86_64-linux-gnu/#/opt/shared/nvidia/cuda/lib64/

#OCL_INC = -I/opt/intel/opencl/SDK/include
LIBS := -lOpenCL
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Darwin)
	LIBS := -framework OpenCL
endif


SRC := $(wildcard $(SRC_DIR)/*.$(SRC_EXT))
SRC += $(wildcard $(SRC_DIR)/utils/*.$(SRC_EXT))
TEST_SRC := $(wildcard $(TEST)/*.$(SRC_EXT))

OBJ := $(patsubst $(SRC_DIR)/%,$(BINARY_DIR)/%,$(SRC:.$(SRC_EXT)=.o))
TEST_OBJ := $(patsubst $(TEST)/%,$(TEST_BIN_DIR)/%,$(TEST_SRC:.$(SRC_EXT)=.o))

CXXFLAGS = $(CC)

all: CXXFLAGS += -O3
all: $(TARGET)

debug: CXXFLAGS += -ggdb -O0
debug: $(TARGET)

test: SRC := $(shell ls $(SRC_DIR)| grep [^sibernetic]\.cpp)
test: SRC := $(wildcard $(SRC_DIR)/$(SRC))
test: OBJ := $(patsubst $(SRC_DIR)/%,$(BINARY_DIR)/%,$(SRC:.$(SRC_EXT)=.o))
test: $(TEST_TARGET)


$(TARGET): $(OBJ)
	@echo 'Building target: $@'
	$(CXXFLAGS) $(OCL_LIB) -o $(BUILD_DIR)/$(TARGET) $(OBJ) $(LIBS)
	@echo 'Finished building target: $@'

$(BINARY_DIR)/%.o: $(SRC_DIR)/%.$(SRC_EXT)
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BINARY_DIR)
	@mkdir -p $(BINARY_DIR)/utils
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	$(CXXFLAGS) $(OCL_LIB) $(OCL_INC) -I$(INC_DIR) -c -o "$@" "$<"
	@echo 'Finished building: $<'

clean:
	@echo "Cleaning...";
	$(RM) $(BUILD_DIR)
	$(RM) $(TEST_BIN_DIR)

clear:
	@echo "Cleaning...";
	$(RM) $(BUILD_DIR)
	$(RM) $(TEST_BIN_DIR)

radio: 
	@echo 'Building files: $(CPP_FILES)'

.PHONY: all clean debug mac_os test clear
