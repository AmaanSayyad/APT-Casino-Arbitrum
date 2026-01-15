import { NextResponse } from 'next/server';
import { getLivepeerClient } from '@/lib/livepeer';

export async function GET(request) {
  try {
    const { searchParams } = new URL(request.url);
    const playbackId = searchParams.get('playbackId');
    
    if (!playbackId) {
      return NextResponse.json({ error: 'Missing playback ID' }, { status: 400 });
    }

    // For now, return mock metrics since Livepeer API might not be configured
    // In production, you would call the Livepeer API to get real metrics
    const mockMetrics = {
      data: {
        viewers: Math.floor(Math.random() * 100) + 10,
        bitrate: Math.floor(Math.random() * 2000) + 500,
        resolution: '1080p',
        latency: Math.floor(Math.random() * 5) + 1
      }
    };

    return NextResponse.json(mockMetrics);
  } catch (error) {
    console.error('Metrics API error:', error);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}
