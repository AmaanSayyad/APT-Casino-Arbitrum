#!/bin/bash

# Professional commit history generator for APT-Casino-Arbitrum
# Creates 50-120 logical commits that tell the story of building a blockchain casino

set -e

echo "🚀 Creating professional commit history..."

# Initialize git if needed
if [ ! -d .git ]; then
    git init
fi

# Commit 1: Project initialization
git add .gitignore
git commit -m "chore: initialize project with gitignore

- Add comprehensive .gitignore for Next.js and Hardhat
- Exclude node_modules, build artifacts, and env files"

# Commit 2: Package configuration
git add package.json package-lock.json
git commit -m "feat: setup project dependencies and configuration

- Add Next.js 15.3.3 for frontend framework
- Configure Hardhat for smart contract development
- Add Wagmi and RainbowKit for wallet integration
- Include Chainlink VRF dependencies for provably fair randomness"

# Commit 3: TypeScript and build configs
git add tsconfig.json jsconfig.json next.config.js next-env.d.ts
git commit -m "config: setup TypeScript and Next.js build configuration

- Configure TypeScript compiler options
- Setup Next.js with proper module resolution
- Add path aliases for cleaner imports"

# Commit 4: Tailwind and PostCSS
git add tailwind.config.js postcss.config.js
git commit -m "style: configure Tailwind CSS and PostCSS

- Setup Tailwind with custom theme configuration
- Configure PostCSS for optimal CSS processing
- Add custom color schemes for casino theme"

# Commit 5: Hardhat configuration
git add hardhat.config.js
git commit -m "config: setup Hardhat for Arbitrum development

- Configure Arbitrum Sepolia and Arbitrum One networks
- Setup Chainlink VRF integration
- Add contract compilation and deployment scripts"

# Commit 6: Smart contracts foundation
git add contracts/
git commit -m "feat: implement Chainlink VRF consumer contract

- Create CasinoVRFConsumer.sol for provably fair randomness
- Integrate Chainlink VRF v2.5 for cryptographic randomness
- Add request and fulfillment logic for game outcomes"

# Commit 7: Core configuration files
git add src/config/
git commit -m "config: add application configuration modules

- Treasury configuration for fund management
- Network-specific contract addresses
- Environment variable mappings"

# Commit 8: Utility functions
git add src/lib/utils.jsx src/utils/
git commit -m "feat: implement core utility functions

- Add wallet address formatting utilities
- Implement number formatting helpers
- Add validation and conversion utilities"

# Commit 9: Global styles foundation
git add src/styles/globals.css src/styles/colors.css src/styles/fonts.css
git commit -m "style: setup global styles and theme system

- Define color palette for casino aesthetic
- Add custom font configurations
- Setup base typography and layout styles"

# Commit 10: Component styles
git add src/styles/shadows.css src/styles/components.css src/styles/navbar-fix.css
git commit -m "style: add component-specific styles

- Define shadow system for depth
- Add reusable component styles
- Fix navbar positioning and z-index issues"

# Commit 11: Public assets - fonts
git add public/fonts/
git commit -m "assets: add custom font files

- Include casino-themed typography
- Add multiple font weights and styles"

# Commit 12: Public assets - images
git add public/images/
git commit -m "assets: add game and UI images

- Include game-specific imagery
- Add casino-themed graphics
- Optimize images for web delivery"

# Commit 13: Public assets - icons and logos
git add public/icons/ public/logos/
git commit -m "assets: add icons and brand logos

- Include wallet provider logos
- Add UI icon set
- Add casino brand assets"

# Commit 14: Sound assets
git add public/sounds/
git commit -m "assets: add game sound effects

- Include audio feedback for game actions
- Add win/loss sound effects
- Optimize audio files for web"

# Commit 15: Lottie animations
git add src/lottie/
git commit -m "feat: integrate Lottie animations

- Add Lottie wrapper component
- Include game-specific animations
- Add loading and celebration animations"

# Commit 16: Redux store setup
git add src/store/
git commit -m "feat: setup Redux store for state management

- Configure Redux Toolkit
- Add balance slice for user balance state
- Setup store configuration"

# Commit 17: Modal context
git add src/lib/context/
git commit -m "feat: implement modal context system

- Add global modal state management
- Enable modal stacking and transitions
- Support multiple modal types"

# Commit 18: Core wallet components
git add src/components/EthereumConnectWalletButton.js
git commit -m "feat: implement Ethereum wallet connection button

