# Contributing to ITS-IF-THESIS-TYPST

Thank you for your interest in contributing to this project! This document provides guidelines and information for contributors.

## Getting Started

### Prerequisites

- [Typst](https://typst.app) compiler installed on your system
- Basic knowledge of Typst markup language
- Git for version control

### Development Setup

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/typst-its-if-thesis-template.git
   cd typst-its-if-thesis-template
   ```
3. Add the upstream remote:
   ```bash
   git remote add upstream https://github.com/ariffaizin/typst-its-if-thesis-template.git
   ```
4. Create a branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Making Changes

### Workflow

1. Keep your fork synchronized with upstream:
   ```bash
   git fetch upstream
   git checkout main
   git merge upstream/main
   ```

2. Make your changes in a new branch (never in `main`)

3. Build and test your changes:
   ```bash
   make master        # Build master's thesis PDF
   make undergraduate # Build undergraduate thesis PDF
   make clean         # Clean build artifacts
   ```

4. Verify that the PDFs compile correctly without errors

5. Commit your changes with clear, descriptive messages following [Conventional Commits](https://www.conventionalcommits.org/):
   ```
   feat: add new feature description
   fix: describe the bug fix
   docs: update documentation
   refactor: code restructuring
   test: add or update tests
   build: changes to build system
   ```

6. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

7. Create a Pull Request (PR) from your fork's branch to upstream's `main` branch

### Pull Request Guidelines

- Provide a clear description of the changes
- Link to any relevant issues
- Include screenshots or PDF samples if applicable (especially for visual/layout changes)
- Ensure all PDF builds succeed
- Keep PRs focused on a single concern (avoid mixing unrelated changes)

## Code Style & Conventions

- Follow the existing code style in [`template.typ`](src/undergraduate-thesis/template.typ) files
- Use meaningful variable and function names
- Add comments for complex logic
- Keep changes minimal and surgical
- Respect Typst syntax and best practices

### Typst Template Structure

- `template.typ` - Layout, styling, and configuration
- `thesis.typ` - Main entry point that imports template and content
- `content.typ` - User-editable content (chapters, sections, etc.)
- `bibliography.bib` - Bibliography references in BibTeX format

## Areas Needing Contribution

- Bug fixes for layout or formatting issues
- Feature enhancements for thesis formatting
- Improvements to documentation
- Additional examples and templates
- Translation support (i18n)
- Accessibility improvements

## Reporting Issues

When reporting issues, please include:

- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Typst version (`typst --version`)
- OS and compiler details
- Minimal code snippet or template that demonstrates the issue
- Screenshots or error messages

## License

By contributing, you agree that your contributions will be licensed under the [GNU GPL v3.0](LICENSE).

## Questions?

Feel free to open an issue for any questions about contributing to this project.

---

Thank you for helping improve the ITS thesis template! 🎓
