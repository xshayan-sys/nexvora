# nexvorai shared video publishing

This version replaces browser-only localStorage publishing with Supabase Storage + Postgres. The admin can choose videos from a phone/computer gallery, upload them, and publish project records that every visitor can read.

## Setup

1. Create a Supabase project.
2. In Authentication, create one admin user with an email and password. Do not enable public sign-up.
3. Open SQL Editor and run `supabase.sql`.
4. Copy `supabase-config.example.js` to `supabase-config.js`.
5. Put your Supabase Project URL and anon/public key in `supabase-config.js`. Never use the service_role key in browser code.
6. Upload `index.html`, `admin.html`, `supabase-config.js`, `supabase.sql` (optional) and the `assets` folder to Vercel.
7. Open `/admin.html`, log in with the one Supabase admin account, choose a video from your gallery and click **Upload and publish**.

## Files

- `index.html`: public page that reads projects from Supabase.
- `admin.html`: authenticated upload/edit/delete panel.
- `supabase-config.example.js`: configuration template.
- `supabase.sql`: table, bucket and RLS policies.

## Why this fixes visibility

The video file is stored in a public Supabase Storage bucket and its URL plus project metadata are stored in the shared `projects` table. The public page queries that table, so the project is not limited to one browser.

## Security

The public page can read published projects, while only authenticated users can insert, update or delete. Keep public sign-up disabled and create only your one admin account.