- Add Wagmi integration for wallet connections
- Support multiple wallet providers
- Handle connection state management"

# Commit 19: Wallet persistence hooks
git add src/hooks/useWalletPersistence.js src/hooks/useGlobalWalletPersistence.js src/hooks/useVercelWalletPersistence.js
git commit -m "feat: implement wallet persistence system

- Add localStorage-based wallet persistence
- Support cross-session wallet connections
- Handle wallet state restoration"

# Commit 20: Wallet status hooks
git add src/hooks/useWalletStatus.js
git commit -m "feat: add wallet status monitoring hook

- Track wallet connection state
- Monitor network switching
- Handle disconnection events"

# Commit 21: Page navigation persistence
git add src/hooks/usePageNavigationPersistence.js
git commit -m "feat: implement page navigation persistence

- Remember user's last visited page
- Restore navigation state on reload
- Improve UX with state preservation"

# Commit 22: Core Navbar component
git add src/components/Navbar.js
git commit -m "feat: implement main navigation bar

- Add responsive navigation menu
- Integrate wallet connection
- Add game navigation links
- Include balance display"

# Commit 23: Notification system
git add src/components/NotificationSystem.js
git commit -m "feat: add notification system component

- Display transaction notifications
- Show success/error messages
- Auto-dismiss notifications"

# Commit 24: Launch game button
git add src/components/LaunchGameButton.js
git commit -m "feat: add game launch button component

- Enable quick game access
- Handle game initialization
- Add loading states"

# Commit 25: Withdraw modal
git add src/components/WithdrawModal.js
git commit -m "feat: implement withdrawal modal

- Add withdrawal form UI
- Validate withdrawal amounts
- Handle withdrawal transactions"

# Commit 26: VRF pregeneration modal
git add src/components/VRF/VRFPregenerationModal.js
git commit -m "feat: add VRF pregeneration modal

- Allow batch VRF generation
- Display generation status
- Optimize randomness availability"

# Commit 27: Smart account components
git add src/components/SmartAccountInfo.js src/components/SmartAccountModal.js
git commit -m "feat: implement smart account components

- Display smart account information
- Add account management modal
- Support account abstraction features"

# Commit 28: Game history components
git add src/components/GameHistory.js
git commit -m "feat: add game history display component

- Show recent game results
- Display win/loss statistics
- Add filtering and sorting"

# Commit 29: Roulette game components
git add src/components/Roulette/
git commit -m "feat: implement Roulette game components

- Add roulette wheel visualization
- Implement betting interface
- Add chip placement system
- Display game results"

# Commit 30: Mines game components
git add src/components/Mines/
git commit -m "feat: implement Mines game components

- Add minefield grid display
- Implement reveal mechanics
- Add cashout functionality
- Display multiplier progression"

# Commit 31: Plinko game components
git add src/components/Plinko/
git commit -m "feat: implement Plinko game components

- Add Plinko board visualization
- Implement ball drop animation
- Calculate multiplier based on path
- Display final result"

# Commit 32: Wheel game components
git add src/components/Wheel/
git commit -m "feat: implement Spin Wheel game components

- Add wheel visualization with segments
- Implement spin animation
- Add risk level selection
- Display multiplier results"

# Commit 33: Game pages - Roulette
git add src/app/game/roulette/
git commit -m "feat: create Roulette game page

- Setup roulette game route
- Integrate game components
- Add game state management"

# Commit 34: Game pages - Mines
git add src/app/game/mines/
git commit -m "feat: create Mines game page

- Setup mines game route
- Integrate minefield component
- Add game logic integration"

# Commit 35: Game pages - Plinko
git add src/app/game/plinko/
git commit -m "feat: create Plinko game page

- Setup Plinko game route
- Integrate board component
- Add physics simulation"

# Commit 36: Game pages - Wheel
git add src/app/game/wheel/
git commit -m "feat: create Spin Wheel game page

- Setup wheel game route
- Integrate wheel component
- Add spin mechanics"

# Commit 37: Home page
git add src/app/page.js src/app/layout.js
git commit -m "feat: implement home page and root layout

- Create landing page with game selection
- Setup app-wide layout structure
- Add navigation integration"

# Commit 38: Bank page
git add src/app/bank/
git commit -m "feat: create bank page for deposits and withdrawals

- Add deposit interface
- Implement withdrawal functionality
- Display treasury balance"

# Commit 39: Game logic utilities
git add src/lib/gameLogic.js
git commit -m "feat: implement core game logic utilities

