# Typst build automation for ITS thesis template
.PHONY: all clean install watch help

all: install

install:
	@mkdir -p build
	@echo "Building Typst document..."
	typst compile src/thesis.typ build/thesis.pdf
	@echo "Output: build/thesis.pdf"

clean:
	@echo "Cleaning build artifacts..."
	cmd /c "if exist build\* del /q build\*"
	@echo "Done."

# Preview mode (for live preview)
watch:
	typst watch src/thesis.typ build/thesis.pdf

# Help
help:
	@echo "ITS Thesis Typst Template"
	@echo "========================"
	@echo ""
	@echo "Targets:"
	@echo "  all       - Build the PDF"
	@echo "  install   - Build the PDF"
	@echo "  clean     - Remove build artifacts"
	@echo "  watch     - Build and watch for changes (live preview)"
	@echo ""
	@echo "Usage:"
	@echo "  make          # Build the thesis"
	@echo "  make watch    # Live preview"
	@echo ""
	@echo "Files to edit:"
	@echo "  src/config.yaml  - Thesis metadata"
	@echo "  src/thesis.typ   - Document content"
	@echo "  src/template.typ - Layout and styling"
