# Contributing to Web3 RPC Sender

First off, thanks for taking the time to contribute! 🎉

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues. When you create a bug report, include as many details as possible:

- Use a clear and descriptive title
- Describe the exact steps to reproduce the problem
- Provide specific examples
- Describe the behavior you observed and what you expected
- Include screenshots if relevant
- Note your environment (OS, browser, etc.)

### Suggesting Features

Feature suggestions are welcome! Please:

- Use a clear and descriptive title
- Provide a detailed description of the suggested feature
- Explain why this feature would be useful
- Provide examples of how it would be used

### Pull Requests

1. Fork the repo
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes thoroughly
5. Update documentation if needed
6. Update CHANGELOG.md
7. Commit your changes (`git commit -m 'Add amazing feature'`)
8. Push to the branch (`git push origin feature/amazing-feature`)
9. Open a Pull Request

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/web3-rpc-sender.git
cd web3-rpc-sender

# Install dependencies
npm install

# Run locally
npm start
# or
npm run web
```

## Code Style Guidelines

- Use clear, descriptive variable names
- Comment complex logic
- Keep functions focused and small
- Follow existing code formatting
- Test in multiple browsers

## Adding New Methods

To add new RPC methods to `methods.json`:

```json
{
  "name": "Human Readable Name",
  "method": "eth_methodName",
  "params": [
    {
      "name": "paramName",
      "type": "string|number|boolean|object",
      "placeholder": "Example value",
      "required": true,
      "default": "optional default"
    }
  ],
  "description": "What this method does"
}
```

## Commit Messages

Use clear commit messages:

- `feat: add new method to methods.json`
- `fix: resolve JSON parsing error`
- `docs: update README deployment section`
- `style: improve button hover effects`
- `refactor: simplify endpoint validation`

## Versioning

We use [SemVer](https://semver.org/). When making changes:

- **PATCH** (0.0.x): Bug fixes
- **MINOR** (0.x.0): New features (backwards compatible)
- **MAJOR** (x.0.0): Breaking changes

Update `package.json` version and `CHANGELOG.md` accordingly.

## Questions?

Feel free to open an issue with your question or reach out to the maintainers.

Thank you! 🚀
