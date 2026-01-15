'use client';

import React, {
  createContext,
  useContext,
  useState,
  useEffect,
  useCallback,
} from 'react';
import { useAccount, useConnect, useDisconnect } from 'wagmi';

const WalletStatusContext = createContext(null);

export function WalletStatusProvider({ children }) {
  // Always use real wallet - no dev wallet
  const isDev = false;

  const { 
    address: account,
    isConnected: connected,
    chain: network
  } = useAccount();
  
  const { connect, connectors } = useConnect();
  const { disconnect } = useDisconnect();

  const [devWallet, setDevWallet] = useState({
    isConnected: false,
    address: null,
    chain: null,
  });

  const [error, setError] = useState(null);

  useEffect(() => {
    if (!isDev) return;

    const savedState = localStorage.getItem('dev-wallet-state');
    if (savedState === 'connected') {
      setDevWallet({
        isConnected: true,
        address: '0x1234...dev',
        chain: { id: 'arbitrum_testnet', name: 'Arbitrum Sepolia' },
      });
    }

    const handleToggle = () => {
      setDevWallet((prev) => {
        const newState = !prev.isConnected;
        localStorage.setItem(
          'dev-wallet-state',
          newState ? 'connected' : 'disconnected'
        );

        return newState
          ? {
              isConnected: true,
              address: '0x1234...dev',
              chain: { id: 'arbitrum_testnet', name: 'Arbitrum Sepolia' },
            }
          : {
              isConnected: false,
              address: null,
              chain: null,
            };
      });
    };

    window.addEventListener('dev-wallet-toggle', handleToggle);
    return () => {
      window.removeEventListener('dev-wallet-toggle', handleToggle);
    };
  }, [isDev]);

  const connectWallet = useCallback(async () => {
    if (isDev) {
      localStorage.setItem('dev-wallet-state', 'connected');
      setDevWallet({
        isConnected: true,
        address: '0x1234...dev',
        chain: { id: 'arbitrum_testnet', name: 'Arbitrum Sepolia' },
      });
      return;
    }

    try {
      // MetaMask ile bağlan
      const metaMaskConnector = connectors.find(connector => connector.id === 'metaMask');
      if (metaMaskConnector) {
        await connect({ connector: metaMaskConnector });
      } else {
        setError('MetaMask connector not found');
      }
    } catch (err) {
      setError('Failed to connect to MetaMask: ' + err.message);
    }
  }, [connect, connectors, isDev]);

  const disconnectWallet = useCallback(async () => {
    if (isDev) {
      localStorage.setItem('dev-wallet-state', 'disconnected');
      setDevWallet({
        isConnected: false,
        address: null,
        chain: null,
      });
      return;
    }

    try {
      await disconnect();
    } catch (err) {
      setError('Failed to disconnect wallet: ' + err.message);
    }
  }, [disconnect, isDev]);

  const resetError = useCallback(() => {
    setError(null);
  }, []);

  const currentStatus = {
    isConnected: !!connected && !!account, // Only connected if we have both connected and address
    address: account, // account is already the address string
    chain: network,
  };

  // Debug currentStatus calculation
  console.log('🔍 currentStatus calculation:', {
    connected,
    account,
    accountAddress: account, // account is already the address
    network,
    finalIsConnected: !!connected && !!account
  });

  useEffect(() => {
    // Only run on client side
    if (typeof window === 'undefined') return;

    console.log('🔌 Arbitrum Wallet connection changed:');
    console.log('=== CURRENT STATUS ===');
    console.log('Connected:', currentStatus.isConnected);
    console.log('Address:', currentStatus.address);
    console.log('Chain:', currentStatus.chain);
    console.log('=== RAW WAGMI VALUES ===');
    console.log('Raw connected:', connected);
    console.log('Raw account:', account);
    console.log('Raw network:', network);
    console.log('=== ENVIRONMENT ===');
    console.log('Is Dev:', isDev);
    console.log('Dev Wallet:', devWallet);
    console.log('=== LOCAL STORAGE ===');
    try {
      console.log('Dev wallet state:', localStorage.getItem('dev-wallet-state'));
      console.log('Wagmi storage:', localStorage.getItem('aptcasino.wallet'));
    } catch (error) {
      console.warn('Error accessing localStorage:', error);
    }
    console.log('=== WINDOW ETHEREUM ===');
    const hasEthereum = typeof window !== 'undefined' && window.ethereum;
    console.log('Window ethereum exists:', !!hasEthereum);
    // Safely check window.ethereum connection status with error handling
    // Note: We use wagmi's connection status as the source of truth, not window.ethereum.isConnected
    // This avoids issues with MetaMask's internal state not being ready
    if (hasEthereum) {
      try {
        // Only access selectedAddress, which is safer than calling isConnected()
        const selectedAddress = window.ethereum?.selectedAddress;
        console.log('Window ethereum selectedAddress:', selectedAddress);
        // Check if isConnected exists as a property (not calling it as a function)
        if ('isConnected' in window.ethereum && typeof window.ethereum.isConnected !== 'function') {
          console.log('Window ethereum isConnected (property):', window.ethereum.isConnected);
        } else if ('isConnected' in window.ethereum) {
          console.log('Window ethereum isConnected exists (function, not calling to avoid errors)');
        }
      } catch (error) {
        console.warn('Error accessing ethereum properties:', error);
      }
    }
  }, [currentStatus, connected, account, network, isDev, devWallet]);

  return (
    <WalletStatusContext.Provider
      value={{
        ...currentStatus,
        isDev,
        connectWallet,
        disconnectWallet,
        resetError,
        error,
      }}
    >
      {children}
    </WalletStatusContext.Provider>
  );
}

export default function useWalletStatus() {
  const context = useContext(WalletStatusContext);
  if (!context) {
    throw new Error('useWalletStatus must be used within a WalletStatusProvider');
  }
  return context;
}
