# Typst build automation for ITS thesis template
# Supports both master's and undergraduate thesis.
.PHONY: all master undergraduate clean watch-master watch-undergraduate help

all: master

master:
	@mkdir -p build
	@echo "Building Master's Thesis PDF..."
	typst compile src/master-thesis/thesis.typ build/thesis.pdf
	@echo "Output: build/thesis.pdf"

undergraduate:
	@mkdir -p build
	@echo "Building Undergraduate Thesis PDF..."
	typst compile src/undergraduate-thesis/thesis.typ build/thesis.pdf
	@echo "Output: build/thesis.pdf"

clean:
	@echo "Cleaning build artifacts..."
	cmd /c "if exist build\* del /q build\*"
	@echo "Done."

# Preview mode (for live preview)
watch-master:
	typst watch src/master-thesis/thesis.typ build/thesis.pdf

watch-undergraduate:
	typst watch src/undergraduate-thesis/thesis.typ build/thesis.pdf

# Help
help:
	@echo "ITS Thesis Typst Template"
	@echo "========================"
	@echo ""
	@echo "Targets:"
	@echo "  all (default)      - Build master's thesis PDF"
	@echo "  master             - Build master's thesis PDF"
	@echo "  undergraduate      - Build undergraduate thesis PDF"
	@echo "  clean              - Remove build artifacts"
	@echo "  watch-master       - Watch & live preview for master's thesis"
	@echo "  watch-undergraduate- Watch & live preview for undergraduate thesis"
	@echo ""
	@echo "Usage:"
	@echo "  make               # Build master's thesis"
	@echo "  make undergraduate  # Build undergraduate thesis"
	@echo "  make watch-master   # Live preview for master's thesis"
	@echo ""
	@echo "Files to edit:"
	@echo "  src/master-thesis/thesis.typ        - Master's config + content"
	@echo "  src/undergraduate-thesis/thesis.typ - Undergraduate config + content"
	@echo "  src/*/template.typ                  - Layout and styling"
