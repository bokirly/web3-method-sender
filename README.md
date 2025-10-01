# Web3 RPC Sender App

[![Deploy to GitHub Pages](https://github.com/YOUR_USERNAME/web3-rpc-sender/workflows/Deploy%20to%20GitHub%20Pages/badge.svg)](https://github.com/YOUR_USERNAME/web3-rpc-sender/actions)
[![Version](https://img.shields.io/github/package-json/v/YOUR_USERNAME/web3-rpc-sender)](https://github.com/YOUR_USERNAME/web3-rpc-sender)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A desktop and web application for sending Web3 RPC requests to multiple endpoints simultaneously.

## Features

- 🚀 Send requests to multiple RPC endpoints at once
- 📋 Pre-configured Web3 methods (eth_blockNumber, eth_getBalance, etc.)
- ⚙️ Easy-to-use method database (methods.json)
- 📊 Side-by-side response comparison
- ⏱️ Response time tracking
- 💾 Copy responses to clipboard

## Installation

```bash
npm install
```

## Usage

### Desktop App (Electron)

Run the desktop application:

```bash
npm start
```

Build the desktop app for distribution:

```bash
npm run build
```

### Web Version

Run as a web server:

```bash
npm run web
```

Then open http://localhost:3000 in your browser.

### Deploy to Web

You can deploy this to any hosting service that supports Node.js:

**Vercel:**
```bash
npm install -g vercel
vercel
```

**Heroku:**
```bash
git init
heroku create your-app-name
git add .
git commit -m "Initial commit"
git push heroku main
```

**Railway/Render:**
- Connect your GitHub repo
- Set build command: `npm install`
- Set start command: `node server.js`

## Customizing Methods

Edit `methods.json` to add, remove, or modify RPC methods. The structure is:

```json
{
  "methods": [
    {
      "name": "Display Name",
      "method": "rpc_method_name",
      "params": [
        {
          "name": "paramName",
          "type": "string|number|boolean|object",
          "placeholder": "Example value",
          "required": true,
          "default": "optional default value"
        }
      ],
      "description": "What this method does"
    }
  ]
}
```

## Example RPC Endpoints

- Ethereum Mainnet (Alchemy): `https://eth-mainnet.g.alchemy.com/v2/YOUR-API-KEY`
- Ethereum Mainnet (Infura): `https://mainnet.infura.io/v3/YOUR-PROJECT-ID`
- Base: `https://base-mainnet.g.alchemy.com/v2/YOUR-API-KEY`
- Arbitrum: `https://arb-mainnet.g.alchemy.com/v2/YOUR-API-KEY`
- Tenderly VNet: `https://virtual.mainnet.rpc.tenderly.co/YOUR-VNET-ID`

## Tips

1. **Add Multiple Endpoints**: Click the "+ Add Endpoint" button to test the same request across different providers
2. **Parameter Types**: 
   - Use JSON format for object parameters: `{"to": "0x...", "data": "0x..."}`
   - Addresses should include the `0x` prefix
   - Block parameters accept: `"latest"`, `"earliest"`, `"pending"`, or hex numbers like `"0x1234"`
3. **Reload Methods**: Click "Reload Methods" after editing methods.json to see changes without restarting

## License

MIT
