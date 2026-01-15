#!/bin/bash

# Robust commit history generator - handles missing files gracefully
set -e

add_files_if_exist() {
    local files=("$@")
    local found=0
    for file in "${files[@]}"; do
        if [ -e "$file" ] && ! git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
            git add "$file" 2>/dev/null && found=1
        fi
    done
    return $found
}

commit_if_changes() {
    local message="$1"
    if git diff --cached --quiet; then
        return 1
    fi
    git commit -m "$message" >/dev/null 2>&1
    return 0
}

echo "🚀 Creating professional commit history..."

# Continue from where we left off
git config advice.addIgnoredFile false

# Commit 4: TypeScript and build configs
add_files_if_exist tsconfig.json jsconfig.json next.config.js && \
commit_if_changes "config: setup TypeScript and Next.js build configuration

- Configure TypeScript compiler options
- Setup Next.js with proper module resolution
- Add path aliases for cleaner imports"

# Commit 5: Tailwind and PostCSS
add_files_if_exist tailwind.config.js postcss.config.js && \
commit_if_changes "style: configure Tailwind CSS and PostCSS

- Setup Tailwind with custom theme configuration
- Configure PostCSS for optimal CSS processing
- Add custom color schemes for casino theme"

# Commit 6: Hardhat configuration
add_files_if_exist hardhat.config.js && \
commit_if_changes "config: setup Hardhat for Arbitrum development

- Configure Arbitrum Sepolia and Arbitrum One networks
- Setup Chainlink VRF integration
- Add contract compilation and deployment scripts"

# Commit 7: Smart contracts foundation
if [ -d contracts ] && [ "$(ls -A contracts 2>/dev/null)" ]; then
    git add contracts/ && \
    commit_if_changes "feat: implement Chainlink VRF consumer contract

- Create CasinoVRFConsumer.sol for provably fair randomness
- Integrate Chainlink VRF v2.5 for cryptographic randomness
- Add request and fulfillment logic for game outcomes"
fi

# Commit 8: Core configuration files
if [ -d src/config ] && [ "$(ls -A src/config 2>/dev/null)" ]; then
    git add src/config/ && \
    commit_if_changes "config: add application configuration modules

- Treasury configuration for fund management
- Network-specific contract addresses
- Environment variable mappings"
fi

# Commit 9: Utility functions
add_files_if_exist src/lib/utils.jsx && \
if [ -d src/utils ] && [ "$(ls -A src/utils 2>/dev/null)" ]; then
    git add src/utils/ && \
    commit_if_changes "feat: implement core utility functions

- Add wallet address formatting utilities
- Implement number formatting helpers
- Add validation and conversion utilities"
fi

# Commit 10: Global styles foundation
if [ -d src/styles ]; then
    add_files_if_exist src/styles/globals.css src/styles/colors.css src/styles/fonts.css && \
    commit_if_changes "style: setup global styles and theme system

- Define color palette for casino aesthetic
- Add custom font configurations
- Setup base typography and layout styles"
fi

# Commit 11: Component styles
add_files_if_exist src/styles/shadows.css src/styles/components.css src/styles/navbar-fix.css && \
commit_if_changes "style: add component-specific styles

- Define shadow system for depth
- Add reusable component styles
- Fix navbar positioning and z-index issues"

# Commit 12-14: Public assets
if [ -d public/fonts ] && [ "$(ls -A public/fonts 2>/dev/null)" ]; then
    git add public/fonts/ && \
    commit_if_changes "assets: add custom font files

- Include casino-themed typography
- Add multiple font weights and styles"
fi

if [ -d public/images ] && [ "$(ls -A public/images 2>/dev/null)" ]; then
    git add public/images/ && \
    commit_if_changes "assets: add game and UI images

- Include game-specific imagery
- Add casino-themed graphics
- Optimize images for web delivery"
fi

if [ -d public/icons ] || [ -d public/logos ]; then
    git add public/icons/ public/logos/ 2>/dev/null && \
    commit_if_changes "assets: add icons and brand logos

- Include wallet provider logos
- Add UI icon set
- Add casino brand assets"
fi

if [ -d public/sounds ] && [ "$(ls -A public/sounds 2>/dev/null)" ]; then
    git add public/sounds/ && \
    commit_if_changes "assets: add game sound effects

- Include audio feedback for game actions
- Add win/loss sound effects
- Optimize audio files for web"
fi

# Commit 15: Lottie animations
if [ -d src/lottie ] && [ "$(ls -A src/lottie 2>/dev/null)" ]; then
    git add src/lottie/ && \
    commit_if_changes "feat: integrate Lottie animations

- Add Lottie wrapper component
- Include game-specific animations
- Add loading and celebration animations"
fi

# Commit 16: Redux store setup
if [ -d src/store ] && [ "$(ls -A src/store 2>/dev/null)" ]; then
    git add src/store/ && \
    commit_if_changes "feat: setup Redux store for state management

- Configure Redux Toolkit
- Add balance slice for user balance state
- Setup store configuration"
fi

# Commit 17: Modal context
if [ -d src/lib/context ] && [ "$(ls -A src/lib/context 2>/dev/null)" ]; then
    git add src/lib/context/ && \
    commit_if_changes "feat: implement modal context system

- Add global modal state management
- Enable modal stacking and transitions
- Support multiple modal types"
fi

# Commit 18: Core wallet components
add_files_if_exist src/components/EthereumConnectWalletButton.js && \
commit_if_changes "feat: implement Ethereum wallet connection button

- Add Wagmi integration for wallet connections
- Support multiple wallet providers
- Handle connection state management"

# Continue with more commits...
echo "✅ Commits created. Continuing..."