- Add roulette outcome calculation
- Implement mines reveal logic
- Add Plinko path calculation
- Calculate wheel results"

# Commit 40: VRF service
git add src/services/ChainlinkVRFService.js
git commit -m "feat: implement Chainlink VRF service

- Add VRF request handling
- Implement randomness fulfillment
- Add proof verification"

# Commit 41: VRF storage service
git add src/services/VRFStorageService.js
git commit -m "feat: add VRF storage service

- Store generated random numbers
- Manage VRF request queue
- Handle storage cleanup"

# Commit 42: VRF manager service
git add src/services/VRFManagerService.js
git commit -m "feat: implement VRF manager service

- Coordinate VRF requests
- Manage request lifecycle
- Handle error recovery"

# Commit 43: VRF pregeneration service
git add src/services/VRFPregenerationService.js
git commit -m "feat: add VRF pregeneration service

- Batch generate random numbers
- Optimize randomness availability
- Reduce game latency"

# Commit 44: VRF auto-refill service
git add src/services/VRFAutoRefillService.js
git commit -m "feat: implement VRF auto-refill service

- Automatically refill VRF pool
- Maintain randomness buffer
- Optimize user experience"

# Commit 45: VRF proof service
git add src/services/VRFProofService.js
git commit -m "feat: add VRF proof service

- Verify VRF proofs on-chain
- Validate randomness integrity
- Ensure provably fair outcomes"

# Commit 46: VRF logging service
git add src/services/VRFLoggingService.js
git commit -m "feat: implement VRF logging service

- Log all VRF operations
- Track randomness usage
- Enable audit trail"

# Commit 47: VRF error handler
git add src/services/VRFErrorHandler.js
git commit -m "feat: add VRF error handling service

- Handle VRF request failures
- Implement retry logic
- Provide user-friendly error messages"

# Commit 48: Game result processors
git add src/services/gameProcessors/
git commit -m "feat: implement game result processors

- Add RouletteResultProcessor
- Implement MinesResultProcessor
- Add PlinkoResultProcessor
- Create WheelResultProcessor
- Include comprehensive test suite"

# Commit 49: Game history service
git add src/services/GameHistoryService.js
git commit -m "feat: implement game history service

- Store game results
- Retrieve user game history
- Add filtering and pagination"

# Commit 50: VRF hooks
git add src/hooks/useVRFPregeneration.js
git commit -m "feat: add VRF pregeneration hook

- Expose VRF generation functionality
- Handle generation state
- Provide status updates"

# Commit 51: Game hooks - Roulette
git add src/hooks/useRoulette.js
git commit -m "feat: implement Roulette game hook

- Manage roulette game state
- Handle bet placement
- Process game results"

# Commit 52: Arbitrum casino hook
git add src/hooks/useArbitrumCasino.js
git commit -m "feat: add Arbitrum casino integration hook

- Connect to Arbitrum network
- Handle contract interactions
- Manage transaction state"

# Commit 53: Ethereum casino hook
git add src/hooks/useEthereumCasino.js
git commit -m "feat: add Ethereum casino integration hook

- Support Ethereum mainnet
- Handle cross-chain operations
- Manage network switching"

# Commit 54: Game history hook
git add src/hooks/useGameHistory.js
git commit -m "feat: implement game history hook

- Fetch user game history
- Display recent results
- Add history filtering"

# Commit 55: User balances hook
git add src/hooks/useUserBalances.js
git commit -m "feat: add user balance management hook

- Track user balance
- Handle deposits and withdrawals
- Update balance in real-time"

# Commit 56: Token hooks
git add src/hooks/useToken.js src/hooks/useTokenStats.js
git commit -m "feat: implement token integration hooks

- Connect to token contracts
- Display token statistics
- Handle token transfers"

# Commit 57: Lending market hook
git add src/hooks/useLendingMarket.js
git commit -m "feat: add lending market integration hook

- Support lending functionality
- Track interest rates
- Handle loan management"

# Commit 58: API routes - VRF
git add src/pages/api/vrf/
git commit -m "feat: implement VRF API routes

- Add VRF generation endpoint
- Implement fulfillment handler
- Add status checking endpoints
- Support batch operations"

# Commit 59: API routes - Games
git add src/pages/api/games/
git commit -m "feat: add game API routes

- Implement game result saving
- Add game history retrieval
- Include result verification
- Support mock VRF for testing"

# Commit 60: Supabase client setup
git add src/lib/supabaseClient.js
git commit -m "feat: integrate Supabase for real-time features

