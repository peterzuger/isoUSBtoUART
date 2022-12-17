TARGET_NAME = USBtoUART
TARGET_DIR = panel

ifeq ($(VERBOSE),1)
	Q =
	RM = rm -v
else
	Q = @
	RM = @rm
endif

ECHO = @echo -e
MKDIR = $(Q)mkdir --parents
KIKIT = $(Q)kikit

TARGET = $(TARGET_DIR)/$(TARGET_NAME).kicad_pcb
TARGET_CONFIG = $(TARGET_DIR).json

all: $(TARGET)

.PHONY: $(TARGET)
$(TARGET): $(TARGET_NAME).kicad_pcb
	$(ECHO) "KIKIT\t$@"
	$(MKDIR) $(TARGET_DIR)
	$(KIKIT) panelize -p $(TARGET_CONFIG) $< $@

.PHONY: clean
clean:
	$(RM) -f $(TARGET_DIR)/*
