---
expertise: voice-to-llm-pipeline
category: architecture
source: ielts-bot
verified: true
date: 2026-04-30
---

# Voice-to-LLM Scoring Pipeline

End-to-end pipeline: user voice note → text transcript → LLM rubric grading → structured feedback.

## Pipeline stages

1. **Capture**: Telegram voice message (OGG/Opus container)
2. **Persist**: download via Telegram file API, save with `.ogg` extension
3. **Transcribe**: Groq Whisper-large-v3 (free tier), `audio.transcriptions.create()` with `language: 'en'`, `response_format: 'verbose_json'`
4. **Score**: Groq Llama-3.3-70b-versatile, JSON mode (`response_format: { type: 'json_object' }`), system prompt locks output schema
5. **Format**: parse JSON → render Telegram Markdown reply with band scores + strengths + improvements + sample better answer
6. **Persist score**: SQLite session row with userId, part, question, transcript, all band scores, full feedback JSON
7. **Cleanup**: unlink temp audio file in `finally` block

## Rubric prompt design

System prompt encodes:
- Examiner role + which descriptors to grade (Fluency, Lexical, Grammar — skip Pronunciation since input is text)
- Calibration anchors (band 6.0–6.5 = typical; 8.0+ rare; 4.0–5.0 = fragmented)
- Strict JSON schema with no markdown fences
- Strengths must reference actual words/phrases used (forces specificity)
- Sample better answer at fixed band level (7.5) and word range (40–70)

User prompt includes the original question for context.

`temperature: 0.4` balances consistency with natural variation in feedback wording.

## Vendor swap pattern

When Gemini free tier was blocked by region, swapped to Groq Llama with no contract changes:
- Same JSON schema
- Same system prompt structure
- Single file change (`src/ai/score.js`)

Lesson: design AI calls around stable JSON contracts, not vendor-specific features. Easy vendor swaps.