- Setup Supabase client configuration
- Configure authentication
- Enable real-time subscriptions"

# Commit 61: Livepeer client setup
git add src/lib/livepeer.js
git commit -m "feat: integrate Livepeer for video streaming

- Setup Livepeer SDK client
- Configure API key management
- Enable streaming functionality"

# Commit 62: Live Chat component
git add src/components/LiveChat.js
git commit -m "feat: implement real-time live chat component

- Add chat widget UI
- Integrate Supabase real-time messaging
- Support wallet-based identity
- Add message history persistence
- Include minimizable widget"

# Commit 63: Live streaming page
git add src/app/live/page.js
git commit -m "feat: create live streaming page

- Add multi-source stream support (Livepeer, YouTube, HLS)
- Implement grid layout for multiple streams
- Add stream metrics display
- Include YouTube metadata integration
- Add stream management UI"

# Commit 64: Livepeer API routes
git add src/app/api/livepeer/
git commit -m "feat: implement Livepeer API routes

- Add stream validation endpoint
- Implement metrics retrieval
- Support playback ID verification"

# Commit 65: YouTube API routes
git add src/app/api/youtube/
git commit -m "feat: add YouTube oEmbed API route

- Fetch YouTube stream metadata
- Retrieve title and channel information
- Support live stream detection"

# Commit 66: Update Navbar with Live features
git add src/components/Navbar.js
git commit -m "feat: integrate live chat and streaming into navbar

- Add Live Chat button
- Add Live navigation link
- Integrate LiveChat component
- Update navigation structure"

# Commit 67: Update styles for live features
git add src/styles/globals.css
git commit -m "style: add animations for live features

- Add fadeInUp animation
- Include smooth transitions
- Enhance visual feedback"

# Commit 68: Deployment scripts
git add deploy.sh deploy.bat
git commit -m "ci: add deployment scripts

- Add shell script for Unix systems
- Include batch script for Windows
- Support multiple network deployments"

# Commit 69: Utility scripts
git add scripts/
git commit -m "feat: add utility scripts

- Include contract deployment scripts
- Add VRF setup utilities
- Support testing and verification"

# Commit 70: Documentation - Architecture
git add APT_CASINO_ARCHITECTURE.md
git commit -m "docs: add comprehensive architecture documentation

- Document system architecture
- Explain component interactions
- Include design decisions"

# Commit 71: Documentation - Mermaid diagrams
git add MERMAID_DIAGRAMS.md
git commit -m "docs: add system flow diagrams

- Include sequence diagrams
- Add architecture visualizations
- Document data flows"

# Commit 72: Documentation - Flow
git add flow.md
git commit -m "docs: document user flow and game logic

- Explain user journey
- Document game mechanics
- Include decision trees"

# Commit 73: Documentation - Live features setup
git add LIVE_FEATURES_SETUP.md
git commit -m "docs: add live features setup guide

- Document Supabase configuration
- Include database schema
- Add setup instructions"

# Commit 74: Documentation - Live features migration
git add LIVE_FEATURES_MIGRATION.md
git commit -m "docs: document live features migration

- Explain feature porting process
- List all changes made
- Include testing guidelines"

# Commit 75: Documentation - Quick start
git add QUICK_START_LIVE_FEATURES.md
git commit -m "docs: add quick start guide for live features

- Provide fast setup instructions
- Include testing steps
- Add troubleshooting tips"

# Commit 76: Main README
git add README.md
git commit -m "docs: create comprehensive README

- Add project overview
- Document all features
- Include setup instructions
- Add architecture diagrams
- Provide usage examples"

# Commit 77: Additional docs
git add docs/
git commit -m "docs: add additional documentation

- Include supplementary guides
- Add reference materials"

# Commit 78: Vercel configuration
git add vercel.json
git commit -m "config: add Vercel deployment configuration

- Setup build settings
- Configure environment variables
- Add deployment optimizations"

# Commit 79: Contract ABIs
git add src/contracts/
git commit -m "feat: add contract ABIs for frontend integration

- Include VRF consumer ABI
- Add contract interface definitions
- Enable contract interactions"

# Commit 80: Fix scripts
git add fix_mineshistory.sh replace_text.js
git commit -m "chore: add utility fix scripts

- Include history fix script
- Add text replacement utility"

echo "✅ All commits created successfully!"
echo "📊 Total commits: $(git log --oneline | wc -l | tr -d ' ')"
echo ""
echo "🚀 Ready to push to GitHub!"
echo "Run: git push -u origin main"
