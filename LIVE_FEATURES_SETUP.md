# Live Chat & Live Streaming Setup Guide

This guide explains how to set up the Live Chat and Live Streaming features in APT-Casino.

## Features Added

1. **Live Chat** - Real-time chat widget for players to communicate
2. **Live Streaming** - Watch live casino streams (supports Livepeer and YouTube)

## Prerequisites

- Supabase account (for chat and stream storage)
- Livepeer API key (optional - for streaming metrics)

## Setup Steps

### 1. Create Supabase Project

1. Go to https://supabase.com and create a free account
2. Create a new project
3. Wait for the project to be ready (~2 minutes)

### 2. Create Database Tables

In your Supabase project, go to **SQL Editor** and run these queries:

```sql
-- Create chat_messages table
CREATE TABLE chat_messages (
  id BIGSERIAL PRIMARY KEY,
  wallet_address TEXT NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create index for faster queries
CREATE INDEX idx_chat_messages_created_at ON chat_messages(created_at DESC);

-- Enable Row Level Security (RLS)
ALTER TABLE chat_messages ENABLE ROW LEVEL SECURITY;

-- Create policy to allow public read
CREATE POLICY "Allow public read access" ON chat_messages
  FOR SELECT USING (true);

-- Create policy to allow public insert
CREATE POLICY "Allow public insert access" ON chat_messages
  FOR INSERT WITH CHECK (true);

-- Create streams table
CREATE TABLE streams (
  id BIGSERIAL PRIMARY KEY,
  playback_id TEXT NOT NULL UNIQUE,
  source TEXT DEFAULT 'livepeer',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Create index
CREATE INDEX idx_streams_created_at ON streams(created_at DESC);

-- Enable RLS
ALTER TABLE streams ENABLE ROW LEVEL SECURITY;

-- Allow public read
CREATE POLICY "Allow public read access" ON streams
  FOR SELECT USING (true);

-- Allow public insert
CREATE POLICY "Allow public insert access" ON streams
  FOR INSERT WITH CHECK (true);
```

### 3. Get Supabase Credentials

1. In your Supabase project, go to **Settings** → **API**
2. Copy the following:
   - **Project URL** (e.g., `https://xxxxx.supabase.co`)
   - **anon/public key** (starts with `eyJ...`)

### 4. Update Environment Variables

Add these to your `.env` file:

```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here

# Livepeer (Optional - for streaming)
NEXT_PUBLIC_LIVEPEER_API_KEY=your-livepeer-api-key
```

### 5. (Optional) Get Livepeer API Key

1. Go to https://livepeer.studio
2. Create a free account
3. Create an API key
4. Add it to your `.env` as shown above

## How to Use

### Live Chat

1. Click the **"Live Chat"** button in the navbar
2. Start typing messages
3. Messages are visible to all users in real-time
4. Wallet addresses are shown as shortened format (0x1234...5678)

### Live Streaming

1. Navigate to `/live` page (or click "Live" in navbar)
2. Add streams in 3 ways:
   - **Livepeer Playback ID**: e.g., `f5eese9wwl88k4g8`
   - **HLS URL**: e.g., `https://example.com/stream.m3u8`
   - **YouTube Live URL**: e.g., `https://youtu.be/xxxxx` or `https://youtube.com/watch?v=xxxxx`

3. Click **"Add"** to add the stream
4. Watch multiple streams in a grid layout

## Features

### Live Chat
- ✅ Real-time messaging with Supabase Realtime
- ✅ Fallback polling if Realtime is unavailable
- ✅ Minimizable chat widget
- ✅ Shows wallet addresses (shortened)
- ✅ Guest mode for non-connected users

### Live Streaming
- ✅ Multiple stream sources (Livepeer, HLS, YouTube)
- ✅ Live metrics for Livepeer streams
- ✅ YouTube metadata (title, channel)
- ✅ Copy stream URLs
- ✅ Grid layout for multiple streams
- ✅ How-to guide modal

## Troubleshooting

### Chat not working?
- Check Supabase credentials in `.env`
- Verify tables are created in Supabase
- Check RLS policies are enabled
- Check browser console for errors

### Streams not loading?
- For Livepeer: Verify API key is set
- For YouTube: Check the URL format
- For HLS: Ensure URL is accessible

### No real-time updates?
- Supabase Realtime requires database replication to be enabled
- The app automatically falls back to polling if Realtime is unavailable
- Check Supabase project settings → Database → Replication

## Notes

- Live Chat is stored in Supabase (persistent across sessions)
- Streams are stored in Supabase (shared across all users)
- Livepeer API key is optional - app works without it
- YouTube streams don't require any API keys
