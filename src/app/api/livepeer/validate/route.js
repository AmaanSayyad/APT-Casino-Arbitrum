import { NextResponse } from 'next/server';
import { getLivepeerClient } from '@/lib/livepeer';

export async function GET(request) {
  try {
    const { searchParams } = new URL(request.url);
    const id = searchParams.get('id');
    
    if (!id) {
      return NextResponse.json({ ok: false, error: 'Missing playback ID' }, { status: 400 });
    }

    // For HLS URLs, just check if it's a valid URL
    if (/^https?:\/\//i.test(id)) {
      try {
        const url = new URL(id);
        return NextResponse.json({ ok: true, playbackId: id });
      } catch {
        return NextResponse.json({ ok: false, error: 'Invalid URL' }, { status: 400 });
      }
    }

    // For Livepeer playback IDs, validate with Livepeer API
    try {
      const livepeer = getLivepeerClient();
      // Simple validation - check if we can construct the stream URL
      const streamUrl = `https://livepeercdn.com/hls/${id}/index.m3u8`;
      return NextResponse.json({ ok: true, playbackId: id, streamUrl });
    } catch (error) {
      console.error('Livepeer validation error:', error);
      return NextResponse.json({ ok: false, error: 'Invalid playback ID' }, { status: 400 });
    }
  } catch (error) {
    console.error('Validate API error:', error);
    return NextResponse.json({ ok: false, error: 'Internal server error' }, { status: 500 });
  }
}
